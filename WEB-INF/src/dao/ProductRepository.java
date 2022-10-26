package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
    private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();
    
    public static ProductRepository getInstance(){
	return instance;
   }

    
    public ProductRepository() {
        Product tonerpad = new Product("tonerpad", "수딩 캄 토너패드", 22400);
        tonerpad.setDescription("피부 진정과 모공관리를 한번에 하고싶어요!");
        tonerpad.setCategory("TonerPad");
        tonerpad.setManufacturer("neafneaf");
        tonerpad.setUnitsInStock(1000);
        tonerpad.setCondition("New");
        tonerpad.setFilename("tonerpad.jpg");
        
        Product sudingmask = new Product("sudingmask", "수딩 캄 마스크", 2700);
		sudingmask.setDescription("수딩에센스를 가득 머금은 대나무 시트로 피부를 진정시켜주는 시트 마스크");
		sudingmask.setCategory("sudingmask");
		sudingmask.setManufacturer("neafneaf");
		sudingmask.setUnitsInStock(1000);
		sudingmask.setCondition("Refurbished");
        sudingmask.setFilename("sudingmask.jpg");

		Product coolmask = new Product("coolmask", "쿨 모이스트 마스크", 2700);
		coolmask.setDescription("쿨링에센스를 가득 머금은 대나무 시트로 수분을 채워주는 시트 마스크");
		coolmask.setCategory("coolmask");
		coolmask.setManufacturer("neafneaf");
		coolmask.setUnitsInStock(1000);
		coolmask.setCondition("Old");
        coolmask.setFilename("coolmask.jpg");
        
        Product skirt = new Product("skirt", "스커트", 45900);
        skirt.setDescription("스테인 플리트 샤 스커트");
        skirt.setCategory("skirt");
        skirt.setManufacturer("mejiwoo");
        skirt.setUnitsInStock(1000);
        skirt.setCondition("New");
        skirt.setFilename("skirt.jpg");
        
        Product outer = new Product("outer", "아우터", 26100);
        outer.setDescription("아리아 스트랩 볼레로 가디건");
        outer.setCategory("top");
        outer.setManufacturer("mejiwoo");
        outer.setUnitsInStock(1000);
        outer.setCondition("Refurbished");
        outer.setFilename("outer.jpg");
        
        Product dress = new Product("dress", "원피스", 54900);
        dress.setDescription("랩 플리츠 브이 원피스");
        dress.setCategory("dress");
        dress.setManufacturer("mejiwoo");
        dress.setUnitsInStock(1000);
        dress.setCondition("Old");
        dress.setFilename("dress.jpg");
        
        Product top = new Product("top", "탑", 54900);
        top.setDescription("마리떼 스트라이프 슬릿 티");
        top.setCategory("top");
        top.setManufacturer("mejiwoo");
        top.setUnitsInStock(1000);
        top.setCondition("New");
        top.setFilename("top.jpg");
        
        Product pants = new Product("pants", "팬츠", 54900);
        pants.setDescription("도우 코듀로이 롱 팬츠");
        pants.setCategory("pants");
        pants.setManufacturer("mejiwoo");
        pants.setUnitsInStock(1000);
        pants.setCondition("Refurbished");
        pants.setFilename("pants.jpg");
        
        Product cardigun = new Product("cardigun", "가디건", 54900);
        cardigun.setDescription("메틸슈가 가디건");
        cardigun.setCategory("cardigun");
        cardigun.setManufacturer("mejiwoo");
        cardigun.setUnitsInStock(1000);
        cardigun.setCondition("Old");
        cardigun.setFilename("cardigun.jpg");
        
        
		

		listOfProducts.add(tonerpad);
		listOfProducts.add(sudingmask);
		listOfProducts.add(coolmask);
        listOfProducts.add(skirt);
        listOfProducts.add(outer);
        listOfProducts.add(dress);
        listOfProducts.add(top);
        listOfProducts.add(pants);
        listOfProducts.add(cardigun);
    }
    
    public ArrayList<Product> getAllProducts() {
        return listOfProducts;
    }
    
    public Product getProductById(String productId) {
        Product productById = null;
        
        for (int i = 0; i < listOfProducts.size(); i++) {
            Product product = listOfProducts.get(i);
            if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
                productById = product ;
                break;
            }
        }
        return productById;
    }
    
    public void addProduct(Product product) {
            listOfProducts.add(product);
        }
}
