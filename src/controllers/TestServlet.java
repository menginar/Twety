package controllers;

import java.io.IOException;
import java.io.PrintWriter; 
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

import models.User; 

/**
 * Servlet implementation class TestServlet
 */
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		adduser(out);
        //getUser(out);
	}

	private void getUser(PrintWriter out){
			
		List<User> list =  User.findAll();
		for (int i = 0; i < list.size(); i++) {
			User usr = list.get(i);
			out.print(i + "." + "Username :" + usr.getUserName());
			out.print(i + "." + "firstname :" + usr.getfirstName());
			out.print(i + "." + "lastname :" + usr.getlastName());
		}
	}
	
	private void adduser(PrintWriter out){
		User u = new User("talhaAkkas", "talha-akkas", "talha", "akkas","pass", 1, Date.valueOf("30-3-1991"), "talhakkas@gmail.com");
		u.save();
	}

}
