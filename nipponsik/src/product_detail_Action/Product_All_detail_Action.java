package product_detail_Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyListCodeSvc;
import goodsReplySvc.GoodsReplyListSvc;
import productDTO.ProductDTO;
import product_detail_Svc.Product_detail_Svc;
import qnaGoodsDTO.QnaGoodsDTO;
import qnaGoodsSvc.QnaGoodsListSvc;
import vo.ActionForward;
import vo.PageInfo;

public class Product_All_detail_Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int goods_code = 0;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		//상품평 페이징 처리를 위함
		int pageNumber = 1;
		int limit = 5;
		if(request.getParameter("pageNumber")!=null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		//상품문의 페이징 처리를 위함
		int pageNumber2 = 1;
		if(request.getParameter("pageNumber2")!=null) {
			pageNumber2 = Integer.parseInt(request.getParameter("pageNumber2"));
		}
		
		//리플 상품 리스트, 페이지 처리 하기 위함
		GoodsReplyListCodeSvc goodsReplyListCodeSvc = new GoodsReplyListCodeSvc();
		List<GoodsReplyDTO> list = goodsReplyListCodeSvc.goodsReplyCodeList(goods_code, pageNumber);
		int listCount = goodsReplyListCodeSvc.goodsReplyListCodeCount(goods_code);
		int maxPage = (int) Math.ceil(listCount/(double)limit);
		int startPage = ((pageNumber -1)/limit)*limit + 1;  //이 부분이 문제가 있는 듯
		int endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(listCount);
		System.out.println(maxPage);
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(limit);
		System.out.println(pageNumber);
		
		//상품평에 대한 페이징 넘겨줌
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(listCount);
		pageInfo.setPage(pageNumber);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		
		//상품 내용 정보를 처리
		Product_detail_Svc product_detail_Svc = new Product_detail_Svc();
		ProductDTO productDTO = product_detail_Svc.selectProductDTO(goods_code);
		
		//q&a리스트 
		QnaGoodsListSvc qnaGoodsListSvc = new QnaGoodsListSvc();
		List<QnaGoodsDTO> list2 = qnaGoodsListSvc.qnaList(goods_code, pageNumber2);
		int listCount2 = qnaGoodsListSvc.qnaListCount();
		int maxPage2 = (int) Math.ceil(listCount2/(double)limit);
		int startPage2 = ((pageNumber2 -1)/limit)*limit + 1;
		int endPage2 = startPage2 + limit -1;
		
		if(endPage2 > maxPage2) {
			endPage2 = maxPage2;
		}
		
		System.out.println(listCount2);
		System.out.println(maxPage2);
		System.out.println(startPage2);
		System.out.println(endPage2);  //5
		System.out.println(pageNumber2);
		
		//상품 문의에 대한 페이징 넘겨줌
		PageInfo pageInfo2 = new PageInfo(); //다른 객체 생성하여 세팅
		pageInfo.setListCount(listCount2);
		pageInfo.setPage(pageNumber2);
		pageInfo.setStartPage(startPage2);
		pageInfo.setEndPage(endPage2);
		pageInfo.setMaxPage(maxPage2);
		
		request.setAttribute("productDTO", productDTO);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pageInfo2", pageInfo2);
		request.setAttribute("goodsReplyList", list);
		request.setAttribute("qnaList", list2);
		
		forward = new ActionForward();
		forward.setPath("/product_detail.jsp?goods_code="+goods_code);
		
		return forward;
	}

}
