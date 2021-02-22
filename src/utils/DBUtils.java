package utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

import com.mysql.jdbc.Connection;



/*
 * 获取数据库连接
 * 释放资源
 */
public class DBUtils {

	private static final Properties properties = new Properties();

	static {
		InputStream inputStream = DBUtils.class.getResourceAsStream("DB.properties");
		
		try {
			properties.load(inputStream);

			Class.forName(properties.getProperty("driver"));

		} catch (ClassNotFoundException | IOException e) {
			
			e.printStackTrace();
		}
	}

	// 1.获取数据库连接
	public static Connection getConnection() {
		Connection connection = null;
		try {

			connection = (Connection) DriverManager.getConnection(properties.getProperty("url"),
					properties.getProperty("username"), properties.getProperty("password"));
		} catch (SQLException e) {

			e.printStackTrace();

		}
		return connection;
	}

	// 2.释放资源
	public static void close(Connection connection, PreparedStatement prepareStatement) {
		if (prepareStatement != null) {
			try {
				prepareStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 2.释放资源
	public static void closeAll(Connection connection,PreparedStatement preparedStatement,ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
