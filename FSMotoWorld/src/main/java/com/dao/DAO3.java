package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes.Name;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Locale;
import java.time.LocalDate;



import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.Product;
import com.entity.accessories;
import com.entity.cart;
import com.entity.clothing;
import com.entity.customer;
import com.entity.maintenance;
import com.entity.order_details;
import com.entity.orders;
import com.entity.parts;
import com.entity.usermaster;
import com.entity.viewlist;
import com.utility.MyUtilities;
import java.text.SimpleDateFormat;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;

public class DAO3 {
	private Connection conn;
	
	public DAO3(Connection conn) {
		this.conn = conn;
	}
	
	
	// view parts
	
	public List<parts> getAllparts(){
		List<parts> listv = new ArrayList<parts>();
		
		parts v = null;
		
		try {
			String sql = "select * from parts";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				v = new parts();
				v.setBname(rs.getString(1));
				v.setCname(rs.getString(2));
				v.setPname(rs.getString(3));
				v.setPprice(rs.getInt(4));
				v.setPquantity(rs.getInt(5));
				v.setPimage(rs.getString(6));
				v.setDescription(rs.getString(7));
				listv.add(v);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return listv;
		}
		
	// view accessories
	
		public List<accessories> getAllaccessories(){
			List<accessories> listv = new ArrayList<accessories>();
			
			accessories v = null;
			
			try {
				String sql = "select * from accessories";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					v = new accessories();
					v.setBname(rs.getString(1));
					v.setCname(rs.getString(2));
					v.setPname(rs.getString(3));
					v.setPprice(rs.getInt(4));
					v.setPquantity(rs.getInt(5));
					v.setPimage(rs.getString(6));
					v.setDescription(rs.getString(7));
					listv.add(v);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return listv;
			}

		// view clothing
		
			public List<clothing> getAllclothing(){
				List<clothing> listv = new ArrayList<clothing>();
				
				clothing v = null;
				
				try {
					String sql = "select * from clothing";
					PreparedStatement ps = conn.prepareStatement(sql);
					
					ResultSet rs = ps.executeQuery();
					
					while(rs.next())
					{
						v = new clothing();
						v.setBname(rs.getString(1));
						v.setCname(rs.getString(2));
						v.setPname(rs.getString(3));
						v.setPprice(rs.getInt(4));
						v.setPquantity(rs.getInt(5));
						v.setPimage(rs.getString(6));
						v.setDescription(rs.getString(7));
						listv.add(v);
						
					}
					
					
						
					}catch (Exception e) {
						e.printStackTrace();
					}
					
					return listv;
				}
			
			// view maintenance
			
			public List<maintenance> getAllmaintenance(){
				List<maintenance> listv = new ArrayList<maintenance>();
				
				maintenance v = null;
				
				try {
					String sql = "select * from maintenance";
					PreparedStatement ps = conn.prepareStatement(sql);
					
					ResultSet rs = ps.executeQuery();
					
					while(rs.next())
					{
						v = new maintenance();
						v.setBname(rs.getString(1));
						v.setCname(rs.getString(2));
						v.setPname(rs.getString(3));
						v.setPprice(rs.getInt(4));
						v.setPquantity(rs.getInt(5));
						v.setPimage(rs.getString(6));
						v.setDescription(rs.getString(7));
						listv.add(v);
						
					}
					
					
						
					}catch (Exception e) {
						e.printStackTrace();
					}
					
					return listv;
				}


	
	
		

	//==================================
			// addtocartnull
			
			public boolean checkaddtocartnull(cart c)
			{
				boolean f = false;
			
			
				try{
					String sql = "select * from cart  where Name =? and bname=? and cname =? and pname = ? and pprice = ? and pimage = ?";
					PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1,c.getName());
				ps.setString(2, c.getBname());
				ps.setString(3, c.getCname());
				ps.setString(4, c.getPname());
				ps.setInt(5, c.getPprice());
				ps.setString(6, c.getPimage());
				
				ResultSet rs=ps.executeQuery();
				if (rs.next()==true)
					f = true;
				else
					f = false;
				
				}catch(Exception ex){
				   System.out.println(ex.getMessage());
				}

			return f;
					
			}
			
		// update cart	
			public int updateaddtocartnull(cart c) {
				
				int i = 0;
				try{
					String sql = "update cart set pquantity = (pquantity + 1) where Name =? and bname = ? and cname = ? and pname = ? and pprice = ? and pimage = ?" ;
					PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, c.getName());
				ps.setString(2, c.getBname());
				ps.setString(3, c.getCname());
				ps.setString(4, c.getPname());
				ps.setInt(5, c.getPprice());
				ps.setString(6, c.getPimage());
				
				i = ps.executeUpdate();
				if(i > 0)
					i = 1;
				
				
				}catch(Exception ex){
				   System.out.println(ex.getMessage());
				}

			return i;
				
				
				
			}
			
			//
	public int addtocartnull(cart c) {
				
				int i = 0;
				try{
					String sql = "insert into cart values(?,?,?,?,?,?,?)" ;
					PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, c.getName());
				ps.setString(2, c.getBname());
				ps.setString(3, c.getCname());
				ps.setString(4, c.getPname());
				ps.setInt(5, c.getPprice());
				ps.setInt(6, c.getPquantity());
				ps.setString(7, c.getPimage());
				
				i = ps.executeUpdate();
				if(i > 0)
					i = 1;
				
				
				}catch(Exception ex){
				   System.out.println(ex.getMessage());
				}

			return i;
				
				
				
			}
		
		
	
		
		// view orders
	
	
	public List<orders> getOrders(String o){
		List<orders> listv = new ArrayList<orders>();
		
		orders v = null;
		
		try {
			String sql = "select * from orders where Customer_Name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, o);
			
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

	
	//view orders by Date
		

	public List<orders> getOrdersbydate(String d){
		List<orders> listv = new ArrayList<orders>();
		
		orders v = null;
		
		try {
			String sql = "select * from orders where Date = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, d);
			
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
	
	

	




	
	

	


	
	
	

			//view order_details by date
	
	public List<order_details> getOrderdetails(String d){
		List<order_details> listd = new ArrayList<order_details>();
		
		order_details v = null;
		
		try {
			String sql = "select * from Order_details where Date = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, d);
			
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
				
				listd.add(v);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return listd;
		}

	
}
