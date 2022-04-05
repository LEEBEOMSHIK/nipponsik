package searchSvc;

import java.sql.Connection;
import java.util.List;
import static db.JdbcUtil.*;

import productDTO.ProductDTO;
import searchDAO.SearchDAO;

public class SelectCategorySearch {
	
	public List<ProductDTO> selectCategory(int goods_category,String selectValue){
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		List<ProductDTO> list = searchDAO.selectCategory(goods_category,selectValue);
		return list;
	}
	
	public int selectCategoryCount(int goods_category,String selectValue) {
		Connection conn = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(conn);
		int selelctCategoryCount = searchDAO.selectCategoryCount(goods_category,selectValue);
		return selelctCategoryCount;
	}

}
