package com.dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.entity.cart;
import com.entity.contactus;
import com.entity.order_details;
import com.entity.orders;
import com.entity.viewlist;

import java.util.Calendar;

public class DAO5 {
	private Connection conn;
	
	public DAO5(Connection conn) {
		this.conn = conn;
	}
	
	
	// view all cart
	
		public List<cart> getAllcart(){
			List<cart> listv = new ArrayList<cart>();
			
			cart v = null;
			
			try {
				String sql = "select * from cart";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					v = new cart();
					v.setName(rs.getString(1));
					v.setBname(rs.getString(2));
					v.setCname(rs.getString(3));
					v.setPname(rs.getString(4));
					v.setPprice(rs.getInt(5));
					v.setPquantity(rs.getInt(6));
					v.setPimage(rs.getString(7));
					listv.add(v);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return listv;
			}
		
		
		// view all orders
		
		public List<orders> getAllorders(){
			List<orders> listv = new ArrayList<orders>();
			
			orders v = null;
			
			try {
				String sql = "select * from orders";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					v = new orders();
					v.setOrder_Id(rs.getInt(1));
					v.setCustomer_Name(rs.getString(2));
					v.setCustomer_City(rs.getString(3));
					v.setDate(rs.getString(4));
					v.setTotal_Price(rs.getInt(5));
					v.setStatus(rs.getString(6));
					listv.add(v);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return listv;
			}
		
		
		// View orders based on Customer_Name
		public List<orders> getOrdersByCustomerName(String Customer_Name) {
		    List<orders> list = new ArrayList<>();
		    orders v = null;

		    try {
		        String sql = "SELECT * FROM orders WHERE Customer_Name = ?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, Customer_Name); // Assegna il valore del parametro

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            v = new orders();
		            v.setOrder_Id(rs.getInt("Order_Id"));
		            v.setCustomer_Name(rs.getString("Customer_Name"));
		            v.setCustomer_City(rs.getString("Customer_City"));
		            v.setDate(rs.getString("Date"));
		            v.setTotal_Price(rs.getInt("Total_Price"));
		            v.setStatus(rs.getString("Status"));
		            list.add(v);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}
		
		

		public List<orders> getOrdersByDateRange(String startDateStr, String endDateStr) {
	        List<orders> list = new ArrayList<>();
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	        SimpleDateFormat dbDateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
	        SimpleDateFormat desiredFormat = new SimpleDateFormat("yyyy-MM-dd");

	        try {
	            // Convert input date strings to Date objects
	            Date startDate = inputFormat.parse(startDateStr);
	            Date endDate = inputFormat.parse(endDateStr);

	            // Set the time of endDate to the end of the day to make it inclusive
	            Calendar cal = Calendar.getInstance();
	            cal.setTime(endDate);
	            cal.set(Calendar.HOUR_OF_DAY, 23);
	            cal.set(Calendar.MINUTE, 59);
	            cal.set(Calendar.SECOND, 59);
	            cal.set(Calendar.MILLISECOND, 999);
	            endDate = cal.getTime();

	            System.out.println("Start Date: " + startDate);
	            System.out.println("End Date: " + endDate);

	            // Retrieve all orders from the database
	            String sql = "SELECT * FROM orders";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                // Get order date from the result set and parse it
	                String orderDateString = rs.getString("Date");
	                Date orderDate = dbDateFormat.parse(orderDateString);

	                // Format order date to yyyy-MM-dd
	                String formattedOrderDate = desiredFormat.format(orderDate);
	                Date formattedDate = desiredFormat.parse(formattedOrderDate);

	                System.out.println("Order Date: " + orderDate);
	                System.out.println("Formatted Order Date: " + formattedOrderDate);

	                // Check if order date is within the specified range
	                if (!formattedDate.before(startDate) && !formattedDate.after(endDate)) {
	                    orders v = new orders();
	                    v.setOrder_Id(rs.getInt("Order_Id"));
	                    v.setCustomer_Name(rs.getString("Customer_Name"));
	                    v.setCustomer_City(rs.getString("Customer_City"));
	                    v.setDate(formattedOrderDate);
	                    v.setTotal_Price(rs.getInt("Total_Price"));
	                    v.setStatus(rs.getString("Status"));
	                    list.add(v);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }








		
		// view all order_details
		
		
		public List<order_details> getAllorder_details(){
			List<order_details> listv = new ArrayList<order_details>();
			
			order_details v = null;
			
			try {
				String sql = "select * from order_details";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					v = new order_details();
					v.setDate(rs.getString(1));
					v.setName(rs.getString(2));
					v.setBname(rs.getString(3));
					v.setCname(rs.getString(4));
					v.setPname(rs.getString(5));
					v.setPprice(rs.getInt(6));
					v.setPquantity(rs.getInt(7));
					v.setPimage(rs.getString(8));
					listv.add(v);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return listv;
			}
		
		
		//remove order_details
		
		

		public int removeorder_details(order_details c) {
		
		int j = 0;
		try{
			String sql = "delete from order_details where Date= ? and pimage= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1, c.getDate());
			ps.setString(2, c.getPimage());

		
		j = ps.executeUpdate();
		if(j > 0)
			j = 1;
		
		
		}catch(Exception ex){
		   System.out.println(ex.getMessage());
		}

		return j;
			
		
		
		}
		
		
		// add to contact us
		
public int addContactus(contactus c) {
			
			int i = 0;
			try{
				String sql = "insert into Contactus(Name,Email_Id,Contact_No,Message) values(?,?,?,?)" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail_Id());
			ps.setString(3, c.getContact_No());
			ps.setString(4, c.getMessage());
			
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	

	// view table contactus
public List<contactus> getcontactus(){
	List<contactus> listv = new ArrayList<contactus>();
	
	contactus v = null;
	
	try {
		String sql = "select * from Contactus";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			v = new contactus();
			v.setId(rs.getInt(1));
			v.setName(rs.getString(2));
			v.setEmail_Id(rs.getString(3));
			v.setContact_No(rs.getString(4));
			v.setMessage(rs.getString(5));
			
			listv.add(v);
			
		}
		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return listv;
	}

		//remove from contactus



	public int removecont(contactus c) {
	
	int j = 0;
	try{
		String sql = "delete from Contactus where id= ?";
		PreparedStatement ps = conn.prepareStatement(sql);
	
		ps.setInt(1, c.getId());
		

	
	j = ps.executeUpdate();
	if(j > 0)
		j = 1;
	
	
	}catch(Exception ex){
	   System.out.println(ex.getMessage());
	}

	return j;
		
	
	
	}
	
	

}
