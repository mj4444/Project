package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.apt.model.IElementInfo;


public class ChooseItemsForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemID[]=request.getParameterValues("itemList");
		String[] quan=request.getParameterValues("quantity");
		int[] quantity=new int[quan.length];
		//out.print("\nLength\t:"+quan.length+"\n");
		int j=0;
		for(int i=0;i<quan.length;i++){
			if(!quan[i].equals("")){
				quantity[j++]=Integer.parseInt(quan[i]);
			}
		}
		
		HttpSession httpSession=request.getSession(true);
		httpSession.setAttribute("items", itemID);
		httpSession.setAttribute("quantity", quantity);
		
		response.sendRedirect("CustomerHomePage.jsp?var=orderFormSubmit");
	}
}
