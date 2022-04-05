package cartAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import cartSvc.CartAddService;
import vo.ActionForward;

public class CartAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		ActionForward forward = null;
		String custom_id = "";
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("idbox") != null) {   //세션 아이디 값이 있다면
			custom_id = (String) session.getAttribute("idbox");
		}
		
		int goods_code = 0;
		
		if(request.getParameter("goods_code") != null) {   //상품에 대한 코드 (정보 전달)
			goods_code = Integer.parseInt(request.getParameter("goods_code"));
		}
		
		int amount = 0;
		
		if(request.getParameter("amount") != null) {   // 상품 양도 같이 전달
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		if(custom_id == null || goods_code == 0 || amount == 0) {  //전달 받은 값 중 하나라도 없다면 뒤로 돌림
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('미입력된 정보가 있습니다')");
			out.println("history.back()");
			out.println("</script>");
		}

		CartAddService cartAddService = new CartAddService();  //카트 내용 추가 메소드 호출
		int result = cartAddService.cartInsert(custom_id, goods_code, amount);
		System.out.println(custom_id);
		System.out.println(goods_code);
		System.out.println(amount);
		System.out.println(result);
		
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 담았습니다')");
			out.println("</script>");
			forward = new ActionForward();  // 객체 생성이 필요!!!
			forward.setPath("/cartList.co");  
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니 담기 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
