package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection con;

	public static Connection getCon() {
		try {

			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes", "root", "Root@Sathi02");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}
