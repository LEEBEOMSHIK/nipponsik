package orderSvc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import orderDAO.OrderDAO;
import orderDTO.OrderDTO;

public class InsertOrderSvc {
	public int insertOrder(OrderDTO orderDTO){
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		int insertResult = orderDAO.insertOrder(orderDTO);
		
		if(insertResult == 1) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return insertResult;
	}

}
