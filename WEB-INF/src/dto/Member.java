package dto;
import java.io.Serializable;

public class Member implements Serializable {
    private static final long serialVersionUID = -4274700572039677000L;
    
    private String id; 
    private String password; 
    private Integer name; 
    private String gender; 
    private String birth; 
    private String mail; 
    private long phone; 
    private String address; 
    
    public Member() {
        super();
    }
    
    public String getid() {
        return id;
    }
    
    public void setid(String id) {
        this.id = id;
    }
    
    public String getpassword() {
        return password;
    }
    
    public void setpassword(String password) {
        this.password = password;
	}  
    
    public Integer getname() {
        return name;
    }
    
    public void setname(Integer name) {
        this.name = name;
    }
    
    public String getgender() {
        return gender;
    }
    
    public void setgender(String gender) {
        this.gender = gender;
    }
    
    public String getbirth() {
        return birth;
    }
    
    public void setbirth(String birth) {
        this.birth = birth;
    }
    
    public String getmail() {
        return mail;
    }
    
    public void setmail(String mail) {
        this.mail = mail;
    }
    
    public long getphone() {
        return phone;
    }
    
    public void setphone(long phone) {
        this.phone = phone;
    }
    
    public String getaddress() {
        return address;
    }
    
    public void setaddress(String address) {
        this.address = address;
    }
}