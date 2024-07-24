package products;


public class productcart {
	private String product_name;
	private int price;
	private int quantity;
	private int id;
	private String img;
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public productcart(String product_name, int price,int quantity,int id,String img) {
		super();
		this.product_name = product_name;
		this.price = price;
		this.quantity=quantity;
		this.id=id;
		this.img=img;
		
		
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "productcart [product_name=" + product_name + ", price=" + price + ", quantity=" + quantity + ", id="
				+ id + ", img=" + img + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public int getPrice() {
		return price;
	}
	
}
