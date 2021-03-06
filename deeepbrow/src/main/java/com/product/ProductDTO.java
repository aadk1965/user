package com.product;

public class ProductDTO {
	private int pNo;
	private String pName;
	private int pPrice;
	private String pDesc;
	private int pStock;
	private String pDate;
	private String pCategory_code;
	private String pCategory_name;
	private String mId;

	private int imageNo;
	private String image_name;
	private String[] image_names;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	
	public String getpCategory_code() {
		return pCategory_code;
	}
	public void setpCategory_code(String pCategory_code) {
		this.pCategory_code = pCategory_code;
	}
	public String getpCategory_name() {
		return pCategory_name;
	}
	public void setpCategory_name(String pCategory_name) {
		this.pCategory_name = pCategory_name;
	}
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	
	
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String[] getImage_names() {
		return image_names;
	}
	public void setImage_names(String[] image_names) {
		this.image_names = image_names;
	}
	
}
