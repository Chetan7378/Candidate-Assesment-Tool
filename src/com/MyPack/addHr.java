package com.MyPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class addHr
 */
public class addHr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addHr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int hrid=0;
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		long mobile=Long.parseLong(request.getParameter("mobile"));
		String pwd=request.getParameter("pwd");
		String des=request.getParameter("des");
		Connection con=DbConnection.connect();
		try {
			PreparedStatement stmt=con.prepareStatement("insert into hr values(?,?,?,?,?,?)");
			stmt.setInt(1, hrid);
			stmt.setString(2, name);
			stmt.setString(3,email);
			stmt.setLong(4, mobile);
			stmt.setString(5, pwd);
			stmt.setString(6, des);
			int i=stmt.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("addedHr.html");
			}else{
				response.sendRedirect("error.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
