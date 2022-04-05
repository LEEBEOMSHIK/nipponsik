package searchSvc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import productDTO.ProductDTO;
import searchDAO.SearchDAO;

public class GoodsSearchService {
	
	public ArrayList<ProductDTO> goodsSearch(String searchWord){
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = searchDAO.productSearch(searchWord);
		close(conn);
		return list;
	}
	
	public int goodsSearchCount(String searchWord) {
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		int result = searchDAO.goodsSearchCount(searchWord);
		return result;
	}

}
