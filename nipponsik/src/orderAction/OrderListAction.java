package orderAction;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orderSvc.OrderListSvc;

import action.Action;
import orderDTO.OrderDTO;
import vo.ActionForward;

public class OrderListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String custom_id = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("idbox") != null) {
			custom_id = (String)session.getAttribute("idbox");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("location.href='loginpage.jsp';");
			out.println("</script>");
		}
		
		OrderListSvc orderListSvc = new OrderListSvc();
		List<OrderDTO> list = orderListSvc.orderList(custom_id);
		request.setAttribute("orderList", list);
		
		int orderListCount = orderListSvc.orderListCount(custom_id);
		request.setAttribute("orderListCount", orderListCount);
		
		forward = new ActionForward();
		forward.setPath("/mypage.jsp");
		
		return forward;
	}

}
