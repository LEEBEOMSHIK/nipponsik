package qnaGoodsAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import qnaGoodsDTO.QnaGoodsDTO;
import qnaGoodsSvc.QnaGoodsListSvc;
import vo.ActionForward;
import vo.PageInfo;

public class QnaGoodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int goods_code = 0;
		int limit = 10;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		QnaGoodsListSvc qnaGoodsListSvc = new QnaGoodsListSvc();
		int listCount = qnaGoodsListSvc.qnaListCount();
		
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;  // 페이지 공식
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;
		
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setPage(page);
   		pageInfo.setMaxPage(maxPage);
   		pageInfo.setStartPage(startPage);
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
   		request.setAttribute("pageInfo", pageInfo);
   		
		ActionForward forward = null;
		qnaGoodsListSvc = new QnaGoodsListSvc();
		ArrayList<QnaGoodsDTO> list = qnaGoodsListSvc.qnaList(goods_code, page);
		request.setAttribute("qnaList", list);
		
		forward = new ActionForward();
		forward.setPath("/product_detail_"+goods_code+".jsp");
		
		return forward;
	}

}
