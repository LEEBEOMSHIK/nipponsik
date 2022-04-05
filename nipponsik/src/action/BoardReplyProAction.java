package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyProAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		 	ActionForward forward = null;
		    String nowPage = request.getParameter("page");
		    
		    String cust_id = null;
			HttpSession session = request.getSession();
			if(session.getAttribute("idbox") != null) {
				cust_id = (String) session.getAttribute("idbox");
			}
			if(cust_id == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요한 서비스 입니다.');");
				out.println("location.href='loginpage.jsp';");
				out.println("</script>");
				out.close();
			}
			
		 	BoardBean article = new BoardBean();
		 	article.setBOARD_NUM(Integer.parseInt(request.getParameter("BOARD_NUM"))); // 왜 null값?? // null값 오류 전 페이지에서 board_num이 숫자로 넘어와야함
		 	article.setBOARD_cust_id(cust_id);
		 	article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		 	article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		 	article.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		 	article.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
		 	article.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));	   		
		 	BoardReplyProService boardReplyProService = new BoardReplyProService();
		 	boolean isReplySuccess = boardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward();
	   			forward.setRedirect(true);
	   			forward.setPath("boardList.bo?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('fail')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}