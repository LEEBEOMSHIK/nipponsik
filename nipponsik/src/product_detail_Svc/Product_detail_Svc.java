package product_detail_Svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import productDTO.ProductDTO;
import product_detail_DAO.Product_detail_DAO;

public class Product_detail_Svc {
	
	public ProductDTO selectProductDTO(int goods_code) {
		Connection conn = getConnection();
		Product_detail_DAO product_detail_DAO = Product_detail_DAO.getInstance();
		product_detail_DAO.setConnection(conn);
		ProductDTO productDTO = product_detail_DAO.selectProductDTO(goods_code);
		return productDTO;
	}

}
