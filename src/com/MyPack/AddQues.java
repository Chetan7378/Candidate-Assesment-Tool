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
 * Servlet implementation class AddQues
 */
public class AddQues extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQues() {
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
		int qid=0;
		String que = request.getParameter("que");
    String hd = request.getParameter("hd");
    String d = request.getParameter("d");
    String n = request.getParameter("n");
    String a = request.getParameter("a");
    String ha = request.getParameter("ha");
    
    Connection con = DbConnection.connect();
    PreparedStatement pstmt;
	try {
		pstmt = con.prepareStatement("insert into ques values(?,?,?,?,?,?,?)");
		 	pstmt.setInt(1, qid);
	        pstmt.setString(2, que);
	        pstmt.setString(3, ha);
	        pstmt.setString(4, a);
	        pstmt.setString(5, n);
	        pstmt.setString(6, d);
	        pstmt.setString(7, hd);
	        int i = pstmt.executeUpdate();
	        if(i>0)
	        {
	        	response.sendRedirect("hrDashboard.html");
	        }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
