package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String cust_id = null;
		if(session.getAttribute("idbox") != null) {
			cust_id = (String)session.getAttribute("idbox");
		}
		
		if(cust_id == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.')");
			out.println("location.href='loginpage.jsp';");
			out.println("</script>");
		} else {
			BoardDetailService boardDetailService = new BoardDetailService();
			BoardBean article = boardDetailService.getArticle(board_num);
			request.setAttribute("page", page);
		   	request.setAttribute("article", article);
	   		forward.setPath("/qna_board_view.jsp");
		}
		return forward;
	 }
	 
}