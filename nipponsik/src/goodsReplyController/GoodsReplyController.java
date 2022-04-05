package goodsReplyController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import goodsReplyAction.GoodsReplyAgainAction;
import goodsReplyAction.GoodsReplyDeleteAction;
import goodsReplyAction.GoodsReplyDetailAction;
import goodsReplyAction.GoodsReplyInsertAction;
import goodsReplyAction.GoodsReplyListAction;
import goodsReplyAction.GoodsReplyModifyAction;
import goodsReplySvc.GoodsReplyModifySvc;
import vo.ActionForward;

/**
 * Servlet implementation class GoodsReplyController
 */
@WebServlet("*.gdsReply")
public class GoodsReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(requestURI);
		System.out.println(contextPath);
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/insert.gdsReply")) {
			action = new GoodsReplyInsertAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/addReply.gdsReply")) {
			action = new GoodsReplyAgainAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/detail.gdsReply")) {
			action = new GoodsReplyDetailAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/modify.gdsReply")) {
			action = new GoodsReplyModifyAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/delete.gdsReply")) {
			action = new GoodsReplyDeleteAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
