package com.teamwork.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.teamwork.model.bean.User;

public class UserDao {
	
	static public boolean checkEmail(String email)
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from khachhang where email=? ";
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			return rs.next();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	//code tuan
	public User getUser(int userID) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();	
		String sql ="select *from khachhang where id=?";
		PreparedStatement  ps = conn.prepareCall(sql);
		ps.setLong(1, userID);
		ResultSet rs = ps.executeQuery();
		User u = new User();
		while (rs.next()) {
			u.setUserID(rs.getInt("id"));
			u.setUsername(rs.getString("username"));
			u.setPassword(rs.getString("password"));
			u.setEmail(rs.getString("email"));
			u.setPhone(rs.getInt("phone"));
			 return u;
			 }
	return null;
}
	

}
