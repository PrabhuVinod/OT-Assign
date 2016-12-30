package com.practise;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Response;

/**
 * Servlet implementation class SaveUser
 */
public class SaveUser extends HttpServlet {
	FileDB fileDB = new FileDB("C:\\Users\\ptikkise\\workspace\\HelloWorld\\src\\com\\practise\\emp_data.json");

	// for registraton
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		User new_user = new User(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("mobile"),
				request.getParameter("address"), request.getParameter("email"),
				Integer.valueOf(request.getParameter("age")));
		fileDB.addUser(new_user);
		response.sendRedirect("/HelloWorld");
		return;
	}
	

	// for adding user
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try{
		User new_user = new User(request.getParameter("username"), request.getParameter("password"),
				request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("mobile"),
				request.getParameter("address"), request.getParameter("email"),
				Integer.valueOf(request.getParameter("age")));
		fileDB.addUser(new_user);
		}
		catch(Exception e){
			if(request.getParameter("action").toString().equals("logout")){
				HttpSession session=request.getSession(false);
				session.invalidate();
				response.sendRedirect("/");
				return;
		}
		}
		
	}


	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		fileDB.deleteUser(request.getParameter("username"));
	}


	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			if(req.getParameter("action").toString().equals("logout")){
				HttpSession session=req.getSession(false);
				session.invalidate();
				//resp.sendRedirect("/");
				return;
			}
			return;

	}
	

}
