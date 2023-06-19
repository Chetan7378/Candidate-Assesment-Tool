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
 * Servlet implementation class addJob
 */
public class addJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addJob() {
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
		int jid=0;
	int hrid = 0;
		String jtitle=request.getParameter("jtitle");
		String jdes=request.getParameter("jdes");
		
		String sal=request.getParameter("sal");
		String qual="";
		int exp=Integer.parseInt(request.getParameter("exp"));
		boolean o,c,e,a,n;
		Connection con=DbConnection.connect();
	
		PreparedStatement pstmt;
		try {
			try{
			if(request.getParameter("o").equals("openness"))
			{
				qual+=("openness");
			}
			}
			catch(java.lang.NullPointerException ne)
			{
				o=false;
			}
			try{
			if(request.getParameter("c").equals(" Conscientiousness"))
			{
				qual+=(" Conscientiousness");
			}
			}catch(java.lang.NullPointerException ne)
			{
				c=false;
			}
			try{
			if(request.getParameter("e").equals("Extraversion"))
			{
				qual+=("Extraversion");
			}
			}catch(java.lang.NullPointerException ne)
			{
				e=false;
			}
			try{
			if(request.getParameter("a").equals("Agreeableness"))
			{
				qual+=("Agreeableness");
			}
			}catch(java.lang.NullPointerException ne)
			{
				a=false;
			}
			try{
			if(request.getParameter("n").equals("Neuroticism"))
			{
				qual+=("Neuroticism");
			}
			}catch(java.lang.NullPointerException ne)
			{
				n=false;
			}
		
	
		
			PreparedStatement stmt=con.prepareStatement("insert into job values(?,?,?,?,?,?,?)");
			stmt.setInt(1, jid);
			stmt.setString(2, jtitle);
			stmt.setString(3,jdes);
			stmt.setString(4, sal);
			stmt.setString(5, qual);
			stmt.setInt(6, exp);
			stmt.setInt(7,GetSet.getHrid());
			int i=stmt.executeUpdate();
			if(i>0)
			{
				 PreparedStatement p = con.prepareStatement("select Jid from job");
				 GetSet.setJid(jid);
				  ResultSet r = p.executeQuery();
				response.sendRedirect("addedJob.html");
			}else{
				response.sendRedirect("error.html");
			}
		} catch (SQLException ne) {
			// TODO Auto-generated catch block
			ne.printStackTrace();
		}
		
		
		
		
	}
		
	}


