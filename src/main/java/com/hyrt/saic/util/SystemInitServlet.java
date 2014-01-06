package com.hyrt.saic.util;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-6
 * Time: 上午11:42
 * To change this template use File | Settings | File Templates.
 */
@WebServlet(name = "SystemInitServlet")
public class SystemInitServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {

        try {

                Properties prop = new Properties();
                InputStream in = new FileInputStream(this.getClass().getResource("/").getPath() + "jdbc.properties");
                prop.load(in);
                Class.forName(prop.getProperty("jdbc.driver")).newInstance();
            Connection conn = DriverManager.getConnection(prop.getProperty("jdbc.url"), prop.getProperty("jdbc.username"), prop.getProperty("jdbc.password"));
                in.close();

                // Class.forName("com.mysql.jdbc.Driver").newInstance();
                //  conn = DriverManager.getConnection("jdbc:mysql://192.168.0.106:3306/wifi?useUnicode=true&characterEncoding=UTF-8","root","hyrt");

            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select id, businessName from t_business_type");
            Map businessType = new HashMap();
            Map orderType = new HashMap();

            while(rs.next()) {
                 businessType.put(rs.getInt(1),rs.getString(2));
            }
            ResultSet rs2 = statement.executeQuery("SELECT id,orderName FROM t_order_type");
            while(rs2.next()) {
                orderType.put(rs.getInt(1),rs.getString(2));
            }

            rs.close();
            rs2.close();
            statement.close();
            conn.close();

            config.getServletContext().setAttribute("businessType",businessType);
            config.getServletContext().setAttribute("orderType",orderType);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
