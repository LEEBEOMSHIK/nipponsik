package userDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import userDTO.UserDTO;

public class UserDAO {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nipponsik","root","0000");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int gaip(UserDTO userDTO) {
		connect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("insert into custom_data values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')", userDTO.getCustom_id(),userDTO.getCustom_pw(),userDTO.getCustom_name(),userDTO.getCustom_nickname(),userDTO.getCustom_birth(),userDTO.getCustom_gender(),userDTO.getCustom_emailinput(),userDTO.getCustom_mailsearch(),userDTO.getCustom_address1(),userDTO.getCustom_address2(),userDTO.getCustom_address3(),userDTO.getCustom_address4(),userDTO.getCustom_address5(),userDTO.getCustom_susin(),userDTO.getCustom_phone());
			int result = stmt.executeUpdate(sql);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return -1; //데이터 오류
	}
	
	public UserDTO selectUser(String id) {
		connect();
		
		UserDTO userDTO = new UserDTO();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("select * from custom_data where custom_id = '%s'", id);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				userDTO.setCustom_id(rs.getString("custom_id"));
				userDTO.setCustom_pw(rs.getString("custom_pw"));
				userDTO.setCustom_name(rs.getString("custom_name"));
				userDTO.setCustom_nickname(rs.getString("custom_nickname"));
				userDTO.setCustom_birth(rs.getString("custom_birth"));
				userDTO.setCustom_gender(rs.getString("custom_gender"));
				userDTO.setCustom_emailinput(rs.getString("custom_emailinput"));
				userDTO.setCustom_mailsearch(rs.getString("custom_mailsearch"));
				userDTO.setCustom_address1(rs.getString("custom_address1"));
				userDTO.setCustom_address2(rs.getString("custom_address2"));
				userDTO.setCustom_address3(rs.getString("custom_address3"));
				userDTO.setCustom_address4(rs.getString("custom_address4"));
				userDTO.setCustom_address5(rs.getString("custom_address5"));
				userDTO.setCustom_susin(rs.getString("custom_susin"));
				userDTO.setCustom_phone(rs.getString("custom_phone"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return userDTO;
	}
	
	public int login(String custom_id, String custom_pw) {
		connect();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("select * from custom_data where custom_id = '%s'", custom_id);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				if(rs.getString("custom_pw").equals(custom_pw)) {
					return 1;   // 로그인 성공
				}
				return 0; //비밀번호 틀림
			}
			return -1; //일치하는 회원이 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return -2; // 데이터 오류 
	}
	
	public int updateUser(UserDTO userDTO) {
		connect();
		int result = 0;
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("update custom_data set custom_emailinput = '%s', custom_mailsearch = '%s', custom_name = '%s', custom_nickname = '%s', custom_phone = '%s', custom_pw = '%s' where custom_id = '%s'", userDTO.getCustom_emailinput(), userDTO.getCustom_mailsearch(),userDTO.getCustom_name(),userDTO.getCustom_nickname(),userDTO.getCustom_phone(),userDTO.getCustom_pw(),userDTO.getCustom_id());
			result = stmt.executeUpdate(sql);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return result;
	}
	
	public int deleteUser(String custom_id) {
		connect();
		int result = 0;
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from custom_data where custom_id = '%s'", custom_id);
			result = stmt.executeUpdate(sql);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		
		return result;
	}

}
