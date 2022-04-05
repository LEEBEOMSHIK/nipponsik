package goodsReplyDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static db.JdbcUtil.*;
import javax.sql.DataSource;

import goodsReplyDTO.GoodsReplyDTO;

public class GoodsReplyDAO {
	DataSource ds;
	Connection con;
	private GoodsReplyDAO() {
	}
	private static GoodsReplyDAO goodsReplyDAO;
	
	public static GoodsReplyDAO getInstance() {
		if(goodsReplyDAO == null) {
			goodsReplyDAO = new GoodsReplyDAO();
		}
		return goodsReplyDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public List<GoodsReplyDTO> goodsReplyList(int pageNumber){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GoodsReplyDTO> list = new ArrayList<GoodsReplyDTO>();
		int startRow = (pageNumber - 1)*5;
		String sql = "select * from goods_review order by gdsRe_ref desc, gdsRe_seq asc limit ?,5";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
				goodsReplyDTO.setGdsRe_num(rs.getInt("gdsRe_num"));
				goodsReplyDTO.setGdsRe_cust_id(rs.getString("gdsRe_cust_id"));
				goodsReplyDTO.setGdsRe_gdsCode(rs.getInt("gdsRe_gdsCode"));
				goodsReplyDTO.setGdsRe_ref(rs.getInt("gdsRe_ref"));
				goodsReplyDTO.setGdsRe_seq(rs.getInt("gdsRe_seq"));
				goodsReplyDTO.setGdsRe_lev(rs.getInt("gdsRe_lev"));
				goodsReplyDTO.setGdsRe_imgFile(rs.getString("gdsRe_imgFile"));
				goodsReplyDTO.setGdsRe_content(rs.getString("gdsRe_content"));
				goodsReplyDTO.setGdsRe_star(rs.getInt("gdsRe_star"));
				goodsReplyDTO.setGdsRe_safac(rs.getString("gdsRe_safac"));
				goodsReplyDTO.setGdsRe_date(rs.getString("gdsRe_date"));
				list.add(goodsReplyDTO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int goodsReplyListCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int goodsReplyListCount = 0;
		String sql = "select count(*) from goods_review";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				goodsReplyListCount = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return goodsReplyListCount;
	}
	
	public List<GoodsReplyDTO> goodsReplyCodeList(int goods_code ,int pageNumber){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GoodsReplyDTO> list = new ArrayList<GoodsReplyDTO>();
		int startRow = (pageNumber - 1)*5;
		String sql = "select * from goods_review where gdsRe_gdsCode = ? order by gdsRe_ref desc, gdsRe_seq asc limit ?,5";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, goods_code);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
				goodsReplyDTO.setGdsRe_num(rs.getInt("gdsRe_num"));
				goodsReplyDTO.setGdsRe_cust_id(rs.getString("gdsRe_cust_id"));
				goodsReplyDTO.setGdsRe_gdsCode(rs.getInt("gdsRe_gdsCode"));
				goodsReplyDTO.setGdsRe_ref(rs.getInt("gdsRe_ref"));
				goodsReplyDTO.setGdsRe_seq(rs.getInt("gdsRe_seq"));
				goodsReplyDTO.setGdsRe_lev(rs.getInt("gdsRe_lev"));
				goodsReplyDTO.setGdsRe_imgFile(rs.getString("gdsRe_imgFile"));
				goodsReplyDTO.setGdsRe_content(rs.getString("gdsRe_content"));
				goodsReplyDTO.setGdsRe_star(rs.getInt("gdsRe_star"));
				goodsReplyDTO.setGdsRe_safac(rs.getString("gdsRe_safac"));
				goodsReplyDTO.setGdsRe_date(rs.getString("gdsRe_date"));
				list.add(goodsReplyDTO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int goodsReplyListCodeCount(int goods_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int goodsReplyListCount = 0;
		String sql = "select count(*) from goods_review where gdsRe_gdsCode = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, goods_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				goodsReplyListCount = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return goodsReplyListCount;
	}
	
	public int insertReply(GoodsReplyDTO goodsReplyDTO) {
		PreparedStatement pstmt = null;
		int insertReplyResult = 0;
		int gdsRe_ref = goodsReplyDTO.getGdsRe_ref();
		int gdsRe_seq = goodsReplyDTO.getGdsRe_seq();
		int gdsRe_lev = goodsReplyDTO.getGdsRe_lev();
		
		String sql = "update goods_review set gdsRe_seq = gdsRe_seq+1 where gdsRe_ref = ? and gdsRe_seq > ?";
		String insertSql = "insert into goods_review values(null,?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gdsRe_ref);
			pstmt.setInt(2, gdsRe_seq);
			int updateCount = pstmt.executeUpdate();
			
			if(updateCount > 0) {
				commit(con);
			}
			gdsRe_seq += 1;
			gdsRe_lev += 1;
			
			pstmt = con.prepareStatement(insertSql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, goodsReplyDTO.getGdsRe_cust_id());
			pstmt.setInt(2, goodsReplyDTO.getGdsRe_gdsCode());
			pstmt.setInt(3, gdsRe_ref);
			pstmt.setInt(4, gdsRe_seq);
			pstmt.setInt(5, gdsRe_lev);
			pstmt.setString(6, goodsReplyDTO.getGdsRe_imgFile());
			pstmt.setString(7, goodsReplyDTO.getGdsRe_content());
			pstmt.setInt(8, goodsReplyDTO.getGdsRe_star());
			pstmt.setString(9, goodsReplyDTO.getGdsRe_safac());
			insertReplyResult = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertReplyResult;
	}
	
	public int insertGds(GoodsReplyDTO goodsReplyDTO) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertResult = 0;
		int num = 1;
		String maxNum = "select max(gdsRe_num) from goods_review";
		String sql = "insert into goods_review values(null,?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt = con.prepareStatement(maxNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, goodsReplyDTO.getGdsRe_cust_id());
			pstmt.setInt(2, goodsReplyDTO.getGdsRe_gdsCode());
			pstmt.setInt(3, num);
			pstmt.setInt(4, goodsReplyDTO.getGdsRe_seq());
			pstmt.setInt(5, goodsReplyDTO.getGdsRe_lev());
			pstmt.setString(6, goodsReplyDTO.getGdsRe_imgFile());
			pstmt.setString(7, goodsReplyDTO.getGdsRe_content());
			pstmt.setInt(8, goodsReplyDTO.getGdsRe_star());
			pstmt.setString(9, goodsReplyDTO.getGdsRe_safac());
			insertResult = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insertResult;
	}
	
	public GoodsReplyDTO goodsReplyOne(int goods_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
		String sql = "select * from goods_review where gdsRe_gdsCode = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, goods_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goodsReplyDTO.setGdsRe_num(rs.getInt("gdsRe_num"));
				goodsReplyDTO.setGdsRe_cust_id(rs.getString("gdsRe_cust_id"));
				goodsReplyDTO.setGdsRe_gdsCode(rs.getInt("gdsRe_gdsCode"));
				goodsReplyDTO.setGdsRe_ref(rs.getInt("gdsRe_ref"));
				goodsReplyDTO.setGdsRe_seq(rs.getInt("gdsRe_seq"));
				goodsReplyDTO.setGdsRe_lev(rs.getInt("gdsRe_lev"));
				goodsReplyDTO.setGdsRe_imgFile(rs.getString("gdsRe_imgFile"));
				goodsReplyDTO.setGdsRe_content(rs.getString("gdsRe_content"));
				goodsReplyDTO.setGdsRe_star(rs.getInt("gdsRe_star"));
				goodsReplyDTO.setGdsRe_safac(rs.getString("gdsRe_safac"));
				goodsReplyDTO.setGdsRe_date(rs.getString("gdsRe_date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return goodsReplyDTO;
	}
	
	public int updateGds(GoodsReplyDTO goodsReplyDTO) {
		PreparedStatement pstmt = null;
		int updateResult = 0;
		String sql = "update goods_review set gdsRe_imgFile = ?, gdsRe_content = ?, gdsRe_star = ?, gdsRe_safac =? where gdsRe_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, goodsReplyDTO.getGdsRe_imgFile());
			pstmt.setString(2, goodsReplyDTO.getGdsRe_content());
			pstmt.setInt(3, goodsReplyDTO.getGdsRe_star());
			pstmt.setString(4, goodsReplyDTO.getGdsRe_safac());
			pstmt.setInt(5, goodsReplyDTO.getGdsRe_num());
			updateResult = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateResult;
	}
	
	public int deleteGds(int gds_num) {
		PreparedStatement pstmt = null;
		int deleteResult = 0;
		String sql = "delete from goods_review where gdsRe_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			deleteResult = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteResult;
	}
	
	public String isWriter(int gds_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String writer = null;
		String sql = "select gdsRe_cust_id from goods_review where gdsRe_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gds_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				writer = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return writer;
	}
	
	public List<GoodsReplyDTO> personReplyList(String custom_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GoodsReplyDTO> list = new ArrayList<GoodsReplyDTO>();
		String sql = "select * from goods_review re, goods gds where re.gdsRe_gdsCode = gds.goods_code "
				+ "and re.gdsRe_cust_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
				goodsReplyDTO.setGdsRe_num(rs.getInt("re.gdsRe_num"));
				goodsReplyDTO.setGdsRe_cust_id(rs.getString("re.gdsRe_cust_id"));
				goodsReplyDTO.setGdsRe_gdsCode(rs.getInt("re.gdsRe_gdsCode"));
				goodsReplyDTO.setGdsRe_ref(rs.getInt("re.gdsRe_ref"));
				goodsReplyDTO.setGdsRe_seq(rs.getInt("re.gdsRe_seq"));
				goodsReplyDTO.setGdsRe_lev(rs.getInt("re.gdsRe_lev"));
				goodsReplyDTO.setGdsRe_imgFile(rs.getString("re.gdsRe_imgFile"));
				goodsReplyDTO.setGdsRe_content(rs.getString("re.gdsRe_content"));
				goodsReplyDTO.setGdsRe_star(rs.getInt("re.gdsRe_star"));
				goodsReplyDTO.setGdsRe_safac(rs.getString("re.gdsRe_safac"));
				goodsReplyDTO.setGdsRe_date(rs.getString("re.gdsRe_date"));
				goodsReplyDTO.setGoods_name(rs.getString("gds.goods_name"));
				goodsReplyDTO.setGoods_category(rs.getInt("gds.goods_category"));
				goodsReplyDTO.setGoods_code(rs.getInt("gds.goods_code"));
				list.add(goodsReplyDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int personReplyListCount(String custom_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int personReplyListCount = 0;
		String sql = "select count(*) from goods_review where gdsRe_cust_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				personReplyListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return personReplyListCount;
	}
	
	
	
}
