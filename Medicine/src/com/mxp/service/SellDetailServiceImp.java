package com.mxp.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.mxp.dao.BaseDao;
import com.mxp.dao.MedicineDao;
import com.mxp.dao.ShopCartDao;
import com.mxp.dao.UserDao;
import com.mxp.entity.TbMedicine;
import com.mxp.entity.TbShopcart;
import com.mxp.entity.TbUser;
import com.mxp.entity.VOrder;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public class SellDetailServiceImp implements SellDetailService {

	private ShopCartDao<TbShopcart> shopCartDao;

	private MedicineDao<TbMedicine> medicineDao;

	private BaseDao<VOrder> baseDao;

	public void setBaseDao(BaseDao<VOrder> baseDao) {
		this.baseDao = baseDao;
	}

	private UserDao<TbUser> userDao;

	public void setMedicineDao(MedicineDao<TbMedicine> medicineDao) {
		this.medicineDao = medicineDao;
	}

	public void setUserDao(UserDao<TbUser> userDao) {
		this.userDao = userDao;
	}

	public void setShopCartDao(ShopCartDao<TbShopcart> shopCartDao) {
		this.shopCartDao = shopCartDao;
	}

	/**
	 * 防止并发
	 */
	public synchronized void saveBuy(List<TbShopcart> shopcarts) throws Exception {

		Long userid = getUserId();

		for (TbShopcart shop : shopcarts) {
			if (shop.getSellcount() > 0) {
				shop.setUserid(userid);
				shop.setSelltime(new Timestamp(System.currentTimeMillis()));
				shopCartDao.save(shop);
				TbMedicine m = medicineDao.findByID(TbMedicine.class, shop.getMedicine().getId());
				m.setMedcount(m.getMedcount() - shop.getSellcount());
				if (m.getMedcount() < 0) {
					throw new RuntimeException();
				}
			}
		}

	}

	public DataGrid findDataGrid(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();

		Long userid = getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userid);
		String hql = "select count(*) from TbShopcart where status='no' and userid =:userId";

		int counts = Integer.parseInt(shopCartDao.findUnique(hql, map).toString());

		hql = "from TbShopcart where status='no' and userid =:userId";

		List<TbShopcart> list = shopCartDao.findList(hql, map, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);

		return dataGrid;
	}

	public boolean modifyShopCart(String str) throws Exception {

		String[] ids = str.split(",");

		for (int i = 0; i < ids.length; i++) {
			if (ids[i] != null && !"".equals(ids[i])) {
				TbShopcart t = shopCartDao.findByID(TbShopcart.class, Long.parseLong(ids[i]));
				t.setStatus("yes");
			}
		}
		return true;
	}

	private Long getUserId() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();

		String username = String.valueOf(session.getAttribute("username"));

		String hql = "select id from TbUser where username = :name";
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("name", username);

		Long userid = Long.parseLong(userDao.findUnique(hql, map).toString());
		return userid;
	}

	public DataGrid findDataGridSelled(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();

		Long userid = getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userid);

		String hql = "select count(*) from TbShopcart where status='yes' and userid =:userId";

		int counts = Integer.parseInt(shopCartDao.findUnique(hql, map).toString());

		hql = "from TbShopcart where status='yes' and userid =:userId";

		List<TbShopcart> list = shopCartDao.findList(hql, map, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);

		return dataGrid;
	}

	public DataGrid findDataGridToday(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();

		Long userid = getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userid);
		String hql = "select count(*) from TbShopcart where status='yes' and userid =:userId and trunc(selltime) = trunc(sysdate)";

		int counts = Integer.parseInt(shopCartDao.findUnique(hql, map).toString());

		hql = "from TbShopcart where status='yes' and userid =:userId and trunc(selltime) = trunc(sysdate)";

		List<TbShopcart> list = shopCartDao.findList(hql, map, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);

		return dataGrid;
	}

	public DataGrid findDataGridorderSell(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from VOrder";

		int counts = Integer.parseInt(baseDao.findUnique(hql).toString());

		hql = "from VOrder";
		List<VOrder> list = baseDao.findList(hql, page, count);

		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);
		return dataGrid;
	}

	public DataGrid queryDate(String startTime, String endTime, Page page) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// System.out.println(sdf.format(startTime));
		if (startTime != null) {
			map.put("start", startTime);
		} else {
			map.put("start", sdf.format(new Date()));
		}
		if (endTime != null) {
			map.put("end", endTime);
		} else {
			map.put("end", sdf.format(new Date(System.currentTimeMillis() + 86400L)));
		}
		String hql = "select count(*) from TbShopcart where selltime "
				+ "between to_date(:start,'yyyy-mm-dd hh24:mi:ss') and  to_date(:end,'yyyy-mm-dd hh24:mi:ss')";

		long counts = Long.parseLong(shopCartDao.findUnique(hql, map).toString());
		long pages = counts % page.getCount() == 0 ? counts / page.getCount() : counts / page.getCount() + 1;
		hql = "from TbShopcart where selltime "
				+ "between to_date(:start,'yyyy-mm-dd hh24:mi:ss') and  to_date(:end,'yyyy-mm-dd hh24:mi:ss')";

		List<TbShopcart> list = shopCartDao.findList(hql, map, page.getPage(), page.getCount());
		DataGrid dg = new DataGrid();
		dg.setCounts(counts);
		dg.setPages(pages);
		dg.setRows(list);

		return dg;
	}

}
