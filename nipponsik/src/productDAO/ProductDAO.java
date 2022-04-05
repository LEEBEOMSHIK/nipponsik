package productDAO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductDAO extends HttpServlet{
	
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		int cate_list = Integer.parseInt(request.getParameter("cate_list"));
		
		if(cate_list == 101 || cate_list == 102 || cate_list == 103 || cate_list == 104 || cate_list == 105 || cate_list == 106 || cate_list == 107 || cate_list == 108 || cate_list == 109 || cate_list == 110 || cate_list == 111) {
			try {   //상품 카테고리 리스트
				Select_CategoryConfig select_CategoryConfig = Select_CategoryConfig.instance();
				String view = select_CategoryConfig.showdata(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}

}
