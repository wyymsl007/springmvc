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
 * Servlet implementation class ShoppingCart
 */
@WebServlet("/AddShoppingCart")
public class AddShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShoppingCart() {
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
		String userName = (String)session.getAttribute("userName");
		String goodsName = request.getParameter("goodsName");
		double price = Double.parseDouble(request.getParameter("price"));
		String goodsImg = request.getParameter("goodsImg");
		ArrayList<USER_ShoppingCart> list = null;
		try {
			list = new GoodControl().getUserSCList(userName);
			request.getRequestDispatcher("index.jsp").forward(request,response);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(list == null) {
			/*USER_ShoppingCart USER_shoppingCart = new USER_ShoppingCart(); 
			USER_shoppingCart.setGoodsName(goodsName);
			USER_shoppingCart.setPay(false);
			USER_shoppingCart.setPaySum(1);
			USER_shoppingCart.setUserName(userName);
			try {
				DatabaseConn.addShoppingCartToDb(USER_shoppingCart);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		}else {
				int i ;//list恒不是null，1.第一次列表内容为空，第一个for循环不执行，添加数据。
						//2.当列表内容不空且用户名、商品名同时有时，更新数据
						//3.不存在同时有，添加数据
					for(i = 0; i<list.size(); i++) {
						if(list.get(i).getUserName().equals(userName) && list.get(i).getGoodsName().equals(goodsName)) {
							list.get(i).setPaySum(list.get(i).getPaySum()+1);
							try {
								DatabaseConn.updateShoppingCart(list.get(i));
								request.getRequestDispatcher("index.jsp").forward(request,response);
								break;
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
					if(i == list.size()) {
						USER_ShoppingCart USER_shoppingCart = new USER_ShoppingCart(); 
						USER_shoppingCart.setGoodsName(goodsName);
						USER_shoppingCart.setPay(false);
						USER_shoppingCart.setPaySum(1);
						USER_shoppingCart.setUserName(userName);
						USER_shoppingCart.setPrice(price);
						try {
							DatabaseConn.addShoppingCartToDb(USER_shoppingCart);
							request.getRequestDispatcher("index.jsp").forward(request,response);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
			}
	}
		
		
		//USER_ShoppingCart USER_shoppingCart = (USER_ShoppingCart)session.getAttribute("USER_shoppingCart");
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
