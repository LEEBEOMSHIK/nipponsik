package indexGoodsDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import productDTO.ProductDTO;

public class IndexGoodsDAO {
	Connection conn =null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nipponsik","root","0000");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ProductDTO> allGoodsSelect(int goods_category){
		connect();
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_category = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setGoods_code(rs.getInt("goods_code"));
				productDTO.setGoods_name(rs.getString("goods_name"));
				productDTO.setGoods_price(rs.getInt("goods_price"));
				productDTO.setGoods_origin(rs.getString("goods_origin"));
				productDTO.setGoods_category(rs.getInt("goods_category"));
				productDTO.setDetail_category(rs.getString("detail_category"));
				productDTO.setGoods_company(rs.getString("goods_company"));
				productDTO.setGoods_baesong(rs.getString("goods_baesong"));
				productDTO.setDiscount(rs.getString("discount"));
				productDTO.setNewgoods_bunho(rs.getInt("newgoods_bunho"));
				list.add(productDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		disconnect();
		return list;
	}

}
