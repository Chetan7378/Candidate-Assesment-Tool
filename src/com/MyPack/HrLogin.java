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
 * Servlet implementation class HrLogin
 */
public class HrLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HrLogin() {
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
		int hrid = 0;
		String email=request.getParameter("email");
		
		String pwd=request.getParameter("pwd");
		Connection con=DbConnection.connect();
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from hr where email=? and pwd=?");
			pstmt.setString(1, email);
			GetSet.setEmail(email);
			pstmt.setString(2,pwd);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				PreparedStatement st=con.prepareStatement("select hrid from hr where email=?");
				st.setString(1, GetSet.getEmail());
				ResultSet rrs=st.executeQuery();
				if(rrs.next()){
					
			
				GetSet.setHrid(hrid);
				response.sendRedirect("hrDashboard.html");
				}
			else
			{
				response.sendRedirect("index.html");
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
