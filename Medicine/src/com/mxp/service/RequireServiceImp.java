package com.mxp.service;

import com.mxp.dao.MedicineDao;
import com.mxp.entity.TbMedicine;

public class RequireServiceImp implements RequireService {

	private MedicineDao<TbMedicine> medicineDao;

	public void setMedicineDao(MedicineDao<TbMedicine> medicineDao) {
		this.medicineDao = medicineDao;
	}

	
	public boolean modifyRequired(TbMedicine tbMedicine) throws Exception {

		if (tbMedicine.getReqcount() != 0) {
			TbMedicine t = medicineDao.findByID(TbMedicine.class, tbMedicine.getId());
			t.setReqcount(tbMedicine.getReqcount());
			return true;
		}
		return false;
	}
	
	
	
	public boolean editRequired(String ids) throws Exception {
		
		String[] id_ = ids.split(",");
		
		for (String id : id_) {
			if(!"".equals(id.trim())){
				TbMedicine t = medicineDao.findByID(TbMedicine.class, Long.parseLong(id));
				t.setMedcount(t.getMedcount()+t.getReqcount());
				t.setReqcount(0l);
			}
		}
		return true;
	}

}
