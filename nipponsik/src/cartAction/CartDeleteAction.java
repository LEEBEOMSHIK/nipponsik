package cartAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cartSvc.CartDeleteService;
import vo.ActionForward;

public class CartDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		ActionForward forward = null;
		int cart_num = 0;
		if(request.getParameter("cart_num") != null) {
			cart_num = Integer.parseInt(request.getParameter("cart_num"));
		}
		
		CartDeleteService cartDeleteService = new CartDeleteService();
		int result = cartDeleteService.cartDelete(cart_num);
		
		if(result == 1) {
			forward = new ActionForward();
			forward.setPath("cartList.co");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제가 되지 않았습니다.');");
			out.println("history.back()");
			out.println("</script>");
			
		}
		return forward;
	}

}
