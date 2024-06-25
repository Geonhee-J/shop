package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class OrderDAO {
    public static int selectOrderState(String mail) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String selectOrderStateSQL = "SELECT product_no productNo, state FROM shop_order WHERE mail = ?";

        PreparedStatement selectOrderStateStmt = jdbcConn.prepareStatement(selectOrderStateSQL);
        selectOrderStateStmt.setString(1, mail);
        result = selectOrderStateStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int cancelOrder(String mail, int orderNo, int productNo) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String cancelOrderSQL = "UPDATE shop_orders SET state = '구매취소' WHERE mail = ? AND orders_no = ? AND product_no = ?";

        PreparedStatement cancelOrderStmt = jdbcConn.prepareStatement(cancelOrderSQL);
        cancelOrderStmt.setString(1, mail);
        cancelOrderStmt.setInt(2, orderNo);
        cancelOrderStmt.setInt(3, productNo);
        result = cancelOrderStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int updateOrder(int orderNo) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String updateOrderSQL = "UPDATE shop_orders SET state = '구매완료' WHERE orders_no = ?";

        PreparedStatement updateOrderStmt = jdbcConn.prepareStatement(updateOrderSQL);
        updateOrderStmt.setInt(1, orderNo);
        result = updateOrderStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static void insertOrder(String mail, int productNo, int totalAmount, int totalPrice, String state) throws Exception {
        Connection jdbcConn = DBHelper.getConnection();

        String insertOrderSQL = "INSERT INTO shop_orders(" + "orders_no" + ", mail" + ", product_no" + ", total_amount" + ", total_price" + ", state" + ", update_date" + ", create_date)"
                + " VALUES(s_orders_no.nextval, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";

        PreparedStatement insertOrderStmt = jdbcConn.prepareStatement(insertOrderSQL);
        insertOrderStmt.setString(1, mail);
        insertOrderStmt.setInt(2, productNo);
        insertOrderStmt.setInt(3, totalAmount);
        insertOrderStmt.setInt(4, totalPrice);
        insertOrderStmt.setString(5, state);
        int insertOrderRs = insertOrderStmt.executeUpdate();

        jdbcConn.close();
    }

    public static ArrayList<HashMap<String, Object>> selectOrderCheck(String customerId, int productNo) throws Exception {
        ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String selectOrderNoSQL = "SELECT orders_no orderNo, mail, product_no productNo, state FROM shop_orders WHERE mail = ? AND product_no = ?";

        PreparedStatement selectOrderNoStmt = jdbcConn.prepareStatement(selectOrderNoSQL);
        selectOrderNoStmt.setString(1, customerId);
        selectOrderNoStmt.setInt(2, productNo);
        ResultSet selectOrderNoRs = selectOrderNoStmt.executeQuery();

        while (selectOrderNoRs.next()) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("orderNo", selectOrderNoRs.getInt("orderNo"));
            map.put("mail", selectOrderNoRs.getString("mail"));
            map.put("productNo", selectOrderNoRs.getInt("productNo"));
            map.put("state", selectOrderNoRs.getString("state"));
            result.add(map);
        }

        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Object>> selectOrderList(String mail) throws Exception {
        ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();
        String selectOrderListSQL = "SELECT" + " orders_no orderNo" + ", product_no productNo" + ", total_amount totalAmount" + ", total_price totalPrice" + ", state" + ", update_date updateDate"
                + ", create_date createDate" + " FROM shop_orders";
        PreparedStatement selectOrderListStmt = null;

        if (mail != null && !mail.equals("")) {
            selectOrderListSQL = selectOrderListSQL + " WHERE mail = ?";
            selectOrderListStmt = jdbcConn.prepareStatement(selectOrderListSQL);
            selectOrderListStmt.setString(1, mail);
        } else {
            // System.out.println("selectOrderListSQL : " + selectOrderListSQL);
            selectOrderListSQL = selectOrderListSQL + " ORDER BY state DESC";
            selectOrderListStmt = jdbcConn.prepareStatement(selectOrderListSQL);
        }

        ResultSet selectOrderListRs = selectOrderListStmt.executeQuery();

        while (selectOrderListRs.next()) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("orderNo", selectOrderListRs.getInt("orderNo"));
            map.put("productNo", selectOrderListRs.getInt("productNo"));
            map.put("totalAmount", selectOrderListRs.getInt("totalAmount"));
            map.put("totalPrice", selectOrderListRs.getInt("totalPrice"));
            map.put("state", selectOrderListRs.getString("state"));
            map.put("updateDate", selectOrderListRs.getString("updateDate"));
            map.put("createDate", selectOrderListRs.getString("createDate"));
            result.add(map);
        }

        jdbcConn.close();

        return result;
    }
}
