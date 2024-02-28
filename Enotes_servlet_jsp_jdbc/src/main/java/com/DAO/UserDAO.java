package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserData;

public class UserDAO {

	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addUser(UserData user) {

		boolean f = false;

		try {

			String query = "insert into user(Name,Email,Password) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
				/* System.out.printf("Number of rows affected:",i); */
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public UserData loginUser(UserData user) {
		UserData usd = new UserData();

		try {
			String query = "select * from user where Email=? and Password=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				usd.setId(rs.getInt(1));
				usd.setName(rs.getString(2));
				usd.setEmail(rs.getString(3));
				usd.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return usd;
	}

}
