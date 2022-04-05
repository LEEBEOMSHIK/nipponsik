package searchController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import searchAction.DetailCategorySearchAction;
import searchAction.GoodsSearchAction;
import searchAction.PriceFilterListAction;
import searchAction.PriceFilterListAction2;
import searchAction.PriceFilterListAction3;
import searchAction.PriceFilterListAction4;
import searchAction.PriceFilterListAction5;
import searchAction.SelectCategorySearchAction;
import vo.ActionForward;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("*.search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doProcess(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	System.out.println(command);
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if(command.equals("/goods.search")) {
    		action = new GoodsSearchAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/select.search")) {  //상품별 select를 했을 때
    		action = new SelectCategorySearchAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/detail_category.search")) {
    		action = new DetailCategorySearchAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/priceFilter.search")) {
    		action = new PriceFilterListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/priceFilter2.search")) {
    		action = new PriceFilterListAction2();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/priceFilter3.search")) {
    		action = new PriceFilterListAction3();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/priceFilter4.search")) {
    		action = new PriceFilterListAction4();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/priceFilter5.search")) {
    		action = new PriceFilterListAction5();
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
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
