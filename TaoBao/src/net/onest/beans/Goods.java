package net.onest.beans;

public class Goods {
	private String goodsImg;
	private String goodsName;
	private double price;
	private String goodsShop;
	private String goodsSum;
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public String getGoodsSum() {
		return goodsSum;
	}
	public void setGoodsSum(String goodsSum) {
		this.goodsSum = goodsSum;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getGoodsShop() {
		return goodsShop;
	}
	public void setGoodsShop(String goodsShop) {
		this.goodsShop = goodsShop;
	}
}
