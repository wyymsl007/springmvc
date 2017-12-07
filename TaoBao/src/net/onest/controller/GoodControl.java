package net.onest.controller;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.onest.dao.DatabaseConn;
import net.onest.beans.Goods;
import net.onest.beans.USER_ShoppingCart;
import net.onest.beans.User;
import net.onest.beans.UserOrder;
public class GoodControl {
	private List<User> userList = null; 
	private List<Goods> goodsList = null;
	public List<User> getUserList() throws ClassNotFoundException, SQLException{
		ResultSet userListRS = DatabaseConn.getUserListRS();
		userList = new ArrayList<>();
		while(userListRS.next()) {
			String userName = userListRS.getString("userName");
			String passWord = userListRS.getString("passWord");
			User user = new User();
			user.setUserName(userName);
			user.setPassWord(passWord);
			userList.add(user);
		}
		return userList;
	}
	public boolean isUserNameIn(String userName) throws ClassNotFoundException, SQLException {
		List<User> userList = this.getUserList();
		for(int i = 0; i < userList.size(); i++) {
			if(userList.get(i).getUserName().equals(userName)) {
				return true;
			}
		}
		return false;
	}
	public List<Goods> getGoodsList() throws ClassNotFoundException, SQLException{
		ResultSet goodsListRS = DatabaseConn.getGoodsListRS();
		goodsList = new ArrayList<>(20);
		while(goodsListRS.next()) {
			String goodsImg = goodsListRS.getString("goodsImg");
			String goodsName = goodsListRS.getString("goodsName");
			double price = goodsListRS.getDouble("price");
			String goodsShop = goodsListRS.getString("goodsShop");
			String goodsSum = goodsListRS.getString("goodsSum");
			Goods goods = new Goods();
			goods.setGoodsImg(goodsImg);	
			goods.setGoodsName(goodsName);
			goods.setGoodsShop(goodsShop);
			goods.setGoodsSum(goodsSum);
			goods.setPrice(price);
			goodsList.add(goods);
		}
		return goodsList;
	}
	public int getPageCount(int rowsPerPage) throws ClassNotFoundException, SQLException {
		int pageCount = 0;
		ResultSet allRowsCountRS = DatabaseConn.getAllRowsCountRS();
		while(allRowsCountRS.next()) {
			pageCount = (int)Math.ceil(((double)allRowsCountRS.getInt("allRowsCount")/(double)rowsPerPage));
		}
		return pageCount;
	}
	public ArrayList<USER_ShoppingCart> getUserSCList(String userName) throws ClassNotFoundException, SQLException{
		ResultSet userSCListRS = DatabaseConn.getUserSCListRS(userName);
		ArrayList<USER_ShoppingCart> userSCList = new ArrayList<>(); 
		while(userSCListRS.next()) {
			String userName1 = userSCListRS.getString("userName");
			String goodsName = userSCListRS.getString("goodsName");
			int paySum = userSCListRS.getInt("paySum");
			boolean isPay = userSCListRS.getBoolean("isPay");
			double price = userSCListRS.getDouble("price");
			String goodsImg = userSCListRS.getString("goodsImg");
		    USER_ShoppingCart USER_shoppingCart = new USER_ShoppingCart();
			USER_shoppingCart.setGoodsName(goodsName);
			USER_shoppingCart.setUserName(userName1);
			USER_shoppingCart.setPay(isPay);
			USER_shoppingCart.setPaySum(paySum);
			USER_shoppingCart.setPrice(price);
			USER_shoppingCart.setGoodsImg(goodsImg);
			userSCList.add(USER_shoppingCart);
		}
		return userSCList;
	}
	public ArrayList<UserOrder> getUserOrderList(String userName) throws SQLException, ClassNotFoundException{
		ResultSet userOrderListRS = DatabaseConn.getUserOrderListRS(userName);
		ArrayList<UserOrder> userOrderList = new ArrayList<>();
		while(userOrderListRS.next()) {
			String userName1 = userOrderListRS.getString("userName");
			String goodsName = userOrderListRS.getString("goodsName");
			String goodsImg = userOrderListRS.getString("goodsImg");
			int paySum = userOrderListRS.getInt("paySum");
			double price = userOrderListRS.getDouble("price");
			UserOrder userOrder = new UserOrder();
			userOrder.setUserName(userName1);
			userOrder.setGoodsName(goodsName);
			userOrder.setGoodsImg(goodsImg);
			userOrder.setPrice(price);
			userOrder.setPaySum(paySum);
			userOrderList.add(userOrder);
		}
		return userOrderList;
	}
}
