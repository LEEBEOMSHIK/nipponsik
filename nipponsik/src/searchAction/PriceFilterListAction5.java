package searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import productDTO.ProductDTO;
import searchSvc.PriceFilterListSvc;
import vo.ActionForward;

public class PriceFilterListAction5 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		PriceFilterListSvc priceFilterListSvc = new PriceFilterListSvc();
		List<ProductDTO> list = priceFilterListSvc.priceFilterList5();
		request.setAttribute("priceFilterList", list);
		
		int priceFilterListCount = priceFilterListSvc.priceFilterList5Count();
		request.setAttribute("priceFilterListCount", priceFilterListCount);
		
		forward = new ActionForward();
		forward.setPath("/priceFilter.jsp");
		return forward;
	}

}
