package com.iweb.service;

import java.math.BigDecimal;
import java.util.List;

import com.iweb.model.Info;
import com.iweb.model.Proorder;
import com.iweb.model.Type;
import com.iweb.utils.DataGrid;
import com.iweb.utils.Page;

public interface MerchandiseService {

	DataGrid queryTypeTree();

	List<Type> queryParentNodes();

	void addType(Type type);

	int deleteSelectTypes(Integer[] ids);

	void updateType(Type type);

	void queryInfos(DataGrid grid, Page page);

	List<Type> queryInfoType();

	Info insertInfo(Info info);

	void deleteInfos(BigDecimal[] ids);

	void saveEditInfo(Info info);

	DataGrid queryInfosStock(DataGrid grid,Page page);

	void saveInfoStock(Info info);

	void addOrder(Info info, Object attribute);

	void queryOrders(DataGrid grid, Page page);

	void deleteOrders(BigDecimal[] ids);

	void updateOrders(Proorder proorder);


}
