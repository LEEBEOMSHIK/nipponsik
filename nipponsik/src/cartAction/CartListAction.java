package cartAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import action.Action;
import cartDTO.CartDTO;
import cartSvc.CartListService;
import vo.ActionForward;

public class CartListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		
		HttpSession session = request.getSession();
		String custom_id = (String) session.getAttribute("idbox"); 
		
		CartListService cartListService = new CartListService();  //상품 리스트 출력 호출
		list = cartListService.cartList(custom_id);      // 세션 아이디 값에 카트 내용 호출
		request.setAttribute("list", list);
		
		int cartCount = cartListService.cartListCount();
		request.setAttribute("cartCount", cartCount);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/cartpage.jsp");
		return forward;
	}

}
