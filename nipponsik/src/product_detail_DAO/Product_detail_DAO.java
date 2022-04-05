package product_detail_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static db.JdbcUtil.*;
import javax.sql.DataSource;

import productDTO.ProductDTO;

public class Product_detail_DAO {
	
	DataSource ds;
	Connection conn;
	
	private static Product_detail_DAO product_detail_DAO;
	
	private Product_detail_DAO() {
		
	}
	public static Product_detail_DAO getInstance() {
		if(product_detail_DAO == null) {
			product_detail_DAO = new Product_detail_DAO();
		}
		return product_detail_DAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ProductDTO selectProductDTO(int goods_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ProductDTO productDTO = new ProductDTO();
		String sql = "select * from goods where goods_code = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return productDTO;
	}

}
