package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;
import org.mindrot.jbcrypt.BCrypt;




@MultipartConfig
@WebServlet("/addUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addUser() {
       
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String regno = new String(request.getParameter("regno"));
		regno = regno.trim();
		String name = new String(request.getParameter("name"));
		name = name.trim();
		
		String password = new String(request.getParameter("password"));
		password = password.trim();
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt(10));
		
		String email = new String(request.getParameter("email"));
		email = email.trim();
	
		String phone = new String(request.getParameter("phone"));
		phone = phone.trim();
		
		
		User vtr = new User();
		vtr.setName(name);
		vtr.setPassword(hashed);
		vtr.setEmail(email);
		vtr.setPhone(phone);
		vtr.setRegNo(regno);
		
		
		
		
		try{
			UserDAO dao =new UserDAO(DBConnect.getConn());
			
			
		 	if(dao.checkVoter2(vtr) == true)
			{
		 		Cookie vtrnotadded = new Cookie("vtrnotadded","vtrnotadded");
				vtrnotadded.setMaxAge(10);
				response.addCookie(vtrnotadded);
				response.sendRedirect("register.jsp");
				
				
			}
			else
			{
		
			    if(dao.addVoter(vtr) > 0)
			    {
			    	Cookie vtradded = new Cookie("vtradded","vtradded");
					vtradded.setMaxAge(10);
					response.addCookie(vtradded);
			    	response.sendRedirect("register.jsp");
			    }
			    else {
			    	Cookie vtrnotadded = new Cookie("vtrnotadded","vtrnotadded");
					vtrnotadded.setMaxAge(10);
					response.addCookie(vtrnotadded);
			    	response.sendRedirect("register.jsp");
			    }
			
			}
			
		}catch (Exception ex){
			System.out.println(ex);
		}

	
			
		
				
			
			
		
		
	}

}
