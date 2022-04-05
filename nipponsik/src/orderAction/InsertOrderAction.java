package orderAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import orderDTO.OrderDTO;
import orderSvc.InsertOrderSvc;
import vo.ActionForward;

public class InsertOrderAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String custom_id = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("idbox") != null) {
			custom_id = (String)session.getAttribute("idbox");
		}
		
		int goods_code = 0;
		if(request.getParameter("goods_code") != null) {
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		String goods_name = null;
		if(request.getParameter("goods_name") != null) {
			goods_name = (String)request.getParameter("goods_name");
		}
		
		int sum_goods_price = 0;
		if(request.getParameter("sum_goods_price") != null) {
			sum_goods_price = Integer.parseInt(request.getParameter("sum_goods_price"));
		}
		int goods_price = 0;
		if(request.getParameter("goods_price") != null) {
			goods_price = Integer.parseInt(request.getParameter("goods_price"));
		}
		int goods_category = 0;
		if(request.getParameter("goods_category") != null) {
			goods_category = Integer.parseInt(request.getParameter("goods_category"));
		}
		
		int amount = 0;
		if(request.getParameter("amount") != null) {
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		String payment_option = null;
		if(request.getParameter("payment_option") != null) {
			payment_option = (String)request.getParameter("payment_option");
		}
		
		String baesong_detail = null;
		if(request.getParameter("baesong_detail") != null) {
			baesong_detail = (String)request.getParameter("baesong_detail");
		}
		
		if(custom_id == null || goods_name == null || payment_option == null || baesong_detail == null || goods_code == 0 || goods_price == 0 || amount == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 정보가 제대로 입력되지 않았습니다');");
			out.println("history.back()");
			out.println("</script>");
		}
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrder_custId(custom_id);
		orderDTO.setOrder_goodsCode(goods_code);
		orderDTO.setOrder_goodsName(goods_name);
		orderDTO.setOrder_goodsCategory(goods_category);
		orderDTO.setOrder_goodsPrice(goods_price);
		orderDTO.setOrder_totalPrice(sum_goods_price);
		orderDTO.setOrder_goodsAmount(amount);
		orderDTO.setOrder_paymentOption(payment_option);
		orderDTO.setOrder_baesongDetail(baesong_detail);
		
		InsertOrderSvc insertOrderSvc = new InsertOrderSvc();
		int insertResult = insertOrderSvc.insertOrder(orderDTO);
		
		if(insertResult == 1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 구매가 정상적으로 되었습니다.');");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("/list.order");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 구매가 되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
