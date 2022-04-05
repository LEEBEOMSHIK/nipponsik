package searchSvc;

import java.sql.Connection;
import java.util.List;
import static db.JdbcUtil.*;
import productDTO.ProductDTO;
import searchDAO.SearchDAO;

public class PriceFilterListSvc {
	public List<ProductDTO> priceFilterList(){
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		List<ProductDTO> list = searchDAO.priceFilterList();
		return list;
	}
	public int priceFilterListCount() {
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		int priceFilterListCount = searchDAO.priceFilterListCount();
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList2(){
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		List<ProductDTO> list = searchDAO.priceFilterList2();
		return list;
	}
	public int priceFilterList2Count() {
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		int priceFilterListCount = searchDAO.priceFilterList2Count();
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList3(){
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		List<ProductDTO> list = searchDAO.priceFilterList3();
		return list;
	}
	public int priceFilterList3Count() {
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		int priceFilterListCount = searchDAO.priceFilterList3Count();
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList4(){
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		List<ProductDTO> list = searchDAO.priceFilterList4();
		return list;
	}
	public int priceFilterList4Count() {
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		int priceFilterListCount = searchDAO.priceFilterList4Count();
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList5(){
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		List<ProductDTO> list = searchDAO.priceFilterList5();
		return list;
	}
	public int priceFilterList5Count() {
		Connection con = getConnection();
		SearchDAO searchDAO = SearchDAO.getInstance();
		searchDAO.setConnection(con);
		int priceFilterListCount = searchDAO.priceFilterList5Count();
		return priceFilterListCount;
	}
	

}
