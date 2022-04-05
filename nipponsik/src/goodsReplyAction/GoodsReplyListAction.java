package goodsReplyAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyListSvc;
import vo.ActionForward;
import vo.PageInfo;

public class GoodsReplyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int pageNumber = 1;
		int limit = 5;
		
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		int goods_code = 0;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		GoodsReplyListSvc goodsReplyListSvc = new GoodsReplyListSvc();
		int goodsReplyListCount = goodsReplyListSvc.goodsReplyListCount();
		int maxPage = (int) Math.ceil(goodsReplyListCount/(double)limit);  //전체 데이터 수를 나눌 리밋으로 나누어 인트형으로 반환시켜준다
		int startPage = ((pageNumber - 1)/limit)*limit + 1;       //현재 페이지에서 -1을 하고 보여줄 숫자로 나누고 곱하여 +1을 해준다
		int endPage = startPage + limit - 1;   //처음 페이지에 보여줄 리밋을 더한 후 -1을 해준다
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setListCount(goodsReplyListCount);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(pageNumber);

		List<GoodsReplyDTO> list = goodsReplyListSvc.goodsReplyList(pageNumber);
		request.setAttribute("goodsReplyList", list);
		request.setAttribute("pageInfo", pageInfo);
		
		forward = new ActionForward();
		forward.setPath("product.detail?goods_code="+goods_code);
		
		return forward;
	}

}
