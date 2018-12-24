package com.teamwork.model.dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.teamwork.model.bean.Product;

public class WishListDao {

	public static int addWishList(int product_Id, int id_kh) {
		
		int status = 0;
		if(checkProductId(product_Id,id_kh) == false) 
		{
			try {
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into wishlist(id_kh,product_id) values(?,?)");
			ps.setInt(1, id_kh);
			ps.setInt(2, product_Id);
			status = ps.executeUpdate();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}else
		{
			return status = 0;
		}
		
		return status ;
		
	}
	
	public static boolean checkProductId(int product_Id,int ma_kh) {
		try {
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from wishlist where product_id = ? and id_kh=?");
			ps.setInt(1,product_Id );
			ps.setInt(2, ma_kh);
			ResultSet rs =ps.executeQuery();
			return rs.next();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static ArrayList<Integer> getListProductIDbyID_KH(int id_kh){
		ArrayList<Integer> list = new ArrayList<>();
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from wishlist where id_kh=?");
			ps.setInt(1, id_kh);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt("product_id"));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static int  removeWishList(int id_kh, int product_id) {
		int status = 0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("delete from wishlist where id_kh = ? and product_id=? ");
			ps.setInt(1, id_kh);
			ps.setInt(2, product_id);
			 status = ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static int removeAllWishList(int id_kh) {
		int status =0;
		try
		{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement ps = conn.prepareStatement("delete from wishlist where id_kh=?");
			ps.setInt(1, id_kh);
			status = ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static void main(String[] args) throws SQLException {
		ProductDao productDao = new ProductDao();
		ArrayList<Product> listds = new ArrayList<>();
		ArrayList<Integer> list =getListProductIDbyID_KH(1);
		for(int l : list) {
			int j = l;
			listds.add(productDao.getProduct(j));
			
		}
		for(Product p : listds) {
			System.out.println(p.getProductName());
		}
		
		
	}
}
