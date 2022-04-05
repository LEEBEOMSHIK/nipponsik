package goodsReplyAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyModifySvc;
import vo.ActionForward;

public class GoodsReplyModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int gds_num = 0;
		if(request.getParameter("gdsRe_num") != null) {
			gds_num = Integer.parseInt(request.getParameter("gdsRe_num"));
		}
		
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
		
		GoodsReplyModifySvc goodsReplyModifySvc = new GoodsReplyModifySvc();
		String writer = goodsReplyModifySvc.goodsReplyModifyWriter(gds_num);
		
		if(!cust_id.equals(writer)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('접근할 수 없는 댓글입니다.');");
			out.println("history.back();");
			out.println("</script>");
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
		goodsReplyDTO.setGdsRe_imgFile(gdsRe_imgFile);
		goodsReplyDTO.setGdsRe_content(gdsRe_content);
		goodsReplyDTO.setGdsRe_star(gdsRe_star);
		goodsReplyDTO.setGdsRe_safac(gdsRe_safac);
		goodsReplyDTO.setGdsRe_num(gds_num);
		
		int modifyResult = goodsReplyModifySvc.goodsReplyModify(goodsReplyDTO);
		
		if(modifyResult == 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정이 완료 되었습니다.');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("detail.gdsReply");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정에 실패 히였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
