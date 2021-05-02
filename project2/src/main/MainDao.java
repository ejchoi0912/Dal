package main;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.BookDto;
import db.DBClose;
import db.DBConnection;
import login.MemberDto;

public class MainDao {
	
private static MainDao dao = new MainDao();
	
	private MainDao() {
		
	}
	
	public static MainDao getInstance() {
		return dao;
	}
	
}
