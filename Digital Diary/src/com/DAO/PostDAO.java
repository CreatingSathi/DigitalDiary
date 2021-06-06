package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDAO {
	private Connection con;

	public PostDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean AddNotes(String ti, String co, int ui) {

		boolean f = false;
		try {
			String qu = "insert into post(title,content,uid) values(?,?,?)";

			PreparedStatement ps = con.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Post> getData(int id) {
		List<Post> list = new ArrayList<Post>();
		Post p = null;
		try {
			String q = "select * from post where uid=? order by id DESC";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setPdate(rs.getTimestamp(4));
				list.add(p);
			}

		} catch (Exception e) {

		}

		return list;

	}
	
	public Post getDataById(int noteid)
	{
		Post po= null;
		try{
			String q="select * from post where id =?";
			
			PreparedStatement ps=con.prepareStatement(q);
			ps.setInt(1, noteid);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				po= new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return po;
	}
	
	public boolean PostUpdate(int nid, String ti, String co){
		boolean f = false;
		try{
			String q="update post set title=?, content=? where id=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, nid);
			int i= ps.executeUpdate();
			
			if(i==1){
				f=true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public boolean DeleteNotes(int nid){
		boolean f=false;
		try{
			String q="delete from post where id=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setInt(1,nid);
			int j=ps.executeUpdate();
			
			if(j==1){
				f=true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean PostNewPassword( String password){
		boolean f = false;
		try{
			String q="update post set password=?, where email=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, password);
			
			int i= ps.executeUpdate();
			
			if(i==1){
				f=true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}

}