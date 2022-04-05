package cartSvc;

import java.sql.Connection;

import cartDAO.CartDAO;

import static db.JdbcUtil.*;

public class CartDeleteAllService {
	
	public int cartDeleteAll(String cust_id) {
		Connection conn = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(conn);
		int result = cartDAO.deleteCartDTOAll(cust_id);  // insert, update, delete 는 반드시 commit 처리를 해주어야 한다!!
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
