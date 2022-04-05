package qnaGoodsController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import qnaGoodsAction.QnaGoodsInsertAction;
import qnaGoodsAction.QnaGoodsListAction;
import vo.ActionForward;

/**
 * Servlet implementation class QnaGoodsController
 */
@WebServlet(urlPatterns= {"*.qnaList","*.qnaInsert"})
public class QnaGoodsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if(command.equals("/goods.qnaList")) {
    		action = new QnaGoodsListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/goods.qnaInsert")) {
    		action = new QnaGoodsInsertAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
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
