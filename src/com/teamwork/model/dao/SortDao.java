package com.teamwork.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.teamwork.model.bean.Product;

public class SortDao {

	//sắp xếp từ thấp đến cao theo giá
	public  static void sortMinMaxPrice(ArrayList<Product> list)
	{
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				
				if(o1.getProductPrice() == o2.getProductPrice())
				{
					return 0;
				}else if(o1.getProductPrice() > o2.getProductPrice())
				{
					return 1;
				}else
				{
					return -1;
				}
			}
		});
	}
	//sap xep gia tư cao den thap theo giá
	public void sortMaxMinPrice(ArrayList<Product> list)
	{
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				
				if(o1.getProductPrice() == o2.getProductPrice())
				{
					return 0;
				}else if(o1.getProductPrice() < o2.getProductPrice())
				{
					return 1;
				}else
				{
					return -1;
				}
			}
		});
	}
	//sapws xep theo phan tram giam gia
	public void sortSaleMinMax(ArrayList<Product> list)
	{
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {
				if(o1.getSaleOf() == o2.getSaleOf())
				{
					return 0;
				}else if(o1.getSaleOf() > o2.getSaleOf())
				{
					return 1;
				}
				else {
					return -1;
				}
			}
		});
	}
	//sapws xep theo phan tram giam gia
		public void sortSaleMaxMin(ArrayList<Product> list)
		{
			Collections.sort(list, new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					if(o1.getSaleOf() == o2.getSaleOf())
					{
						return 0;
					}else if(o1.getSaleOf() < o2.getSaleOf())
					{
						return 1;
					}
					else {
						return -1;
					}
				}
			});
		}
	
	public static void main(String[] args) throws SQLException {
		SortDao sortDao = new SortDao();
		ProductDao dao = new ProductDao();
		ArrayList<Product> list = dao.getALLProduct();
		for(Product p : list) {
			System.out.println(p.getProductID() + "\t" + p.getProductPrice() + "\t" + p.getSaleOf());
		}
		sortDao.sortMaxMinPrice(list);
		System.out.println("cao den thap price");
		for(Product p : list) {
			System.out.println(p.getProductID() + "\t" + p.getProductPrice() + "\t" + p.getSaleOf());
		}
		System.out.println("thap den cao price");
		sortDao.sortMinMaxPrice(list);
		for(Product p : list) {
			System.out.println(p.getProductID() + "\t" + p.getProductPrice() + "\t" + p.getSaleOf());
		}
		System.out.println("cao den thap sale of");
		sortDao.sortSaleMaxMin(list);
		for(Product p : list) {
			System.out.println(p.getProductID() + "\t" + p.getProductPrice() + "\t" + p.getSaleOf());
		}
		System.out.println("cao den thap sale");
		sortDao.sortSaleMinMax(list);
		for(Product p : list) {
			System.out.println(p.getProductID() + "\t" + p.getProductPrice() + "\t" + p.getSaleOf());
		}
		
	}
}
