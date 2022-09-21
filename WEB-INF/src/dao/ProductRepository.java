package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
    private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    
    public ProductRepository() {
        Product phone = new Product("P1234", "니프니프 수딩 캄 토너패드", 22400);
        phone.setDescription("피부 진정과 모공관리를 한번에 하고싶어요!");
        phone.setCategory("TonerPad");
        phone.setManufacturer("neafneaf");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        
        Product notebook = new Product("P1235", "니프니프 시리즈 넘버2 수딩 캄 마스크", 2700);
		notebook.setDescription("수딩에센스를 가득 머금은 대나무 시트로 피부를 진정시켜주는 시트 마스크");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");

		Product tablet = new Product("P1236", "니프니프 시리즈 넘버1 쿨 모이스트 마스크", 2700);
		tablet.setDescription("쿨링에센스를 가득 머금은 대나무 시트로 수분을 채워주는 시트 마스크");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
    }
    
    public ArrayList<Product> getAllProducts() {
        return listOfProducts;
    }
}
