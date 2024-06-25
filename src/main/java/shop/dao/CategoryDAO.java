package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class CategoryDAO {
    public static int deleteCategory(String category) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String deleteCategorySQL = "DELETE FROM shop_category WHERE category = ?";

        PreparedStatement deleteCategoryStmt = jdbcConn.prepareStatement(deleteCategorySQL);
        deleteCategoryStmt.setString(1, category);
        result = deleteCategoryStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int insertCategory(String empId, String category, String categoryImg) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String addCategorySQL = "INSERT INTO shop_category(emp_id, category, category_image) VALUES (?, ?, ?)";

        PreparedStatement addCategoryStmt = jdbcConn.prepareStatement(addCategorySQL);
        addCategoryStmt.setString(1, empId);
        addCategoryStmt.setString(2, category);
        addCategoryStmt.setString(3, categoryImg);
        result = addCategoryStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Object>> selectCategory(String selectCategory, String searchWord) throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String categorySQL = null;
        PreparedStatement categoryStmt = null;

        if (selectCategory != null && !selectCategory.equals("")) {
            categorySQL = "SELECT category, category_image categoryImg, TO_CHAR(create_date, 'DD') createDate FROM shop_category WHERE category = ? AND category LIKE ? ORDER BY create_date ASC";
            categoryStmt = jdbcConn.prepareStatement(categorySQL);
            categoryStmt.setString(1, selectCategory);
            categoryStmt.setString(2, "%" + searchWord + "%");
        } else {
            categorySQL = "SELECT category, category_image categoryImg, TO_CHAR(create_date, 'DD') createDate FROM shop_category WHERE category LIKE ? ORDER BY create_date ASC";
            categoryStmt = jdbcConn.prepareStatement(categorySQL);
            categoryStmt.setString(1, "%" + searchWord + "%");
        }

        ResultSet categoryRs = categoryStmt.executeQuery();

        while (categoryRs.next()) {
            HashMap<String, Object> categoryMap = new HashMap<String, Object>();
            categoryMap.put("category", categoryRs.getString("category"));
            categoryMap.put("categoryImg", categoryRs.getString("categoryImg"));
            categoryMap.put("createDate", categoryRs.getString("createDate"));
            resultMap.add(categoryMap);
        }

        jdbcConn.close();

        return resultMap;
    }

    public static ArrayList<HashMap<String, Object>> selectCategoryList() throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String categoryListSQL = "SELECT category, COUNT(*) cnt FROM shop_product GROUP BY category ORDER BY category ASC";

        PreparedStatement categoryListStmt = jdbcConn.prepareStatement(categoryListSQL);
        ResultSet categoryListRs = categoryListStmt.executeQuery();

        while (categoryListRs.next()) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("category", categoryListRs.getString("category"));
            map.put("cnt", categoryListRs.getString("cnt"));
            resultMap.add(map);
        }

        jdbcConn.close();

        return resultMap;
    }
}
