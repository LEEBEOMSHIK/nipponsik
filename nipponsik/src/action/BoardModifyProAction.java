package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		int board_num=0;
		ActionForward forward = null;
		boolean isModifySuccess = false;
		board_num=Integer.parseInt(request.getParameter("BOARD_NUM")); // null값 오류 전 페이지에서 board_num이 1로 넘어와야함
		if(board_num == 0)                                           // input hidden으로 보내지고 있음
			board_num = 1;
		BoardBean article=new BoardBean();
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
		
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		boolean isRightUser=boardModifyProService.isArticleWriter(board_num, cust_id);

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT")); 
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num="+article.getBOARD_NUM()); 
			}

		}

		return forward;
	}

}