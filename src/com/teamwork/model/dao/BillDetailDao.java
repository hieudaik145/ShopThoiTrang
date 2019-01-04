package com.teamwork.model.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.teamwork.model.bean.BillDetail;

public class BillDetailDao {
	
	public void insertBillDetail(BillDetail bd) throws SQLException {
		
		Connection conn = ConnectionProvider.getConnection();
		String sql = "insert into bill_detail(bill_detail_id,bill_id,product_id,price,quantity) values(?,?,?,?,?)" ;
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, bd.getBillDetailID());
		ps.setLong(2, bd.getBillID());
		ps.setLong(3, bd.getProductID());
		ps.setDouble(4, bd.getPrice());
		ps.setInt(5, bd.getQuantity());
		ps.executeUpdate();
	}
	
	public ArrayList<BillDetail> getALLBillDetail() throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from bill_detail ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ArrayList<BillDetail> list = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			BillDetail billDetail = new BillDetail();
			billDetail.setBillDetailID(rs.getInt("bill_detail_id"));
			billDetail.setBillID(rs.getInt("bill_id"));
			billDetail.setProductID(rs.getInt("product_id"));
			billDetail.setPrice(rs.getDouble("price"));
			billDetail.setQuantity(rs.getInt("quantity"));
			list.add(billDetail);
		}
		return list;
	}
	public void deleteBillDetailwithbillid(long billid) {
		 try {
		        Connection connection = ConnectionProvider.getConnection();
		        String sql = "DELETE FROM bill_detail WHERE bill_id = ?";
		        PreparedStatement ps = connection.prepareCall(sql);
		        ps.setLong(1, billid);
		        ps.executeUpdate();
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
	}
	public ArrayList<BillDetail> getBillDetailByBillId(long billid) throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from bill_detail where bill_id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, billid);
		ArrayList<BillDetail> list = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			BillDetail billDetail = new BillDetail();
			billDetail.setBillDetailID(rs.getInt("bill_detail_id"));
			billDetail.setBillID(rs.getInt("bill_id"));
			billDetail.setProductID(rs.getInt("product_id"));
			billDetail.setPrice(rs.getDouble("price"));
			billDetail.setQuantity(rs.getInt("quantity"));
			list.add(billDetail);
		}
		return list;
	}
	
	public int countProductbybillId(long billid) throws SQLException {
		int countProduct=0;
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from bill_detail where bill_id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, billid);
		ArrayList<Integer> listcout = new ArrayList<Integer>();
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			listcout.add(rs.getInt("product_id"));
		}
		return countProduct = listcout.size();
	}
	public static void main(String[] args)  throws SQLException {
		BillDetailDao dao = new BillDetailDao();
		ArrayList<BillDetail> list = dao.getBillDetailByBillId(333819122);
		for(BillDetail b:list)
		{
			System.out.println(b.getProductID()+"\t"+ b.getPrice()+"\t"+b.getQuantity());
		}
	
		int cout = dao.countProductbybillId(333819122);
		System.out.println(cout);
	}
}
