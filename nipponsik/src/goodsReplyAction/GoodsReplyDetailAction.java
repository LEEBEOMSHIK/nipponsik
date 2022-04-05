package goodsReplyAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyDetailSvc;
import vo.ActionForward;

public class GoodsReplyDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int goods_code = 0;
		if(request.getParameter("goods_code")!=null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		GoodsReplyDetailSvc goodsReplyDetailSvc = new GoodsReplyDetailSvc();
		GoodsReplyDTO goodsReplyDTO = goodsReplyDetailSvc.goodsReplyOne(goods_code);
		request.setAttribute("goodsReplyDTO", goodsReplyDTO);
		
		forward = new ActionForward();
		forward.setPath("/review.manage");
		return forward;
	}

}
