package com.mxp.service;

import com.mxp.entity.TbMedicine;

public interface RequireService {

	boolean modifyRequired(TbMedicine tbMedicine) throws Exception;

	boolean editRequired(String ids) throws Exception;

}
