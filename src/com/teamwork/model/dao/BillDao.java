package com.teamwork.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.teamwork.model.bean.Bill;

public class BillDao {
	
	public void insertBill(Bill bill) throws SQLException
	{
		Connection conn = ConnectionProvider.getConnection();
		String sql = "insert into bill(bill_id,user_id,total,payment,adress,date) values(?,?,?,?,?,?) ";
		PreparedStatement ps = conn.prepareCall(sql); 
		ps.setLong(1, bill.getBillID());
		ps.setLong(2, bill.getUserID());
		ps.setDouble(3,bill.getTotal());
		ps.setString(4, bill.getPayment());
		ps.setString(5, bill.getAdress());
		ps.setTimestamp(6, bill.getDate());
		ps.executeUpdate();
	}
	
	
	//hien thi danh sach
	public ArrayList<Bill> getListBill() throws SQLException  {
		Connection conn = ConnectionProvider.getConnection();
		String sql ="SELECT * FROM bill";
		ArrayList<Bill> list = new ArrayList<>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Bill bill = new Bill();
			bill.setBillID(rs.getLong("bill_id"));
			bill.setUserID(rs.getLong("user_id"));
			bill.setTotal(rs.getDouble("total"));
			bill.setPayment(rs.getString("payment"));
			bill.setAdress(rs.getString("adress"));
			bill.setDate(rs.getTimestamp("date"));
			list.add(bill);
			
			}
		return list;
	}
	
	//xoa bill
		public boolean deleteBill(long bill_id) throws SQLException {
		    try {
		        Connection connection = ConnectionProvider.getConnection();
		        String sql = "DELETE FROM bill WHERE bill_id = ?";
		        PreparedStatement ps = connection.prepareCall(sql);
		        ps.setLong(1, bill_id);
		        int temp = ps.executeUpdate();
		            return temp == 1;
		    } catch (Exception e) {
		        return false;
		    }
		}
	
	public static void main(String[] args) throws SQLException {
		BillDao dao = new BillDao();
		ArrayList<Bill> list = dao.getListBill();
		for(Bill b: list) {
			System.out.println(b.getBillID() +"\t" +b.getAdress());
		}
	}
}
