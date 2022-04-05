package cartSvc;

import java.sql.Connection;

import cartDAO.CartDAO;

import static db.JdbcUtil.*;

public class CartDeleteService {
	
	public int cartDelete(int cart_num) {
		Connection conn = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(conn);
		int result = cartDAO.deleteCartDTO(cart_num);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
		
	}

}
