package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ConnectionProvider;

public class RateDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] rating=request.getParameterValues("rate");
		String[] dealerIDS=request.getParameterValues("rateDealer");
		Connection connection=ConnectionProvider.getConnection();
		String query="Update dealers set rating=? where dealerId=?";
		try {
			for(int i=0;i<dealerIDS.length;i++){
				PreparedStatement preparedStatement=connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(rating[i]));
				preparedStatement.setString(2, dealerIDS[i]);
				int result=preparedStatement.executeUpdate();
				if(result>0)
					System.out.println("Rating Updated");
				else
					System.out.println("Rating Not Updated");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("CustomerHomePage.jsp?var=feedbackMessage");
	}

}
