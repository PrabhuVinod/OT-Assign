package com.practise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("/HelloWorld");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileDB fileDB=new FileDB("C:\\Users\\ptikkise\\workspace\\HelloWorld\\src\\com\\practise\\emp_data.json");
		if(fileDB.checkLogin(request.getParameter("username"), request.getParameter("password"))){
			HttpSession session=request.getSession();
			System.out.println(request.getParameter("username"));
			User users=new User();
			users.setAllUsers(fileDB.users.getAllUsers());
			User user=users.getUser(request.getParameter("username"));
			session.setAttribute("username", user.getUsername());
			session.setAttribute("firstname", user.getFirstname());
			session.setAttribute("lastname", user.getLastname());
			session.setAttribute("age", String.valueOf(user.getAge()));
			session.setAttribute("mobile", user.getMobile());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("address", user.getAddress());
			
			request.setAttribute("userlist", fileDB.allUsers);
			
			RequestDispatcher rs= request.getRequestDispatcher("/user/dashboard.jsp");
			rs.forward(request, response);
		}
		else{
			response.sendRedirect("/HelloWorld");
		}
	}

}
