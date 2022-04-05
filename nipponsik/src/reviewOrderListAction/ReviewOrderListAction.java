package reviewOrderListAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import goodsReplyDTO.GoodsReplyDTO;
import goodsReplySvc.GoodsReplyListSvc;
import goodsReplySvc.GoodsReplyPersonListSvc;
import orderDTO.OrderDTO;
import orderSvc.OrderListSvc;
import vo.ActionForward;

public class ReviewOrderListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String custom_id = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("idbox") != null) {
			custom_id = (String)session.getAttribute("idbox");
		}
		
		OrderListSvc orderListSvc = new OrderListSvc();
		List<OrderDTO> list = orderListSvc.orderList(custom_id);
		request.setAttribute("orderList", list);
		int orderListCount = orderListSvc.orderListCount(custom_id);
		request.setAttribute("orderListCount", orderListCount);
		
		GoodsReplyPersonListSvc goodsReplyPersonListSvc = new GoodsReplyPersonListSvc();
		List<GoodsReplyDTO> list2 = goodsReplyPersonListSvc.personReplyList(custom_id);
		request.setAttribute("goodsReplyList", list2);
		int personReplyListCount = goodsReplyPersonListSvc.personReplyListCount(custom_id);
		request.setAttribute("goodsReplyCount", personReplyListCount);
		
		forward = new ActionForward();
		forward.setPath("/goods_reviewList.jsp");
		
		return forward;
	}
	

}
