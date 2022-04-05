package goodsReplyAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyAgainSvc;
import vo.ActionForward;

public class GoodsReplyAgainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String cust_id = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("idbox") != null) {
			cust_id = (String)session.getAttribute("idbox");
		}
		if(cust_id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("location.href='loginpage.jsp';");
			out.println("</script>");
		}
		
		int goods_code = 0;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		String gdsRe_imgFile = null;
		if(request.getParameter("gdsRe_imgFile") != null) {
			gdsRe_imgFile = request.getParameter("gdsRe_imgFile");
		}
		String gdsRe_content = null;
		if(request.getParameter("gdsRe_content") != null) {
			gdsRe_content = request.getParameter("gdsRe_content");
		}
		int gdsRe_star = 0;
		if(request.getParameter("gdsRe_star") != null) {
			gdsRe_star = Integer.parseInt(request.getParameter("gdsRe_star"));
		}
		String gdsRe_safac = null;
		if(request.getParameter("gdsRe_safac") != null) {
			gdsRe_safac = request.getParameter("gdsRe_safac");
		}
		
		GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
		goodsReplyDTO.setGdsRe_cust_id(cust_id);
		goodsReplyDTO.setGdsRe_gdsCode(goods_code);
		goodsReplyDTO.setGdsRe_imgFile(gdsRe_imgFile);
		goodsReplyDTO.setGdsRe_content(gdsRe_content);
		goodsReplyDTO.setGdsRe_star(gdsRe_star);
		goodsReplyDTO.setGdsRe_safac(gdsRe_safac);
		
		GoodsReplyAgainSvc goodsReplyAgainSvc = new GoodsReplyAgainSvc();
		int goodsReplyResult = goodsReplyAgainSvc.insertReply(goodsReplyDTO);
		
		if(goodsReplyResult == 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰에 대한 댓글이 성공적으로 이루어졌습니다.');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("product.detail?goods_code="+goods_code);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰에 대한 작성이 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
