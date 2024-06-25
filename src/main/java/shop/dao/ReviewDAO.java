package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReviewDAO {
    public static int insertReview(String orderNo, String productNo, String customerId, String rating, String reviewContent) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();
        String insertReviewSQL =
                "INSERT INTO shop_review VALUES(comment_no = s_comment_no.nextval, orders_no = ?, product_no = ?, mail = ?, rating = ?, review = ?, update_date = SYSDATE, create_date = SYSDATE)";
        PreparedStatement insertReviewStmt = jdbcConn.prepareStatement(insertReviewSQL);
        insertReviewStmt.setString(1, orderNo);
        insertReviewStmt.setString(2, productNo);
        insertReviewStmt.setString(3, customerId);
        insertReviewStmt.setString(4, rating);
        insertReviewStmt.setString(5, reviewContent);
        result = insertReviewStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }
}
