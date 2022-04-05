package orderSvc;

import java.sql.Connection;
import java.util.List;
import static db.JdbcUtil.*;
import orderDAO.OrderDAO;
import orderDTO.OrderDTO;

public class OrderListSvc {
	public List<OrderDTO> orderList(String custom_id){
		
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		List<OrderDTO> list = orderDAO.orderList(custom_id);
		return list;
	}
	
	public int orderListCount(String custom_id){
		
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		int orderListCount = orderDAO.orderListCount(custom_id);
		return orderListCount;
	}

}
