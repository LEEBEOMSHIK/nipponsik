package searchDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static db.JdbcUtil.*;

import javax.sql.DataSource;

import productDTO.ProductDTO;

public class SearchDAO {
	
	DataSource ds;
	Connection con;
	private static SearchDAO searchDAO;
	
	private SearchDAO() {  //생성자
		
	}
	
	public static SearchDAO getInstance() {  //싱글톤 메소드 생성
		if(searchDAO == null) {
			searchDAO = new SearchDAO();
		}
		return searchDAO;
	}
	
	public void setConnection(Connection con) {  //connect 연결 
		this.con = con;
	}
	
	public ArrayList<ProductDTO> productSearch(String searchWord){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where concat(goods_name,goods_origin,detail_category) like ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchWord+"%");
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
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}
	
	public int goodsSearchCount(String searchWord) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int goodsSearchCount = 0;
		String sql = "select count(*) from goods where concat(goods_name,goods_origin,detail_category) like ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, '%'+searchWord+'%');
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goodsSearchCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return goodsSearchCount;
	}
	
	public ArrayList<ProductDTO> selectCategory(int goods_category,String selectValue){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_category = ? order by ? asc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, goods_category);
			pstmt.setString(2, selectValue);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int selectCategoryCount(int goods_category,String selectValue) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int selectCategoryCount = 0;
		String sql = "select count(*) from goods where goods_category = ? order by ? asc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, goods_category);
			pstmt.setString(2, selectValue);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				selectCategoryCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return selectCategoryCount;
	}
	
	public ArrayList<ProductDTO> baesongSelectList(String baesong){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from goods order by ? asc";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, baesong);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int baesongSelectListCount(String baesong){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from goods order by ? asc";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, baesong);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public List<ProductDTO> detailCategorySelect(String detail_category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where detail_category = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, detail_category);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
		
	}
	public int detailCategorySelectCount(String detail_category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from goods where detail_category = ?";
		int detailCategoryCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, detail_category);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				detailCategoryCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return detailCategoryCount;
	}
	
	public List<ProductDTO> priceFilterList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_price <= 20000";
		
		try {
			pstmt = con.prepareStatement(sql);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int priceFilterListCount(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int priceFilterListCount = 0;
		String sql = "select count(*) from goods where goods_price < 20000";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				priceFilterListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList2(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_price between 20000 and 40000";
		
		try {
			pstmt = con.prepareStatement(sql);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int priceFilterList2Count(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int priceFilterListCount = 0;
		String sql = "select count(*) from goods where goods_price between 20000 and 40000";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				priceFilterListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList3(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_price between 40000 and 60000";
		
		try {
			pstmt = con.prepareStatement(sql);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int priceFilterList3Count(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int priceFilterListCount = 0;
		String sql = "select count(*) from goods where goods_price between 20000 and 40000";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				priceFilterListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList4(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_price between 60000 and 80000";
		
		try {
			pstmt = con.prepareStatement(sql);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int priceFilterList4Count(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int priceFilterListCount = 0;
		String sql = "select count(*) from goods where goods_price between 20000 and 40000";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				priceFilterListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return priceFilterListCount;
	}
	
	public List<ProductDTO> priceFilterList5(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from goods where goods_price >= 80000";
		
		try {
			pstmt = con.prepareStatement(sql);
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
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	public int priceFilterList5Count(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int priceFilterListCount = 0;
		String sql = "select count(*) from goods where goods_price between 20000 and 40000";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				priceFilterListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return priceFilterListCount;
	}

}
