package qnaGoodsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import javax.management.MXBean;
import javax.sql.DataSource;

import qnaGoodsDTO.QnaGoodsDTO;

public class QnaGoodsDAO {
	DataSource ds;
	Connection conn;
	private static QnaGoodsDAO qnaGoodsDAO;
	
	private QnaGoodsDAO() {
		
	}
	
	public static QnaGoodsDAO getInstance() {
		if(qnaGoodsDAO == null) {
			qnaGoodsDAO = new QnaGoodsDAO();
		}
		return qnaGoodsDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<QnaGoodsDTO> qnaList(int goods_code,int page){
		ArrayList<QnaGoodsDTO> list = new ArrayList<QnaGoodsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int startrow = (page - 1)*5;
		String sql = "select * from qna_data where qna_goods_code = ? order by qna_re_ref desc,qna_re_seq asc limit ?,5";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_code);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnaGoodsDTO qnaGoodsDTO = new QnaGoodsDTO();
				qnaGoodsDTO.setQna_num(rs.getInt("qna_num"));
				qnaGoodsDTO.setQna_cust_id(rs.getString("qna_cust_id"));
				qnaGoodsDTO.setQna_goods_code(rs.getInt("qna_goods_code"));
				qnaGoodsDTO.setQna_content(rs.getString("qna_content"));
				qnaGoodsDTO.setQna_date(rs.getString("qna_date"));
				qnaGoodsDTO.setQna_re_ref(rs.getInt("qna_re_ref"));
				qnaGoodsDTO.setQna_re_seq(rs.getInt("qna_re_seq"));
				list.add(qnaGoodsDTO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int qnaListCount() {  //qna리스트 카운트 구하는 함수
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int qnaListCount = 0;
		String sql = "select count(*) from qna_data";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qnaListCount = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return qnaListCount;
	}
	
	public int insertQna(QnaGoodsDTO qnaGoodsDTO) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String maxNumsql = "select max(qna_num) from qna_data";
		int maxNum = 0;
		int re_ref = qnaGoodsDTO.getQna_re_ref();
		int re_seq = qnaGoodsDTO.getQna_re_seq();
		String updateSql = "update qna_data set qna_re_seq = qna_re_seq+1 where qna_num = ? and qna_re_seq > ?";
		String sql = "insert into qna_data values(?,?,?,?,now(),?,?)";
		
		
		try {
			pstmt = conn.prepareStatement(maxNumsql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1) + 1;
			}
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, maxNum);
			pstmt.setInt(2, re_seq);
			int updateResult = pstmt.executeUpdate();
			if(updateResult > 0) {
				commit(conn);
			}
			
			re_ref = re_ref + 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNum);
			pstmt.setString(2, qnaGoodsDTO.getQna_cust_id());
			pstmt.setInt(3, qnaGoodsDTO.getQna_goods_code());
			pstmt.setString(4, qnaGoodsDTO.getQna_content());
			pstmt.setInt(5, re_ref);
			pstmt.setInt(6, qnaGoodsDTO.getQna_re_seq());
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public int insertReply(QnaGoodsDTO qnaGoodsDTO) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertReplyResult = 0;
		int qna_re_ref = qnaGoodsDTO.getQna_re_ref();
		int qna_re_seq = qnaGoodsDTO.getQna_re_seq();
		String sql = "update qna_data set qna_re_seq = qna_re_seq+1 where qna_re_ref=? and qna_re_seq > ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_re_ref);
			pstmt.setInt(2, qna_re_seq);
			int updateCount = pstmt.executeUpdate();
			
			if(updateCount > 0) {
				commit(conn);
			}
			
			qna_re_seq = qna_re_seq +1;
			String sql2 = "insert into qna_data values(null,?,?,?,now(),?,?)";
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, qnaGoodsDTO.getQna_cust_id());
			pstmt.setInt(2, qnaGoodsDTO.getQna_goods_code());
			pstmt.setString(3, qnaGoodsDTO.getQna_content());
			pstmt.setInt(4, qna_re_ref);
			pstmt.setInt(5, qna_re_seq);
			insertReplyResult = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return insertReplyResult;
		
	}

}
