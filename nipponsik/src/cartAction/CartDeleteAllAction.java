package cartAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import cartSvc.CartDeleteAllService;
import vo.ActionForward;

public class CartDeleteAllAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String cust_id = (String)session.getAttribute("idbox");
		
		CartDeleteAllService cartDeleteAllService = new CartDeleteAllService();
		int result = cartDeleteAllService.cartDeleteAll(cust_id);
		
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('전체 리스트가 삭제 되었습니다');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("cartList.co");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품을 삭제 할 수 없습니다.');");
			out.println("</script>");
		}
		return forward;
	}

}
