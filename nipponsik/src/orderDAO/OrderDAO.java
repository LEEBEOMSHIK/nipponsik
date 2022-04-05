package orderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static db.JdbcUtil.*;

import javax.sql.DataSource;

import orderDTO.OrderDTO;

public class OrderDAO {
	DataSource ds;
	Connection con;
	
	private OrderDAO() {
	}
	
	private static OrderDAO orderDAO;
	
	public static OrderDAO getInstance() {
		if(orderDAO == null) {
			orderDAO = new OrderDAO();
		}
		return orderDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public List<OrderDTO> orderList(String custom_id){  //아이디에 따른 구매한 상품 리스트 출력
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from buyorder where order_custId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO orderDTO = new OrderDTO();
				orderDTO.setOrder_num(rs.getInt("order_num"));
				orderDTO.setOrder_custId(rs.getString("order_custId"));
				orderDTO.setOrder_goodsCode(rs.getInt("order_goodsCode"));
				orderDTO.setOrder_goodsCategory(rs.getInt("order_goodsCategory"));
				orderDTO.setOrder_goodsName(rs.getString("order_goodsName"));
				orderDTO.setOrder_goodsPrice(rs.getInt("order_goodsPrice"));
				orderDTO.setOrder_totalPrice(rs.getInt("order_totalPrice"));
				orderDTO.setOrder_goodsAmount(rs.getInt("order_goodsAmount"));
				orderDTO.setOrder_date(rs.getString("order_date"));
				orderDTO.setOrder_paymentOption(rs.getString("order_paymentOption"));
				orderDTO.setOrder_baesongDetail(rs.getString("order_baesongDetail"));
				list.add(orderDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int orderListCount(String custom_id){  //아이디에 따른 구매한 상품 리스트 출력
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int orderListCount = 0;
		String sql = "select count(*) from buyorder where order_custId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return orderListCount;
	}
	
	public int insertOrder(OrderDTO orderDTO) {
		PreparedStatement pstmt = null;
		int insertResult = 0;
		String sql = "insert into buyorder values(null,?,?,?,?,?,?,?,now(),?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderDTO.getOrder_custId());
			pstmt.setInt(2, orderDTO.getOrder_goodsCode());
			pstmt.setInt(3, orderDTO.getOrder_goodsCategory());
			pstmt.setString(4, orderDTO.getOrder_goodsName());
			pstmt.setInt(5, orderDTO.getOrder_goodsPrice());
			pstmt.setInt(6, orderDTO.getOrder_totalPrice());
			pstmt.setInt(7, orderDTO.getOrder_goodsAmount());
			pstmt.setString(8, orderDTO.getOrder_paymentOption());
			pstmt.setString(9, orderDTO.getOrder_baesongDetail());
			insertResult = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertResult;  //제대로 들어갔다면 1반환
	}
	
	public int deleteOrder(String custom_id) {
		PreparedStatement pstmt = null;
		int deleteResult = 0;
		String sql = "delete from buyorder where order_custId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			deleteResult = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteResult;
	}

}
