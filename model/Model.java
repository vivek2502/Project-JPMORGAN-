package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleDriver;

public class Model {
	private String url="jdbc:oracle:thin:@//localhost:1521/XE";
	private String userid="JAVAPROJECT";
	private String password="ORACLE";
	
	private String select="SELECT * FROM ABCBANK WHERE USERID=? AND PASSWORD=?";
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet res;
	
	private String name;
	private int accno;
	private String user;
	private String pwd;
	private double balance;
	private String email;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAccno() {
		return accno;
	}
	public void setAccno(int accno) {
		this.accno = accno;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Model()
	{
		try
		{
			DriverManager.registerDriver(new OracleDriver());
			con=DriverManager.getConnection(url,userid,password);
		}
		catch(SQLException e)
		{
			System.out.println("Error occur");
			e.printStackTrace();
		}
	}
	public boolean login() throws Exception
	{
		pstmt=con.prepareStatement(select);
		pstmt.setString(1,user);
		pstmt.setString(2,pwd);
		res=pstmt.executeQuery();
			if(res.next()==true)
			{
				accno=res.getInt(2);
				return true;
			}
			else 
			{
				return false;
			}
	}
}
