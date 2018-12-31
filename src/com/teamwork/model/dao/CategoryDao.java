package com.teamwork.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.teamwork.model.bean.Category;

public class CategoryDao {
	
	public ArrayList<Category> getListCategory(String sex)
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from category where sex=?";
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sex);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Category category = new Category();
				category.setCategory_ID(rs.getLong("category_id"));
				category.setCategory_Name(rs.getString("category_name"));
				category.setSex(rs.getString("sex"));
				list.add(category);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	//admin cua hai
	public ArrayList<Category> getAllListCategory()
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from category ";
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Category category = new Category();
				category.setCategory_ID(rs.getLong("category_id"));
				category.setCategory_Name(rs.getString("category_name"));
				category.setSex(rs.getString("sex"));
				list.add(category);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Category selectCategory(long category_id) throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement ps = conn.prepareStatement("select * from category where category_id = ?");
		ps.setLong(1, category_id);
		ResultSet rs = ps.executeQuery();
		Category c = new Category();
		while(rs.next()){
			
			c.setCategory_ID(rs.getInt("category_id"));
			c.setCategory_Name(rs.getString("category_name"));
			c.setSex(rs.getString("sex"));
		}
		return c;
		
	}
	
	//them du lieu
		public boolean insertCategory(Category c) throws SQLException {
		    try {
		         Connection conn = ConnectionProvider.getConnection();
		         String sql = "INSERT INTO category VALUE(?,?,?)";
		         PreparedStatement ps = conn.prepareCall(sql);
		         ps.setLong(1, c.getCategory_ID());
		         ps.setString(2, c.getCategory_Name());
		         ps.setString(3, c.getSex());
		         int temp = ps.executeUpdate();
		         return temp == 1;
		    } catch (Exception e) {
		         return false;
		    }
		}
		
		
		//cap nhat du lieu
		public boolean updateCategory(Category c) throws SQLException {
		    try {
		         Connection connection = ConnectionProvider.getConnection();
		         String sql = "UPDATE category SET category_name = ? , sex = ? WHERE category_id = ?";
		         PreparedStatement ps = connection.prepareCall(sql);
		         ps.setString(1, c.getCategory_Name());
		         ps.setString(2, c.getSex());
		         ps.setLong(3, c.getCategory_ID());
		         int temp = ps.executeUpdate();
		         return temp == 1;
		    } catch (Exception e) {
		         return false;
		    }
		}
		
		//xoa du lieu
		public boolean deleteCategory(long category_id) throws SQLException {
		    try {
		        Connection connection = ConnectionProvider.getConnection();
		        String sql = "DELETE FROM category WHERE category_id = ?";
		        PreparedStatement ps = connection.prepareCall(sql);
		        ps.setLong(1, category_id);
		        int temp = ps.executeUpdate();
		            return temp == 1;
		    } catch (Exception e) {
		        return false;
		    }
		}
		
		public static void main(String[] args) throws SQLException {
			CategoryDao dao = new CategoryDao();
			Category c = dao.selectCategory(2);
			System.out.println(c.getCategory_ID()+"\n" +c.getCategory_Name()+"\t" + c.getSex());
		}
	
	
}
