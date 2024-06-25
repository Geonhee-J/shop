package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import jakarta.servlet.http.HttpServletResponse;

public class ProductDAO {
    public static int updateProductAmount(int productNo, int productAmount) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String updateProductAmountSQL = "UPDATE shop_product SET product_amount = (product_amount - ?), update_date = SYSDATE WHERE product_no = ?";

        PreparedStatement updateProductAmountStmt = jdbcConn.prepareStatement(updateProductAmountSQL);
        updateProductAmountStmt.setInt(1, productAmount);
        updateProductAmountStmt.setInt(2, productNo);
        result = updateProductAmountStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int deleteProduct(int productNo) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String deleteProductSQL = "DELETE FROM shop_product WHERE product_no = ?";

        PreparedStatement deleteProductStmt = jdbcConn.prepareStatement(deleteProductSQL);
        deleteProductStmt.setInt(1, productNo);
        result = deleteProductStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int updateProduct(String productTitle, String productImg, int productPrice, int productAmount, String productContent, int productNo) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String updateProductSQL = "UPDATE shop_product" + " SET" + " product_title = ?," + " product_image = ?," + " product_price = ?," + " product_amount = ?," + " product_content = ?,"
                + " update_date = SYSDATE" + " WHERE product_no = ?";

        PreparedStatement updateProductStmt = jdbcConn.prepareStatement(updateProductSQL);
        updateProductStmt.setString(1, productTitle);
        updateProductStmt.setString(2, productImg);
        updateProductStmt.setInt(3, productPrice);
        updateProductStmt.setInt(4, productAmount);
        updateProductStmt.setString(5, productContent);
        updateProductStmt.setInt(6, productNo);
        result = updateProductStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int insertProduct(String category, String empId, String productTitle, String productImg, String productContent, String productAmount, String productPrice,
            HttpServletResponse response) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String addProductSQL =
                "INSERT INTO shop_product(product_no, category, emp_id, product_title, product_image, product_content, product_price, product_amount, update_date, create_date) VALUES(s_product_no.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";

        PreparedStatement addProductStmt = jdbcConn.prepareStatement(addProductSQL);
        addProductStmt.setString(1, category);
        addProductStmt.setString(2, empId);
        addProductStmt.setString(3, productTitle);
        addProductStmt.setString(4, productImg);
        addProductStmt.setString(5, productContent);
        addProductStmt.setString(6, productPrice);
        addProductStmt.setString(7, productAmount);
        result = addProductStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Object>> productOne(int productNo) throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String productOneSQL = null;

        productOneSQL = "SELECT" + " product_no productNo," + " emp_id empId," + " category," + " product_title productTitle," + " product_image productImg," + " product_price productPrice,"
                + " product_amount productAmount," + " product_content productContent," + " TO_CHAR(update_date, 'YY/MM/DD HH:MI') updateDate," + " TO_CHAR(create_date, 'YY/MM/DD HH:MI') createDate"
                + " FROM shop_product WHERE product_no = ?";

        PreparedStatement productOneStmt = jdbcConn.prepareStatement(productOneSQL);
        productOneStmt.setInt(1, productNo);
        ResultSet productOneRs = productOneStmt.executeQuery();

        if (productOneRs.next()) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("productNo", productOneRs.getInt("productNo"));
            map.put("empId", productOneRs.getString("empId"));
            map.put("category", productOneRs.getString("category"));
            map.put("productTitle", productOneRs.getString("productTitle"));
            map.put("productImg", productOneRs.getString("productImg"));
            map.put("productPrice", productOneRs.getInt("productPrice"));
            map.put("productAmount", productOneRs.getInt("productAmount"));
            map.put("productContent", productOneRs.getString("productContent"));
            map.put("updateDate", productOneRs.getString("updateDate"));
            map.put("createDate", productOneRs.getString("createDate"));
            resultMap.add(map);
        }

        jdbcConn.close();

        return resultMap;
    }

    public static ArrayList<HashMap<String, Object>> selectProduct(String category, String orderBy, String searchWord, int startRow, int rowPerPage) throws Exception {
        ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String productListSQL = null;
        PreparedStatement productListStmt = null;

        if (category != null && !category.equals("")) {
            // System.out.println("1 : " + orderBy);
            productListSQL = "SELECT" + " product_no productNo," + " category," + " product_title productTitle," + " product_image productImg," + " product_price productPrice,"
                    + " product_amount productAmount" + " FROM shop_product WHERE category = ?" + " AND product_title LIKE ?" + " ORDER BY " + orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            productListStmt = jdbcConn.prepareStatement(productListSQL);
            productListStmt.setString(1, category);
            productListStmt.setString(2, "%" + searchWord + "%");
            productListStmt.setInt(3, startRow);
            productListStmt.setInt(4, rowPerPage);
        } else {
            // System.out.println("2 : " + orderBy);
            productListSQL = "SELECT" + " product_no productNo," + " category," + " product_title productTitle," + " product_image productImg," + " product_price productPrice,"
                    + " product_amount productAmount" + " FROM shop_product" + " WHERE product_title LIKE ?" + " ORDER BY " + orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            productListStmt = jdbcConn.prepareStatement(productListSQL);
            productListStmt.setString(1, "%" + searchWord + "%");
            productListStmt.setInt(2, startRow);
            productListStmt.setInt(3, rowPerPage);
        }

        ResultSet productListRs = productListStmt.executeQuery();

        while (productListRs.next()) {
            HashMap<String, Object> productMap = new HashMap<String, Object>();
            productMap.put("productNo", productListRs.getInt("productNo"));
            productMap.put("category", productListRs.getString("category"));
            productMap.put("productTitle", productListRs.getString("productTitle"));
            productMap.put("productImg", productListRs.getString("productImg"));
            productMap.put("productPrice", productListRs.getInt("productPrice"));
            productMap.put("productAmount", productListRs.getInt("productAmount"));
            productList.add(productMap);
        }

        jdbcConn.close();

        return productList;
    }

    public static int selectCategoryCnt() throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String categoryCntSQL = "SELECT COUNT(*) cnt FROM shop_product";

        PreparedStatement categoryCntStmt = jdbcConn.prepareStatement(categoryCntSQL);
        ResultSet categoryCntRs = categoryCntStmt.executeQuery();
        while (categoryCntRs.next()) {
            result = result + categoryCntRs.getInt("cnt");
        }

        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Object>> selectCategoryList() throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String categoryListSQL = "SELECT category, COUNT(*) cnt FROM shop_product GROUP BY category ORDER BY category ASC";

        PreparedStatement categoryListStmt = jdbcConn.prepareStatement(categoryListSQL);
        ResultSet categoryListRs = categoryListStmt.executeQuery();

        while (categoryListRs.next()) {
            HashMap<String, Object> categoryMap = new HashMap<String, Object>();
            categoryMap.put("category", categoryListRs.getString("category"));
            categoryMap.put("cnt", categoryListRs.getString("cnt"));
            resultMap.add(categoryMap);
        }

        jdbcConn.close();

        return resultMap;
    }
}
