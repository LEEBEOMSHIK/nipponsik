package product_detail_Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyListSvc;
import productDTO.ProductDTO;
import product_detail_Svc.Product_detail_Svc;
import vo.ActionForward;
import vo.PageInfo;

public class Product_detail_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int goods_code = 0;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		int pageNumber = 1;
		int limit = 5;
		if(request.getParameter("pageNumber")!=null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		GoodsReplyListSvc goodsReplyListSvc = new GoodsReplyListSvc();
		List<GoodsReplyDTO> list = goodsReplyListSvc.goodsReplyList(pageNumber);
		int listCount = goodsReplyListSvc.goodsReplyListCount();
		int maxPage = (int) Math.ceil(listCount/(double)limit);
		int startPage = ((pageNumber -1)/limit)*limit + 1;
		int endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setPage(pageNumber);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		
		Product_detail_Svc product_detail_Svc = new Product_detail_Svc();
		ProductDTO productDTO = product_detail_Svc.selectProductDTO(goods_code);
		
		request.setAttribute("productDTO", productDTO);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("goodsReplyList", list);
		
		forward = new ActionForward();
		forward.setPath("/product_detail.jsp?goods_code="+goods_code);
		
		return forward;
	}

}
