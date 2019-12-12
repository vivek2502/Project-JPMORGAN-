package model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;

import oracle.jdbc.driver.OracleDriver;

public class Model {
	private String url="jdbc:oracle:thin:@//localhost:1521/XE";
	private String userid="JAVAPROJECT";
	private String password="ORACLE";
	
	private String select="SELECT * FROM ABCBANK WHERE USERID=? AND PASSWORD=?";
	private String sql="SELECT * FROM ABCBANK WHERE ACCNO=?";
	private String update="UPDATE ABCBANK SET PASSWORD=? WHERE ACCNO=? AND PASSWORD=?";
	private String deductBal="UPDATE ABCBANK SET BALANCE=BALANCE-? WHERE ACCNO=?";
	private String addBal="UPDATE ABCBANK SET BALANCE=BALANCE+? WHERE ACCNO=?";
	
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
	public boolean checkBalance() throws Exception
	{
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,accno);
		res=pstmt.executeQuery();
			if(res.next()==true)
			{
				balance=res.getInt(5);
				return true;
			}
			else 
			{
				return false;
			}
	}
	public boolean changePassword(String npwd) throws SQLException
	{
		pstmt=con.prepareStatement(update);
		pstmt.setString(1,npwd);
		pstmt.setInt(2,accno);
		pstmt.setString(3,pwd);
		int row=pstmt.executeUpdate();
		if(row!=0)
		{
			return true;
		}
		else 
			return false;
	}
	
	public boolean transfer1(int rvcno,int amount) throws SQLException
	{
		pstmt=con.prepareStatement(deductBal);
		pstmt.setInt(1,amount);
		pstmt.setInt(2,accno);
		int row=pstmt.executeUpdate();
		if(row!=0)
		{
			pstmt=con.prepareStatement("INSERT INTO STATEMENT(ACCNO,DEBIT) VALUES (?,?)");
			pstmt.setInt(1,accno);
			pstmt.setInt(2,amount);
			pstmt.executeUpdate();
			return true;	
		}
		else 
			return false;
	}
	public boolean transfer2(int rvcno,int amount)throws SQLException
	{
		pstmt=con.prepareStatement(addBal);
		pstmt.setInt(1,amount);
		pstmt.setInt(2,rvcno);
		int row=pstmt.executeUpdate();
		if(row!=0)
		{
			pstmt=con.prepareStatement("INSERT INTO STATEMENT(ACCNO,CREDIT) VALUES (?,?)");
			pstmt.setInt(1,rvcno);
			pstmt.setInt(2,amount);
			pstmt.executeUpdate();
			return true;
		}
		else 
			return false;
	}
	public ArrayList  getCredit() throws SQLException
	{
		ArrayList arraylistcredit=new ArrayList();
		pstmt=con.prepareStatement("SELECT CREDIT FROM STATEMENT WHERE ACCNO=?");
		pstmt.setInt(1,accno);
		res=pstmt.executeQuery();
		while(res.next())
		{
			arraylistcredit.add(res.getInt("CREDIT"));
		}
		return arraylistcredit;
	}
	public ArrayList  getDedit() throws SQLException
	{
		ArrayList arraylistdebit=new ArrayList();
		pstmt=con.prepareStatement("SELECT DEBIT FROM STATEMENT WHERE ACCNO=?");
		pstmt.setInt(1,accno);
		res=pstmt.executeQuery();
		while(res.next())
		{
			arraylistdebit.add(res.getInt("DEBIT"));
		}
		return arraylistdebit;
	}
	public boolean setDetails(String photo,String sign,String aadhar,String pan) throws SQLException, IOException
	{
			FileInputStream fin ;
			 
			pstmt=con.prepareStatement("INSERT INTO LOAN_DETAILS (ACCNO,PHOTO,SIGN,AADHAR,PAN) VALUES(?,?,?,?,?)");
			pstmt.setInt(1,accno);
			fin = new FileInputStream(photo);
			pstmt.setBinaryStream(2, fin,fin.available());
			fin = new FileInputStream(sign);
			pstmt.setBinaryStream(3, fin,fin.available());
			fin = new FileInputStream(aadhar);
			pstmt.setBinaryStream(4, fin,fin.available());
			fin = new FileInputStream(pan);
			pstmt.setBinaryStream(5, fin,fin.available());
			int a=pstmt.executeUpdate();
				if(a!=0)
				{	  
					return true;
				}
				else
				{					
					return false;
				}				
		}
	public boolean forgotPassword(String npwd) throws SQLException
	{
		pstmt=con.prepareStatement("UPDATE ABCBANK SET PASSWORD=? WHERE EMAIL=?");
		pstmt.setString(1,npwd);
		pstmt.setString(2,email);
		int row=pstmt.executeUpdate();
		if(row!=0)
		{
			return true;	
		}
		else 
			return false;
	}
}
