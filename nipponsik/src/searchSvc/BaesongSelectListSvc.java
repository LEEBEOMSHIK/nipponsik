package searchSvc;

import java.sql.Connection;
import java.util.ArrayList;

import productDTO.ProductDTO;
import searchDAO.SearchDAO;

import static db.JdbcUtil.*;

public class BaesongSelectListSvc {
	public ArrayList<ProductDTO> baesongSelectList(String baesong){
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		ArrayList<ProductDTO> list = searchDAO.baesongSelectList(baesong);
		return list;
	}
	
	public int baesongSelectListCount(String baesong) {
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		int result = searchDAO.baesongSelectListCount(baesong);
		return result;
	}

}
