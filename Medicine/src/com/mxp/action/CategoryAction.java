package com.mxp.action;

import com.mxp.entity.TbCategory;
import com.mxp.service.CategorySercie;
import com.mxp.util.Page;

public class CategoryAction extends BaseAction {

	private TbCategory tbCategory;

	public void setTbCategory(TbCategory tbCategory) {
		this.tbCategory = tbCategory;
	}

	public TbCategory getTbCategory() {
		return tbCategory;
	}

	private CategorySercie categorySercie;

	public void setCategorySercie(CategorySercie categorySercie) {
		this.categorySercie = categorySercie;
	}

	public void category() throws Exception {

		if (page == null) {
			page = new Page();
		}
		JSONWrite(categorySercie.findDataGrid(page));

	}

	public void addcategory() throws Exception {
		boolean fals = false;
		if (tbCategory != null) {
			fals = categorySercie.saveCategory(tbCategory);
		}
		JSONWrite(fals);
	}

	public void remove() throws Exception {

		int count = 0;
		if (ids != null) {
			count = categorySercie.removeCategory(ids);
		}
		message = "删除了" + count + "条数据";
		JSONWrite(message);

	}

}
