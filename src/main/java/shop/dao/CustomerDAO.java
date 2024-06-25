package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class CustomerDAO {
    public static int deleteCustomer(String customerId) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String deleteCustomerSQL = "DELETE FROM shop_customer WHERE mail = ?";
        PreparedStatement deleteCustomerStmt = jdbcConn.prepareStatement(deleteCustomerSQL);
        deleteCustomerStmt.setString(1, customerId);
        result = deleteCustomerStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int updateCustomer(String customerId, String customerPw, String customerName, String customerBirth, String customerGender) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String updateCustomerSQL = "UPDATE shop_customer SET customer_no = s_customer_no.nextval, pw = ?, update_date = SYSDATE WHERE mail = ?";

        PreparedStatement updateCustomerStmt = jdbcConn.prepareStatement(updateCustomerSQL);
        updateCustomerStmt.setString(1, customerPw);
        // updateCustomerStmt.setString(2, customerName);
        // updateCustomerStmt.setString(3, customerBirth);
        // updateCustomerStmt.setString(4, customerGender);
        updateCustomerStmt.setString(2, customerId);
        result = updateCustomerStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, String>> selectCustomer(String customerId) throws Exception {
        ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();

        Connection jdbcConn = DBHelper.getConnection();

        String selectCustomerSQL = "SELECT mail, pw, name, TO_CHAR(birth, 'YYYY/MM/DD') birth, gender, update_date, create_date FROM shop_customer WHERE mail = ?";

        PreparedStatement selectCustomerStmt = jdbcConn.prepareStatement(selectCustomerSQL);
        selectCustomerStmt.setString(1, customerId);
        ResultSet selectCustomerRs = selectCustomerStmt.executeQuery();

        while (selectCustomerRs.next()) {
            HashMap<String, String> map = new HashMap<String, String>();
            map.put("mail", selectCustomerRs.getString("mail"));
            map.put("pw", selectCustomerRs.getString("pw"));
            map.put("name", selectCustomerRs.getString("name"));
            map.put("birth", selectCustomerRs.getString("birth"));
            map.put("gender", selectCustomerRs.getString("gender"));
            map.put("updateDate", selectCustomerRs.getString("update_date"));
            map.put("createDate", selectCustomerRs.getString("create_date"));
            result.add(map);
        }

        jdbcConn.close();

        return result;
    }

    public static HashMap<String, Object> customerLogin(String customerId, String customerPw) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        Connection jdbcConn = DBHelper.getConnection();

        String customerCheckSQL = "SELECT mail customerId, name customerName, birth customerBirth, gender customerGender FROM shop_customer WHERE mail = ? AND pw = ?";

        PreparedStatement loginCheckStmt = jdbcConn.prepareStatement(customerCheckSQL);
        loginCheckStmt.setString(1, customerId);
        loginCheckStmt.setString(2, customerPw);
        ResultSet loginCheckRs = loginCheckStmt.executeQuery();

        if (loginCheckRs.next()) {
            resultMap.put("customerId", loginCheckRs.getString("customerId"));
            resultMap.put("customerName", loginCheckRs.getString("customerName"));
            resultMap.put("customerBirth", loginCheckRs.getString("customerBirth"));
            resultMap.put("customerGender", loginCheckRs.getString("customerGender"));
        }

        jdbcConn.close();

        return resultMap;
    }

    public static int insertCustomer(String customerId, String customerPw, String customerName, String customerBirth, String customerGender) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String addCustomerSQL = "INSERT INTO shop_customer(mail, pw, name, birth, gender, update_date, create_date) VALUES(?, ?, ?, ?, ?, now(), now())";
        PreparedStatement addCustomerStmt = jdbcConn.prepareStatement(addCustomerSQL);
        addCustomerStmt.setString(1, customerId);
        addCustomerStmt.setString(2, customerPw);
        addCustomerStmt.setString(3, customerName);
        addCustomerStmt.setString(4, customerBirth);
        addCustomerStmt.setString(5, customerGender);
        result = addCustomerStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static boolean customerIdCheck(String customerId) throws Exception {
        boolean result = false;

        Connection jdbcConn = DBHelper.getConnection();

        String customerIdCheckSQL = "SELECT mail customerId FROM shop_customer WHERE mail = ?";

        PreparedStatement customerIdCheckStmt = jdbcConn.prepareStatement(customerIdCheckSQL);
        customerIdCheckStmt.setString(1, customerId);
        ResultSet customerIdCheckRs = customerIdCheckStmt.executeQuery();

        if (!customerIdCheckRs.next()) {
            result = true;
        }

        jdbcConn.close();

        return result;
    }
}
