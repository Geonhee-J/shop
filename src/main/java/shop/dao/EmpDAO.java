package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class EmpDAO {
    public static int deleteEmp(String empId) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String deleteEmpSQL = "DELETE FROM shop_emp WHERE emp_id = ?";

        PreparedStatement deleteEmpStmt = jdbcConn.prepareStatement(deleteEmpSQL);
        deleteEmpStmt.setString(1, empId);
        result = deleteEmpStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int updateEmp(String empImg, String empName, String empJob, String empGrade, String empActive, String empId) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String updateEmpSQL = "UPDATE shop_emp" + " SET" + " emp_img = ?," + " emp_name = ?," + " emp_job = ?," + " emp_grade = ?," + " emp_active = ?," + " update_date = now()" + " WHERE emp_id = ?";

        PreparedStatement updateEmpStmt = jdbcConn.prepareStatement(updateEmpSQL);
        updateEmpStmt.setString(1, empImg);
        updateEmpStmt.setString(2, empName);
        updateEmpStmt.setString(3, empJob);
        updateEmpStmt.setString(4, empGrade);
        updateEmpStmt.setString(5, empActive);
        updateEmpStmt.setString(6, empId);
        result = updateEmpStmt.executeUpdate();

        jdbcConn.close();

        return result;
    }

    public static int insertEmp(String empId, String empPw, String empName, String empJob, String empImg, String hireDate, String empGrade, String empActive) throws Exception {
        int result = 0;

        Connection jdbcConn = DBHelper.getConnection();

        String addEmpSQL = "INSERT INTO shop_emp(emp_id, emp_pw, emp_name, emp_job, emp_img, hire_date, emp_grade, emp_active, update_date, create_date) VALUES(?, ?, ?, ?, ?, ?, ?, ?, now(), now())";

        PreparedStatement addEmpStmt = jdbcConn.prepareStatement(addEmpSQL);
        addEmpStmt.setString(1, empId);
        addEmpStmt.setString(2, empPw);
        addEmpStmt.setString(3, empName);
        addEmpStmt.setString(4, empJob);
        addEmpStmt.setString(5, empImg);
        addEmpStmt.setString(6, hireDate);
        addEmpStmt.setString(7, empGrade);
        addEmpStmt.setString(8, empActive);
        result = addEmpStmt.executeUpdate();
        jdbcConn.close();

        return result;
    }

    public static ArrayList<HashMap<String, Object>> activeList() throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String empActiveListSQL = "SELECT emp_active empActive FROM shop_emp GROUP BY emp_active ORDER BY emp_active ASC";

        PreparedStatement empActiveListStmt = jdbcConn.prepareStatement(empActiveListSQL);
        ResultSet empAcitveListRs = empActiveListStmt.executeQuery();

        while (empAcitveListRs.next()) {
            HashMap<String, Object> activetMap = new HashMap<String, Object>();
            activetMap.put("empActive", empAcitveListRs.getString("empActive"));
            resultMap.add(activetMap);
        }

        jdbcConn.close();

        return resultMap;
    }

    public static ArrayList<HashMap<String, Object>> empOne(String empId) throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String empOneSQL = null;

        empOneSQL =
                "SELECT emp_id empId, emp_name empName, emp_job empJob, emp_img empImg, hire_date hireDate, update_date updateDate, create_date createDate, emp_grade empGrade, emp_active empActive FROM shop_emp WHERE emp_id = ?";

        PreparedStatement empOneStmt = jdbcConn.prepareStatement(empOneSQL);
        empOneStmt.setString(1, empId);
        ResultSet empOneRs = empOneStmt.executeQuery();

        while (empOneRs.next()) {
            HashMap<String, Object> empMap = new HashMap<String, Object>();
            empMap.put("empId", empOneRs.getString("empId"));
            empMap.put("empName", empOneRs.getString("empName"));
            empMap.put("empJob", empOneRs.getString("empJob"));
            empMap.put("empImg", empOneRs.getString("empImg"));
            empMap.put("hireDate", empOneRs.getString("hireDate"));
            empMap.put("updateDate", empOneRs.getString("updateDate"));
            empMap.put("createDate", empOneRs.getString("createDate"));
            empMap.put("empGrade", empOneRs.getString("empGrade"));
            empMap.put("empActive", empOneRs.getString("empActive"));
            resultMap.add(empMap);
        }

        jdbcConn.close();

        return resultMap;
    }

    public static ArrayList<HashMap<String, Object>> empList(String empActive, String searchWord) throws Exception {
        ArrayList<HashMap<String, Object>> resultMap = new ArrayList<HashMap<String, Object>>();

        Connection jdbcConn = DBHelper.getConnection();

        String empListSQL = null;

        if (empActive != null && !empActive.equals("")) {
            empListSQL = "SELECT emp_id empId, emp_name empName, emp_job empJob, emp_img empImg, emp_active empActive FROM emp WHERE emp_active =" + "'" + empActive + "'"
                    + "AND (emp_id LIKE ? OR emp_name LIKE ?) ORDER BY emp_job DESC";
        } else {
            empListSQL = "SELECT emp_id empId, emp_name empName, emp_job empJob, emp_img empImg, emp_active empActive FROM shop_emp WHERE (emp_id LIKE ? OR emp_name LIKE ?) ORDER BY emp_job DESC";
        }

        PreparedStatement empListStmt = jdbcConn.prepareStatement(empListSQL);
        empListStmt.setString(1, "%" + searchWord + "%");
        empListStmt.setString(2, "%" + searchWord + "%");
        ResultSet empListRs = empListStmt.executeQuery();

        while (empListRs.next()) {
            HashMap<String, Object> empMap = new HashMap<String, Object>();
            empMap.put("empId", empListRs.getString("empId"));
            empMap.put("empName", empListRs.getString("empName"));
            empMap.put("empJob", empListRs.getString("empJob"));
            empMap.put("empImg", empListRs.getString("empImg"));
            empMap.put("empActive", empListRs.getString("empActive"));
            resultMap.add(empMap);
        }

        jdbcConn.close();

        return resultMap;
    }

    public static HashMap<String, Object> empLogin(String empId, String empPw) throws Exception {
        HashMap<String, Object> resultMap = null;

        Connection jdbcConn = DBHelper.getConnection();

        String empCheckSQL = "SELECT emp_id empId, emp_name empName, emp_grade empGrade, emp_active empActive FROM shop_emp WHERE emp_id = ? AND emp_pw = ?";

        PreparedStatement loginCheckStmt = jdbcConn.prepareStatement(empCheckSQL);
        loginCheckStmt.setString(1, empId);
        loginCheckStmt.setString(2, empPw);
        ResultSet loginCheckRs = loginCheckStmt.executeQuery();

        if (loginCheckRs.next()) {
            resultMap = new HashMap<String, Object>();
            resultMap.put("empId", loginCheckRs.getString("empId"));
            resultMap.put("empName", loginCheckRs.getString("empName"));
            resultMap.put("empGrade", loginCheckRs.getInt("empGrade"));
            resultMap.put("empActive", loginCheckRs.getString("empActive"));
        }

        jdbcConn.close();

        return resultMap;
    }
}
