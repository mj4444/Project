package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.model.Customer;

import database.ConnectionProvider;

public class OrderCompletion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dealerId = request.getParameter("selectDealer");
		HttpSession httpSession = request.getSession(false);
		if (httpSession == null) {
		} else {
			int[] quantity = (int[]) httpSession.getAttribute("quantity");
			String[] itemList = (String[]) httpSession.getAttribute("items");
			Customer customer=(Customer) httpSession.getAttribute("customer");
			
			Connection connection=ConnectionProvider.getConnection();
			String query1="Select price from items where itemid=?";
			int cost=0;
			for(int i=0;i<itemList.length;i++){
				PreparedStatement preparedStatement;
				try {
					preparedStatement = connection.prepareStatement(query1);
					preparedStatement.setString(1, itemList[i]);
					ResultSet resultSet=preparedStatement.executeQuery();
					while(resultSet.next()){
						cost+=resultSet.getInt(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			String query="Insert into orders values(orderid_seq.nextval,?,?,?,?)";
			
			try {
				PreparedStatement preparedStatement=connection.prepareStatement(query);
				preparedStatement.setInt(1, cost);
				preparedStatement.setString(2, dealerId);
				preparedStatement.setInt(3, 0);
				preparedStatement.setString(4, customer.getCustomerId());
				int result=preparedStatement.executeUpdate();
				if(result>0)
					System.out.println("Inserted");
				else
					System.out.println("Not Inserted");
				
				String query2="Insert into order_item_quantity values(orderid_seq.currval,?,?)";
				
				for(int i=0;i<itemList.length;i++){
					preparedStatement=connection.prepareStatement(query2);
					preparedStatement.setString(1, itemList[i]);
					preparedStatement.setInt(2, quantity[i]);
					result=preparedStatement.executeUpdate();
					if(result>0)
						System.out.println("Inserted");
					else
						System.out.println("Not Inserted");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int orderId = 0;
			Statement statement;
			try {
				statement = connection.createStatement();
				query1="select orderid_seq.currval from dual";
				ResultSet resultSet=statement.executeQuery(query1);
				while(resultSet.next()){
					orderId=resultSet.getInt(1);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			String query2="insert into inbox values(inbox_seq.nextval,?,?,?)";
			try {
				PreparedStatement preparedStatement=connection.prepareStatement(query2);
				preparedStatement.setString(1, "You have and order from a of orderID : "+orderId);
				preparedStatement.setString(2, dealerId);
				preparedStatement.setString(3, customer.getCustomerId());
				int result=preparedStatement.executeUpdate();
				if(result>0)
					System.out.println("Inserted in Inbox");
				else
					System.out.println("Not Inserted in Inbox");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		response.sendRedirect("CustomerHomePage.jsp?var=OrderCompleteMessage");
	}

}
