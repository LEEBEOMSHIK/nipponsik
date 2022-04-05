package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int board_num=Integer.parseInt(request.getParameter("board_num"));
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
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		boolean isArticleWriter =boardDeleteProService.isArticleWriter(board_num, cust_id);

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제에 실패했습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page=" + nowPage);
			}
			
		}


		return forward;
	}

}