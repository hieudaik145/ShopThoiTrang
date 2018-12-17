package com.teamwork.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	//tu viet
	public static void main(String[] args) throws SQLException {
		ProductDao dao = new ProductDao();
		System.out.println(dao.countProductByCategory(6));
		ArrayList<Product> list = dao.getListProductByNav(6, 1, 3);
		for(int i = 0 ; i < list.size();i++) {
			Product p = list.get(i);
			System.out.println(p.getProductName() + "\t" + p.getProductPrice() + "\t" + p.getProductPriceOld());
		}
		for(Product p : list) {
			System.out.println(p.getProductPrice() + "\t " + p.getProductPriceOld());
		}
		
	}
}
