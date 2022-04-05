package cartSvc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cartDAO.CartDAO;
import cartDTO.CartDTO;

public class CartListService {
	
	public ArrayList<CartDTO> cartList(String custom_id){
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		
		Connection conn = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(conn);
		list = cartDAO.cartSelectAll(custom_id);
		close(conn);
		return list;
		
	}
	
	public int cartListCount() {
		Connection conn = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(conn);
		int cartCount = cartDAO.cartListCount();
		close(conn);
		return cartCount;
	}

}
