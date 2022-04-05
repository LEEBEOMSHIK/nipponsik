package searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import productDTO.ProductDTO;
import searchSvc.SelectCategorySearch;
import vo.ActionForward;

public class SelectCategorySearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String selectValue = "goods_code";  //goods_code로만 내용 전달 됨
		
		if(request.getParameter("seloption") != null) {
			if(request.getParameter("seloption").equals("newgoods_bunho")) {
				selectValue = "newgoods_bunho";
			} else if(request.getParameter("seloption").equals("goods_price")) {
				selectValue = "goods_price";
			} else if(request.getParameter("seloption").equals("goods_name")) {
				selectValue = "goods_name";
			}
		}
		System.out.println(selectValue);
		request.setAttribute("seloption", selectValue);
		
		int goods_category = 0;
		if(request.getParameter("goods_category") != null) {
			goods_category = Integer.parseInt(request.getParameter("goods_category"));
		}
		
		ActionForward forward = null;
		
		SelectCategorySearch selectCategorySearch = new SelectCategorySearch();
		List<ProductDTO> list = selectCategorySearch.selectCategory(goods_category,selectValue);
		request.setAttribute("selectList", list);
		
		int selectCategoryCount = selectCategorySearch.selectCategoryCount(goods_category,selectValue);
		request.setAttribute("selectListCount2", selectCategoryCount);
		
		forward = new ActionForward();
		forward.setPath("/productcategory.jsp");
		return forward;
	}

}
