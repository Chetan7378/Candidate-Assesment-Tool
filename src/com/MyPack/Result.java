package com.MyPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Result
 */
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Result() {
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
		int O=0,C=0,E=0,A=0,N=0;
		Connection con=DbConnection.connect();
		PreparedStatement pstmt,qr;
		try {
			qr=con.prepareStatement("select * from ques");
		ResultSet	qn=qr.executeQuery();
		
		
			
			pstmt=con.prepareStatement("select * from ques where qid=?");
			while(qn.next()){
				
	
			
			
				pstmt.setInt(1,qn.getInt(1));
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String result=null;
				if(request.getParameter("q"+qn.getInt(1)).equals("ha")){
					result=rs.getString(3);
				}
				else if(request.getParameter("q"+qn.getInt(1)).equals("a")){
					result=rs.getString(4);
				}
				else if(request.getParameter("q"+qn.getInt(1)).equals("n")){
					result=rs.getString(5);
				}
				else if(request.getParameter("q"+qn.getInt(1)).equals("d")){
					result=rs.getString(6);
				}
				else if(request.getParameter("q"+qn.getInt(1)).equals("hd")){
					result=rs.getString(7);
				}
				
				switch(result.charAt(0)){
				case 'o' : O+=Character.getNumericValue(result.charAt(1));
							break;
				case 'c' : C+=Character.getNumericValue(result.charAt(1));
							break;
				case 'e' : E+=Character.getNumericValue(result.charAt(1));
							break;
				case 'a' : A+=Character.getNumericValue(result.charAt(1));
							break;
				case 'n' : N+=Character.getNumericValue(result.charAt(1));
							break;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PreparedStatement psmt2;
		try {
			psmt2 = con.prepareStatement("insert into result values(?,?,?,?,?,?,?)");
			psmt2.setInt(1,GetSet.getJid());
			psmt2.setInt(2, GetSet.getCid());
			
			psmt2.setInt(3, O);
			psmt2.setInt(4, C);
			psmt2.setInt(5, E);
			psmt2.setInt(6, A);
			psmt2.setInt(7, N);
			
			if(psmt2.executeUpdate()==1){
				response.sendRedirect("candidateDashboard.html");
			}
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
