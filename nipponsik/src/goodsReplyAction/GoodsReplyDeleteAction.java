package goodsReplyAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyDeleteSvc;
import goodsReplySvc.GoodsReplyDetailSvc;
import vo.ActionForward;

public class GoodsReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int gds_num = 0;
		if(request.getParameter("gdsRe_num") != null) {
			gds_num = Integer.parseInt(request.getParameter("gdsRe_num"));
		}
		int goods_code = 0;
		if(request.getParameter("goods_code")!=null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		GoodsReplyDeleteSvc goodsReplyDeleteSvc = new GoodsReplyDeleteSvc();
		int deleteResult = goodsReplyDeleteSvc.goodsReplyDelete(gds_num);
		
		if(deleteResult == 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰 삭제가 성공적으로 이루어졌습니다.');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("product.detail=goods_code"+goods_code);
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰 삭제에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
