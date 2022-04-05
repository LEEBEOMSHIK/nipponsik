package searchSvc;

import java.sql.Connection;
import java.util.List;
import static db.JdbcUtil.*;

import productDTO.ProductDTO;
import searchDAO.SearchDAO;

public class DetailCategorySearchSvc {
	
	public List<ProductDTO> detailCategorySelectList(String detail_category){
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		List<ProductDTO> list = searchDAO.detailCategorySelect(detail_category);
		return list;
	}
	
	public int detailCategorySelectCount(String detail_category){
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		int detailCategorySelectCount = searchDAO.detailCategorySelectCount(detail_category);
		return detailCategorySelectCount;
	}

}
