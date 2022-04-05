package searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import action.Action;
import productDTO.ProductDTO;
import searchSvc.DetailCategorySearchSvc;
import vo.ActionForward;

public class DetailCategorySearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String detail_category = null;
		if(request.getParameter("detail_category") != null) {
			detail_category = request.getParameter("detail_category");
		}
		System.out.println(detail_category);
		
		DetailCategorySearchSvc detailCategorySearchSvc = new DetailCategorySearchSvc();
		List<ProductDTO> list = detailCategorySearchSvc.detailCategorySelectList(detail_category);
		request.setAttribute("detailCategoryList", list);
		
		int detailCategoryCount = detailCategorySearchSvc.detailCategorySelectCount(detail_category);
		request.setAttribute("detailCategoryCount", detailCategoryCount);
		
		forward = new ActionForward();
		forward.setPath("/detailCategorySearch.jsp");
		
		return forward;
	}

}
