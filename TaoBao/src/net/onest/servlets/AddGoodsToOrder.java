package net.onest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.onest.beans.USER_ShoppingCart;
import net.onest.controller.GoodControl;
import net.onest.dao.DatabaseConn;

/**
 * Servlet implementation class AddGoodsToOrder
 */
@WebServlet("/AddGoodsToOrder")
public class AddGoodsToOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodsToOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ArrayList<USER_ShoppingCart> selectGoodsList = (ArrayList<USER_ShoppingCart>)session.getAttribute("selectGoodsList");
		for(int i = 0; i < selectGoodsList.size(); i++) {
		try {
				DatabaseConn.addGoodsToOrder(selectGoodsList.get(i));
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
/*			out.write(selectGoodsList.get(i).getUserName()+"<br>");
			out.write(selectGoodsList.get(i).getGoodsName()+"<br>");
			out.write(selectGoodsList.get(i).getGoodsImg()+"<br>");
			out.write(selectGoodsList.get(i).getPaySum()+"<br>");
			out.write(selectGoodsList.get(i).getPrice()+""+"<br>");*/
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
