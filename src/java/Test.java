public class Test {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("MYSQL DRIVER LOADED");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
