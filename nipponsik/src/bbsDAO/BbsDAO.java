package bbsDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bbsDTO.BbsDTO;

public class BbsDAO {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nipponsik","root","0000");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if(conn != null) {
				conn.close();
			}
			if(stmt != null) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BbsDTO> selectAll(){  // bbs 전체 리스트 출력
		connect();
		
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM bbs_data";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BbsDTO bbsDTO = new BbsDTO();
				bbsDTO.setBbsno(rs.getInt(1));
				bbsDTO.setBbstitle(rs.getString(2));
				bbsDTO.setCust_id(rs.getString(3));
				bbsDTO.setCust_nickname(rs.getString(4));
				bbsDTO.setBbs_cookinggenre(rs.getString(5));
				bbsDTO.setBbsdate(rs.getString(6));
				bbsDTO.setBbscontent(rs.getString(7));
				list.add(bbsDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return list;
	}
	
	public int currentbunho() {
		int bunho = 0;
		connect();
		try {
			stmt = conn.createStatement();
			String sql = "SELECT COUNT(*) FROM bbs_data";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				bunho = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return bunho;
	}
	
	public int insertbbs(BbsDTO bbsDTO) {
		connect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("INSERT INTO bbs_data VALUES('%s','%s','%s','%s','%s',now(),'%s')", bbsDTO.getBbsno(),bbsDTO.getBbstitle(),bbsDTO.getCust_id(),bbsDTO.getCust_nickname(),bbsDTO.getBbs_cookinggenre(),bbsDTO.getBbscontent());
			int result = stmt.executeUpdate(sql);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return -1;  // 데이터 오류
	}
	
	public String getNickname(String id) {
		String nickname = null;
		connect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("select cd.custom_nickname from custom_data cd, bbs_data bd where cd.custom_id = bd.cust_id and cd.custom_id = '%s'", id);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				nickname = rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return nickname;
	}
	
	public BbsDTO getBbs(int bbsno) {
		connect();
		
		BbsDTO bbsDTO = new BbsDTO();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("select * from bbs_data where bbsno = '%s'", bbsno);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				bbsDTO.setBbsno(rs.getInt("bbsno"));
				bbsDTO.setBbstitle(rs.getString("bbstitle"));
				bbsDTO.setCust_id(rs.getString("cust_id"));
				bbsDTO.setCust_nickname(rs.getString("cust_nickname"));
				bbsDTO.setBbs_cookinggenre(rs.getString("bbs_cookinggenre"));
				bbsDTO.setBbsdate(rs.getString("bbsdate"));
				bbsDTO.setBbscontent(rs.getString("bbscontent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return bbsDTO;
	}
	
	public int bbsUpdate(BbsDTO bbsDTO) {
		connect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("update bbs_data set bbstitle = '%s', bbs_cookinggenre = '%s', bbsdate = now(), bbscontent = '%s' where bbsno = '%s'", bbsDTO.getBbstitle(),bbsDTO.getBbs_cookinggenre(),bbsDTO.getBbscontent(),bbsDTO.getBbsno());
			int result = stmt.executeUpdate(sql);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return 0;  // 데이터 오류
	}
	
	public int bbsDelete(int bbsno) {
		connect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from bbs_data where bbsno = '%s'", bbsno);
			int result = stmt.executeUpdate(sql);
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return 0; //데이터 오류
	}

}
