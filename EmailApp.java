import java.util.Scanner;
class Email{
    private String firstName;
    private String lastName;
    private String password;
    private String department;
    private String email;
    private String alternateMail;
    private String companySuffix = "aeycompany.com";
    
    // constructor to receive the first and last name;
    public Email(String firstName, String lastName){
        this.firstName = firstName;
        this.lastName = lastName;
        System.out.println("EMAIL CREATED: "+this.firstName+" "+this.lastName);
        
        this.department = getDept();
        System.out.println("Department is "+this.department);
        
        email = this.firstName.toUpperCase()+"."+this.lastName.toUpperCase()+"@"+this.department+"."+companySuffix;
        System.out.println("Your Email is: "+email);
    }
    // Ask for the Department;
    private String getDept(){
        System.out.println("DEPARTMENT CODES\n1 for Sales\n2 for Development\n3 for Marketting\n0 for None\n Enter the Code:");
         Scanner sc = new Scanner(System.in);
        int deptChoise = sc.nextInt();
        if(deptChoise == 1){
            return "Sales";
        }else if(deptChoise == 2){
            return "Devp";
        }else if(deptChoise == 3){
            return "Non-Tech";
        }else{
            return "Null";
        }
    }
    // create alternate Email;
    public void setAltternateEmail(String altMail){
        this.alternateMail = altMail;
    }
    public String getAltternateEmail(){
        return alternateMail; 
    }
    // complete imformation:
    public String disp(){
        return "Display Name: "+firstName+" "+lastName+"\n"+ 
                "Display Mail: "+email+"\n"+
                "Display alternate Mail: "+alternateMail+"\n"+
                 "Password is: "+password; 
    }
    // create password;
    public void setPass(String pass){
        this.password = pass;
    }
    public String getPass(){
        return password;
    }
}
public class EmailApp{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        Email e1 = new Email("Akash", "deep");
        System.out.println("Create your Password: ");
        String pass = sc.nextLine();
        e1.setPass(pass);
        System.out.println("your Password is: "+e1.getPass());
        e1.setAltternateEmail("aey.@gmail.com");
        System.out.println("your alternate Mail is: "+e1.getAltternateEmail());
        System.out.println("Your complete information:\n"+e1.disp());
    }
}