package net.onest.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.onest.beans.USER_ShoppingCart;

public class DatabaseConn {
	 static String driverStr = "com.mysql.jdbc.Driver";
	 static String connUrl = "jdbc:mysql://127.0.0.1:3306/taobao?useUnicode=true&characterEncoding=UTF-8";
	 static Connection conn = null;
	 public static void addUserToDb(String userName,String passWord) throws ClassNotFoundException, SQLException {
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 Statement statement = conn.createStatement();//注意sql插入语句values小括号里参数值是单引号('')的！所以通过"'" + 字符串 + "'"的形式将字符串("")转换为''格式
		 String sqlStr = "insert into user(userName,passWord) values(" + "'" + userName + "'" + "," + "'" + passWord + "'" + ")";
		 statement.executeUpdate(sqlStr);
	 }
	 public static ResultSet getUserListRS() throws ClassNotFoundException, SQLException {
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 Statement statement = conn.createStatement();
		 String sqlStr = "select * from user";
		 ResultSet userListRS = statement.executeQuery(sqlStr);
		 return userListRS;
	 }
	 public static ResultSet getGoodsListRS() throws ClassNotFoundException, SQLException {
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 Statement statement = conn.createStatement();
		 String sqlStr = "select * from goods";
		 ResultSet goodsListRS = statement.executeQuery(sqlStr);
		 return goodsListRS;
	 }
	 public static ResultSet getAllRowsCountRS() throws ClassNotFoundException, SQLException {
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 Statement statement = conn.createStatement();
		 String sqlStr = "select count(goodsName) as allRowsCount from goods";
		 ResultSet allRowsCountRS = statement.executeQuery(sqlStr);
		 return allRowsCountRS;
	 }
	 public static void addShoppingCartToDb(USER_ShoppingCart USER_shoppingCart) throws ClassNotFoundException, SQLException {
		 String userName = USER_shoppingCart.getUserName();
		 String goodsName = USER_shoppingCart.getGoodsName();
		 int paySum = USER_shoppingCart.getPaySum();		 	
		 boolean isPay = USER_shoppingCart.isPay();
		 double price = USER_shoppingCart.getPrice();
		 
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 String sqlStr = "insert into user_shoppingcart(userName,goodsName,paySum,isPay,price) values(?,?,?,?,?)"; 
		 PreparedStatement ps = conn.prepareStatement(sqlStr);
		 ps.setString(1,userName);
		 ps.setString(2,goodsName);
		 ps.setInt(3,paySum);
		 ps.setBoolean(4,isPay);
		 ps.setDouble(5,price);
		 ps.executeUpdate();

	 }
	 public static void updateShoppingCart(USER_ShoppingCart USER_shoppingCart) throws ClassNotFoundException, SQLException {
		 String userName = USER_shoppingCart.getUserName();
		 String goodsName = USER_shoppingCart.getGoodsName();
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 String sqlStr = "update user_shoppingcart set paySum = ? where userName = ? and goodsName = ?";
		 PreparedStatement ps = conn.prepareStatement(sqlStr);
		 ps.setInt(1,USER_shoppingCart.getPaySum());
		 ps.setString(2,userName);
		 ps.setString(3,goodsName);
		 ps.executeUpdate();
	 }
	 public static ResultSet getUserSCListRS(String userName) throws ClassNotFoundException, SQLException {
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 String sqlStr = "select user_shoppingcart.*,goodsImg from user_shoppingcart,goods where userName = ? and user_shoppingcart.goodsName = goods.goodsName";
		 PreparedStatement ps = conn.prepareStatement(sqlStr);
		 ps.setString(1,userName);
		 ResultSet userSCListRS = ps.executeQuery();
		 return userSCListRS;
	 }
	public static void addGoodsToOrder(USER_ShoppingCart USER_shoppingCart) throws ClassNotFoundException, SQLException {
		/*Class.forName(driverStr);
		conn = DriverManager.getConnection(connUrl,"root","");
		String sqlStr = "insert into order(userName,goodsName,price,goodsImg,paySum) values(?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ps.setString(1,USER_shoppingCart.getUserName());
		ps.setString(2,USER_shoppingCart.getGoodsName());
		ps.setDouble(3,USER_shoppingCart.getPrice());
		ps.setString(4,USER_shoppingCart.getGoodsImg());
		ps.setInt(5,USER_shoppingCart.getPaySum());
		ps.executeUpdate();
		System.out.println("dddddddddddddddd");*/
		String userName = USER_shoppingCart.getUserName();
		 String goodsName = USER_shoppingCart.getGoodsName();
		 int paySum = USER_shoppingCart.getPaySum();		 	
		 double price = USER_shoppingCart.getPrice();
		 String goodsImg = USER_shoppingCart.getGoodsImg();
		 Class.forName(driverStr);
		 conn = DriverManager.getConnection(connUrl,"root","");
		 String sqlStr = "insert into userorder(userName,goodsName,paySum,goodsImg,price) values(?,?,?,?,?)"; 
		 PreparedStatement ps = conn.prepareStatement(sqlStr);
		 ps.setString(1,userName);
		 ps.setString(2,goodsName);
		 ps.setInt(3,paySum);
		 ps.setString(4,goodsImg);
		 ps.setDouble(5,price);
		 ps.executeUpdate();

	}
	public static ResultSet getUserOrderListRS(String userName) throws ClassNotFoundException, SQLException {
		Class.forName(driverStr);
		conn = DriverManager.getConnection(connUrl,"root","");
		String sqlStr = "select * from userorder where userName = ?";
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ps.setString(1,userName);
		ResultSet userOrderListRS = ps.executeQuery();
		return userOrderListRS;
	}
}

