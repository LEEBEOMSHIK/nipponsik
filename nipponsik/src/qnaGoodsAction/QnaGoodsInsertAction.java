package qnaGoodsAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import qnaGoodsDTO.QnaGoodsDTO;
import qnaGoodsSvc.QnaGoodsInsertSvc;
import vo.ActionForward;

public class QnaGoodsInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String qna_cust_id = null;
		if(session.getAttribute("idbox") != null) {
			qna_cust_id = (String)session.getAttribute("idbox");
		}
		if(qna_cust_id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='loginpage.jsp';");
			out.println("</script>");
		}
		
		int qna_goods_code = 0;
		if(request.getParameter("qna_goods_code") != null) {
			qna_goods_code = Integer.parseInt(request.getParameter("qna_goods_code"));
		}
		String qna_content = request.getParameter("qna_content");
		
		QnaGoodsDTO qnaGoodsDTO = new QnaGoodsDTO();
		qnaGoodsDTO.setQna_cust_id(qna_cust_id);
		qnaGoodsDTO.setQna_goods_code(qna_goods_code);
		qnaGoodsDTO.setQna_content(qna_content);
		
		QnaGoodsInsertSvc qnaGoodsInsertSvc = new QnaGoodsInsertSvc();
		int result = qnaGoodsInsertSvc.qnaInsert(qnaGoodsDTO);
		
		if(result == 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('문의 메세지를 보냈습니다');");
			forward.setPath("product.detail?goods_code="+qna_goods_code);
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('문의 메세지 송신 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
