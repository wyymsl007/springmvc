package net.onest.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.onest.beans.Goods;
import net.onest.controller.GoodControl;

/**
 * Servlet implementation class PageDivide
 */
@WebServlet("/PageDivide")
public class PageDivide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageDivide() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method 
		try {
			List<Goods> goodsList = new GoodControl().getGoodsList();
			HttpSession session = request.getSession();
			session.setAttribute("goodsList",goodsList);
			int pageCount = new GoodControl().getPageCount(4);
			session.setAttribute("pageCount",pageCount);
			int pageIndex = 0;
			if(request.getParameter("pageIndex") == null) {
				pageIndex = 1;
			}else {
				pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			}
			session.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
