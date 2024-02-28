package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.UserPost;

public class PostDAO {

	private Connection con;// for dao connection is required

	public PostDAO(Connection con) {
		super();
		this.con = con;
	}

	///// post dao logic
	public boolean addPost(String title, String content, int usid) {

		boolean f = false;

		try {

			String query = "insert into post(title,content,uid) values(?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, usid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	/// showing notes to client

	public List<UserPost> getNotes(int id) {
		List<UserPost> li = new ArrayList<UserPost>();

		UserPost usp;

		try {
			String qu = "select * from post where uid=?";
			PreparedStatement ps = con.prepareStatement(qu);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				usp = new UserPost();
				usp.setId(rs.getInt(1));
				usp.setTitle(rs.getString(2));
				usp.setContent(rs.getString(3));
				

				li.add(usp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return li;

	}

	// edit note data

	public UserPost geteditNoteData(int noteid) {

		UserPost p = null;

		try {

			String query = "select * from post where id=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, noteid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				p = new UserPost();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	// delete post

	public boolean deleteNote(int noteid) {

		boolean f = false;

		try {

			String query = "delete from post where id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, noteid);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// update note operation

	public boolean updateNote(int noteid, String title, String content) {

		boolean f = false;

		try {
			String query = "update post set title=?,content=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, noteid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
