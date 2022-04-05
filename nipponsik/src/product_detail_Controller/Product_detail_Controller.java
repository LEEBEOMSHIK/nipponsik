package product_detail_Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import product_detail_Action.Product_All_detail_Action;
import product_detail_Action.Product_detail_Action;
import vo.ActionForward;


@WebServlet("*.detail")
public class Product_detail_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
    	String requestURI = request.getRequestURI();  //local 이후 값
    	String contextPath = request.getContextPath();  // project까지의 값
    	String command = requestURI.substring(contextPath.length());
    	System.out.println(requestURI);
		System.out.println(contextPath);
    	System.out.println(command);
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if(command.equals("/product.detail")) {
    		action = new Product_All_detail_Action();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
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
