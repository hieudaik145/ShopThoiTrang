package com.teamwork.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import com.mysql.cj.api.xdevapi.Collection;
import com.teamwork.model.bean.Product;

public class ProductDao {
	
	public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from product where category_id = '"+category_id+"' ";
		PreparedStatement ps = conn.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while(rs.next())
		{
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage(rs.getString("product_image"));
			product.setProductPrice(rs.getDouble("product_price"));
			product.setProductPriceOld(rs.getDouble("price_old"));
			product.setProductDescription(rs.getString("product_description"));
			product.setProductOverview(rs.getString("product_overview"));
			product.setProductReview(rs.getString("product_review"));
			product.setProductAdditonal(rs.getString("product_additional"));
			list.add(product);
		}
		
		return list;
	}
	
	public static void sapXeGiaThapDan(ArrayList<Product> list) {
		Product temp;
		for(int i = 0 ; i<list.size() - 1 ;i++)
		{
			for(int j = i + 1; j< list.size() ; j++)
			{
				Product p = list.get(i);
				Product d = list.get(j);
				
				if(d.getProductPrice() > p.getProductPrice())
				{
					temp = d;
					p = d;
					temp = p;
					
				}
			}
		}
	}
	
//	lay so luong san pham
	public ArrayList<Product> getListProductByNav(long category_id, int firstResult, int maxResult) throws SQLException {
		Connection connection = ConnectionProvider.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '" +category_id+ "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
        	Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage(rs.getString("product_image"));
			product.setProductPrice(rs.getDouble("product_price"));
			product.setProductPriceOld(rs.getDouble("price_old"));
			product.setProductDescription(rs.getString("product_description"));
			product.setProductOverview(rs.getString("product_overview"));
			product.setProductReview(rs.getString("product_review"));
			product.setProductAdditonal(rs.getString("product_additional"));
			list.add(product);
        }
        return list;
	}
	
	// tinh tong san pham
	public int countProductByCategory(long category_id) throws SQLException {
		Connection connection = ConnectionProvider.getConnection();
        String sql = "SELECT count(product_id) FROM product WHERE category_id = '" +category_id+ "'";
        PreparedStatement ps = connection.prepareCall(sql);	
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
        	count = rs.getInt(1);
        }
        return count;
	}
	public Product getProduct(long product_id) throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = " select * from product where product_id = '"+product_id+"'";
		PreparedStatement ps = conn.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		Product product = new Product();
		while(rs.next())
		{
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage(rs.getString("product_image"));
			product.setProductPrice(rs.getDouble("product_price"));
			product.setProductPriceOld(rs.getDouble("price_old"));
			product.setProductDescription(rs.getString("product_description"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductOverview(rs.getString("product_overview"));
			product.setProductReview(rs.getString("product_review"));
			product.setProductAdditonal(rs.getString("product_additional"));
		}
		
		return product;
	}

	public ArrayList<Product> getALLProduct() throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from product ";
		PreparedStatement ps = conn.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while(rs.next())
		{
			Product product = new Product();
			product.setCategoryID(rs.getLong("category_id"));
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage(rs.getString("product_image"));
			product.setProductPrice(rs.getDouble("product_price"));
			product.setProductPriceOld(rs.getDouble("price_old"));
			product.setProductDescription(rs.getString("product_description"));
			product.setProductOverview(rs.getString("product_overview"));
			product.setProductReview(rs.getString("product_review"));
			product.setProductAdditonal(rs.getString("product_additional"));
			list.add(product);
		}
		
		return list;
	}
	// sap xep tang dan
	public static void sortPriceTangDan(ArrayList<Product> list)
	{
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				if(o1 == o2)
				{
					return 0;
				}else if(o1.getProductPrice() > o2.getProductPrice())
				{
					return 1;
				}
				else
				{
					return -1;
				}
				
			}
		});
	}
	//sap xep giam dan theo gia
	public static void sortPriceGianDan(ArrayList<Product> list)
	{
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				if(o1 == o2)
				{
					return 0;
				}else if(o1.getProductPrice() < o2.getProductPrice())
				{
					return 1;
				}
				else
				{
					return -1;
				}
				
			}
		});
	}
	
	//code cua hai
	//them Product
			public boolean insertProduct(Product c) throws SQLException {
			    try {
			         Connection conn = ConnectionProvider.getConnection();
			         String sql = "INSERT INTO product VALUE(?,?,?,?,?,?,?,?,?,?,?,?)";
			         PreparedStatement ps = conn.prepareCall(sql);
			         ps.setLong(1, c.getProductID());
			         ps.setLong(2, c.getCategoryID());
			         ps.setString(3, c.getProductName());
			         ps.setString(4, c.getProductImage());
			         ps.setDouble(5, c.getProductPrice());
			         ps.setDouble(6, c.getProductPriceOld());
			         ps.setString(7, c.getProductDescription());
			         ps.setString(8, c.getProductImage1());
			         ps.setString(9, c.getProductImage2());
			         ps.setString(10, c.getProductOverview());
			         ps.setString(11, c.getProductReview());
			         ps.setString(12, c.getProductAdditonal());
			         
			         int temp = ps.executeUpdate();
			         return temp == 1;
			    } catch (Exception e) {
			         return false;
			    }
			}
			//cap nhat du lieu
			public boolean updateProduct(Product c) throws SQLException {
			    try {
			    	Connection connection = ConnectionProvider.getConnection();
			    	String sql = "update product set category_id=?,product_name=?,product_image=?,product_image1=?,"
			    			+ "product_image2=?,product_price=?,price_old=?,product_description=?,product_overview=?,"
			    			+ "product_additional=?,product_review=? WHERE product_id=?";
			    	PreparedStatement ps = connection.prepareCall(sql);
			    	ps.setLong(1, c.getCategoryID());
			    	ps.setString(2, c.getProductName());
			    	ps.setString(3, c.getProductImage());
			    	ps.setString(4, c.getProductImage1());
			    	ps.setString(5, c.getProductImage2());
			    	ps.setDouble(6, c.getProductPrice());
			    	ps.setDouble(7, c.getProductPriceOld());
			    	ps.setString(8, c.getProductDescription());
			    	ps.setString(9, c.getProductOverview());
			    	ps.setString(10, c.getProductAdditonal());
			    	ps.setString(11, c.getProductReview());
			    	ps.setLong(12, c.getProductID());
			    	return ps.executeUpdate() > 0 ;
			    } catch (Exception e) {
			         return false;
			    }
			}
			//xoa du lieu
			public boolean deleteProduct(long product_id) throws SQLException {
			    try {
			        Connection connection = ConnectionProvider.getConnection();
			        String sql = "DELETE FROM product WHERE product_id = ?";
			        PreparedStatement ps = connection.prepareCall(sql);
			        ps.setLong(1, product_id);
			        int temp = ps.executeUpdate();
			            return temp == 1;
			    } catch (Exception e) {
			        return false;
			    }
			}
			
	
	
	//tu viet
	public static void main(String[] args) throws SQLException {
		ProductDao dao = new ProductDao();
		Product p = new Product(56, 4, "hai", "img", "img", "img", 32, 22, "ffdsa", "fdsfa", "sdfasf", "fasdf");
		if(dao.updateProduct(p))
		{
			System.out.println("Them thanh cong");
		}else
		{
			System.out.println("THat bai");
		}
	
		
		
	}
}
