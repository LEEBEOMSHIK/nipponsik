package cartDAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import cartDTO.CartDTO;
import vo.BoardBean;

public class CartDAO {

		DataSource ds;
		Connection con;
		private static CartDAO cartDAO;

		private CartDAO() {// 생성자 
		}

		public static CartDAO getInstance(){  // 싱글톤 메소드 
			if(cartDAO == null){
				cartDAO = new CartDAO();
			}
			return cartDAO;
		}

		public void setConnection(Connection con){
			this.con = con;
		}

		public ArrayList<CartDTO> cartSelectAll(String custom_id){  // cart 리스트 구하는 함수
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from custom_data c, goods g, cart_data cd where c.custom_id = cd.cust_id and g.goods_code = cd.goods_code and c.custom_id = ?";
			
			ArrayList<CartDTO> list = new ArrayList<CartDTO>();
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, custom_id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					CartDTO cartDTO = new CartDTO();
					cartDTO.setCart_num(rs.getInt("cd.cart_num"));
					cartDTO.setCust_id(rs.getString("cd.cust_id"));
					cartDTO.setGoods_code(rs.getInt("cd.goods_code"));
					cartDTO.setAmount(rs.getInt("cd.amount"));
					cartDTO.setCart_date(rs.getString("cd.cart_date"));
					cartDTO.setGoods_name(rs.getString("g.goods_name"));
					cartDTO.setGoods_price(rs.getInt("g.goods_price"));;
					cartDTO.setGoods_category(rs.getInt("g.goods_category"));
					list.add(cartDTO);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			
			return list;
		}
		
		public int cartListCount() {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int cartCount = 0;
			String sql = "select count(*) from cart_data";
			
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cartCount = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rs);
			}
			
			return cartCount;
		}
		
		public int insertCartDTO(String custom_id, int goods_code, int amount){
			PreparedStatement pstmt = null;
			
			int result = 0;
			String sql = "insert into cart_data values(null,?,?,?,now())";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, custom_id);
				pstmt.setInt(2, goods_code);
				pstmt.setInt(3, amount);
				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int deleteCartDTO(int cart_num) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = "delete from cart_data where cart_num = ?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cart_num);
				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
			
		}
		
		public int deleteCartDTOAll(String cust_id) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = "delete from cart_data where cust_id = ?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cust_id);
				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
	}

