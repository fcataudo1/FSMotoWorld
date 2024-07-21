package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.Product;
import com.entity.brand;
import com.entity.cart;
import com.entity.category;
import com.entity.customer;
import com.utility.MyUtilities;


public class DAO {
	private Connection conn;
	
	public DAO(Connection conn) {
		this.conn = conn;
	}
	
	
	// list all brand
	
	public List<brand> getAllbrand(){
		List<brand> listb = new ArrayList<brand>();
		
		brand b = null;
		
		try {
			String sql = "select * from brand";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				b = new brand();
				b.setBid(rs.getInt(1));
				b.setBname(rs.getString(2));
				listb.add(b);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return listb;
		}
	
	
	// list all category
	
	public List<category> getAllcategory(){
		List<category> listc = new ArrayList<category>();
		
		category c = null;
		
		try {
			String sql = "select * from category";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				c = new category();
				c.setCid(rs.getInt(1));
				c.setCname(rs.getString(2));
				listc.add(c);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return listc;
		}
	
	
	//
	public int  addproduct(HttpServletRequest request) {
		
		String path = "C:/Users/Swapnil/eclipse-workspace/imagetable2/src/main/webapp/";
		
		
		
			int a =  0;
			try {
				
				String pname = "";
				int pprice = 0;
				int pquantity = 0;
				String pimage = "";
				String description = "";
				int bid = 0;
				int cid = 0;
				
				String sql = "insert into product(pname,pprice,pquantity,pimage,description,bid,cid) values(?,?,?,?,?,?,?)";
				PreparedStatement ps= conn.prepareStatement(sql);
				

				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				for (FileItem item1 : multiparts) {
					if (item1.isFormField()) {
						if (item1.getFieldName().equals("pname"))
							pname = item1.getString();

						if (item1.getFieldName().equals("pprice"))
							pprice = Integer.parseInt(item1.getString());

						if (item1.getFieldName().equals("pquantity"))
							pquantity = Integer.parseInt(item1.getString());
						

						if (item1.getFieldName().equals("bname"))
						{
						if(item1.getString().equals("generico"))
							bid = 1;
						if(item1.getString().equals("did"))
							bid = 2;
						if(item1.getString().equals("barracuda"))
							bid = 3;
						if(item1.getString().equals("dainese"))
							bid = 4;
						if(item1.getString().equals("wd-40"))
							bid = 5;
						}
						if (item1.getFieldName().equals("cname"))
						{
							if(item1.getString().equals("accessori"))
								cid = 1;
							if(item1.getString().equals("ricambi"))
								cid = 2;
							if(item1.getString().equals("abbigliamento"))
								cid = 3;
							if(item1.getString().equals("manutenzione"))
								cid = 4;
						}
			
					

					
					
					else
						{
						com.utility.MyUtilities m1=new MyUtilities();
						String destinationpath=path + "images/";
						ArrayList <String> ext=new ArrayList();
						ext.add(".jpg");ext.add(".bmp");ext.add(".jpeg");ext.add(".png");ext.add(".webp");
						
						pimage = m1.UploadFile(item1, destinationpath, ext);
						
						}
					if (item1.getFieldName().equals("description"))
						description = item1.getString();
				}
				}
				
				if(pimage.equals("Problema con il caricamento") == false)
				{
					
					
					ps.setString(1, pname);
					ps.setInt(2,pprice);
					ps.setInt(3,pquantity);
					ps.setString(4,pimage);
					ps.setString(5,description);
					ps.setInt(6,bid);
					ps.setInt(7,cid);
					ps.executeUpdate();
					a = 1;
				}
				
				System.out.println("pname: " + pname);
				System.out.println("pprice: " + pprice);
				System.out.println("pquantity: " + pquantity);
				System.out.println("pimage: " + pimage);
				System.out.println("description: " + description);
				System.out.println("bid: " + bid);
				System.out.println("cid: " + cid);
				
				
				conn.close();
				
			}catch (Exception e) {
				System.out.println(e);
			}
		return a;
			
		}
	
	//list Product
	
	public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setPprice(rs.getInt("pprice"));
                p.setPquantity(rs.getInt("pquantity"));
                p.setPimage(rs.getString("pimage"));
                p.setDescription(rs.getString("description"));
                p.setBid(rs.getInt("bid"));
                p.setCid(rs.getInt("cid"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public Product getProductById(int pid) {
	    Product product = null;
	    try {
	        String sql = "SELECT * FROM product WHERE pid=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, pid);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            product = new Product();
	            product.setPid(rs.getInt("pid"));
	            product.setPname(rs.getString("pname"));
	            product.setPprice(rs.getInt("pprice"));
	            product.setPquantity(rs.getInt("pquantity"));
	            product.setPimage(rs.getString("pimage"));
	            product.setDescription(rs.getString("description"));
	            product.setBid(rs.getInt("bid"));
	            product.setCid(rs.getInt("cid"));
	        }
	        rs.close();
	        ps.close();
	    } catch (Exception e){
	        System.out.println(e);
	    }
	    return product;
	}
	

	    
	    public int updateaproductname(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set pname=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, p.getPname());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
	    
	    
	    public int updateaproductdescription(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set description=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, p.getDescription());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
	    // Metodo per aggiornare il prezzo del prodotto
	   
	    public int updateproductprice(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set pprice=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, p.getPprice());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
		
	    
	    
	    public int updateproductquantity(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set pquantity=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, p.getPquantity());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
	    
	    public int updateaproductimage(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set pimage=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, p.getPimage());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
	    
	    
	    public int updateaproductbrandid(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set bid=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, p.getBid());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	    
	   
	    
	    public int updateaproductcategoryid(Product p) {
			
			int i = 0;
			try{
				String sql = "update product set cid=? WHERE pid=?" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, p.getCid());
			ps.setInt(2, p.getPid());
		
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
	

    
    
    



	

	
	//delete product 
	public boolean deleteProduct(Product p)
	{
		boolean f = false;
		
		try {
			
			String sql = "delete from product where pid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getPid());
			
			
			
			int i = ps.executeUpdate();
			
			
			if(i == 1)
			{
				f = true;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
		
		
		
	
	
	



//display all customers

public List<customer> getAllCustomer()
{
	List<customer> list = new ArrayList <customer>();
	
	customer c = null;
	
	try {
		String sql = "select * from customer";
		PreparedStatement ps = conn.prepareStatement(sql);
		
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{
		c = new customer();
		c.setName(rs.getString(1));
		c.setPassword(rs.getString(2));
		c.setEmail_Id(rs.getString(3));
		c.setContact_No(rs.getString(4));
		list.add(c);
		
	}
	
	
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}


//Delete Customer

	public boolean deleteCustomer(customer c)
	{
		boolean f = false;
		
		try {
			
			String sql = "delete from customer where Name = ? and Email_Id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail_Id());
			
			
			int i = ps.executeUpdate();
			
			
			if(i == 1)
			{
				f = true;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	// display selected customer

public List<customer> getCustomer(String eid)
{
	List<customer> list = new ArrayList <customer>();
	
	customer c = null;
	
	try {
		String sql = "select * from customer where Email_Id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, eid);
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{
		c = new customer();
		c.setName(rs.getString(1));
		c.setPassword(rs.getString(2));
		c.setEmail_Id(rs.getString(3));
		c.setContact_No(rs.getString(4));
		list.add(c);
		
	}
	
	
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}
	
}
