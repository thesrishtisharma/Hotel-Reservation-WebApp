package sharma.srishti.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sharma.srishti.dao.hotel_mgt;
import sharma.srishti.model.hotel_information;

import java.sql.*;

public class checkStatus {

    //JDBC driver name and database URL
    static final String JDBC_Driver = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/hotel-reservation";

    //Database Credentials
    static final String user = "root";
    static final String password = "";

    public String checkStatus(String hotel){

        Connection conn = null;
        Statement stmt = null;
        String sql = "";

        String checkStat = "B";

        int hotelID = Integer.parseInt(hotel);
        System.out.println("Hotel ID : " + hotelID);
        int status;
        //ApplicationContext context = new ClassPathXmlApplicationContext("springmvc-config.xml");

        //validateDao dao=context.getBean("validatedao",validateDao.class);
        //hotel_mgt dao = context.getBean("hotel_mgt", hotel_mgt.class);
        //hotel_information val = dao.getRoom(hotelID);

        //String query=getSession().createSQLQuery("SELECT * FROM data WHERE value IN (:values)");

        try{
            //Register JDBC User
            Class.forName(JDBC_Driver);

            //Open A Connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,user,password);

            //Execute a Query
            System.out.println("Creating Statement...");
            stmt = conn.createStatement();

            //SELECT * FROM `pan_numbers` WHERE PanNumber = "AXSSP1122H";
            sql = "SELECT * from hotel WHERE hotel_id = " + hotelID + ";";
            System.out.println(sql);

            ResultSet rs = stmt.executeQuery(sql);


            //Extracting data from result set
            if(rs.next()){
                status = rs.getInt("hotel_status");
                System.out.println(status);
                if(status == 1){
                    checkStat = "A";
                }
                else{
                    checkStat = "B";
                }
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(stmt != null)
                    stmt.close();
            } catch (SQLException se2){

            }
            try{
                if(conn != null)
                    conn.close();
            } catch (SQLException se){
                se.printStackTrace();
            }
        }
        System.out.println("Closing DB Connection - Goodbye!");


        //hotel_mgt dao=context.getBean("hotel_mgt",hotel_mgt.class);
        return checkStat;
    }

}
