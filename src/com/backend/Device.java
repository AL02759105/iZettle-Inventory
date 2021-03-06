package com.backend;
import java.sql.*;

public class Device {

	Connection conn = null;
	PreparedStatement insertDevice = null;
	PreparedStatement insertIds = null;
	PreparedStatement selectDevices = null;
	ResultSet rs = null;
	
	public Device() {
		
		//Query values are assigned to prepared statement for use in functions
		
		try {
		
			conn = DBConnect.getConnection();
			insertDevice = conn.prepareStatement("INSERT INTO device (device_type, serial_number, status, Encrypted, IMEI, location, make, "
					+ "model, model_nr, specification)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
			insertIds = conn.prepareStatement("INSERT INTO user_device (user_id, device_id) VALUES (?, ?)");
			selectDevices = conn.prepareStatement("SELECT user.first_name, user.last_name, device.device_type, device.serial_number, device.status,"
					+ " device.IMEI, device.location, device.make, device.model, device.model_nr, device.specification "
					+ "FROM user "
					+ "INNER JOIN user_device ON user.user_id = user_device.user_id "
					+ "INNER JOIN device ON user_device.device_id = device.device_id "
					+ "WHERE user.user_id = ?");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// Inserts device info into DB and gets back Autogenerated ID
	public int setDevice (String type, String serial, String status, boolean encrypted, String IMEI, String location, String make, 
			String model, String modelnr, String specification) {
		int number = 0;
		int result = 0;
		
		try {
			insertDevice.setString(1, type);
			insertDevice.setString(2, serial);
			insertDevice.setString(3, status);
			insertDevice.setBoolean(4, encrypted);
			insertDevice.setString(5, IMEI);
			insertDevice.setString(6, location);
			insertDevice.setString(7, make);
			insertDevice.setString(8, model);
			insertDevice.setString(9, modelnr);
			insertDevice.setString(10, specification);
			number = insertDevice.executeUpdate();
			
			 rs = insertDevice.getGeneratedKeys();
		        if (rs.next()){
		            result=rs.getInt(1);
		        }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result; 
		
	}
	
	//Sets IDs for user_device table so a user id is related to the recently inserted device id (gotten from setDevice)
	public int setIds (int user, int device) {
		int result = 0;
		
		try {

			insertIds.setInt(1, user);
			insertIds.setInt(2, device);
			result = insertIds.executeUpdate();
			
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result; 
		
	}
	
	//Selects information from DB and returns all the devices related to a selected user
	public ResultSet getDevices (int userID) {
		
		try {

			selectDevices.setInt(1, userID);
			rs = selectDevices.executeQuery();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}