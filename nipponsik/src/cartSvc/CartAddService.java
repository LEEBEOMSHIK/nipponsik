package cartSvc;

import java.sql.Connection;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;
import static db.JdbcUtil.close;

import cartDAO.CartDAO;

public class CartAddService {
	
	public int cartInsert(String custom_id,int goods_code, int amount) {
		
		Connection conn = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(conn);
		int result = 0;
		result = cartDAO.insertCartDTO(custom_id, goods_code, amount);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
