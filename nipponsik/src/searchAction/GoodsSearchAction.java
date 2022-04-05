package searchAction;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import productDTO.ProductDTO;
import searchSvc.GoodsSearchService;
import vo.ActionForward;

public class GoodsSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String searchWord = null;
		if(request.getParameter("search") != null) {
			searchWord = request.getParameter("search");
		}
		
		if(searchWord == null || searchWord == "") {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('검색할 단어를 입력해주세요.')");
			out.println("$('#search').focus();");
			out.println("<script>");
		}
		
		ActionForward forward = null;
		GoodsSearchService goodsSearchService = new GoodsSearchService();
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = goodsSearchService.goodsSearch(searchWord);
		request.setAttribute("goodsList", list);
		request.setAttribute("searchWord", searchWord);
		
		int result = goodsSearchService.goodsSearchCount(searchWord);
		request.setAttribute("goodsSearchCount", result);
		
		forward = new ActionForward();
		forward.setPath("/productSearchCategory.jsp");
		
		return forward;
	}

}
