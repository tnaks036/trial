package Model.User;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Model.DataBase;
import Model.Image.Image;
import Model.Page.Page;
import VO.UserVO;

public class User {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String query;
	
	private String user_ID = "";
	private String user_PW = "";
	private String phone_Num = "";
	private String corp_Name = "";
	

	DataBase db = new DataBase();
	Page page = new Page();
	
	
	public String UpdateSignUp(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("뀨?");
	    Connection con = null;
	    PreparedStatement ps = null;
	    
	    try {
	        query = "INSERT INTO SC_Join (User_ID, User_PW, Phone_Num, Corp_Name) VALUES (?, ?, ?, ?)";
	        
	        user_ID = request.getParameter("user_ID");
	        user_PW = request.getParameter("user_PW");
	        phone_Num = request.getParameter("phone_Num");
	        corp_Name = request.getParameter("corp_Name");
	        
	        con = db.getConnection();
	        ps = con.prepareStatement(query);
	        ps.setString(1, user_ID);
	        ps.setString(2, user_PW);
	        ps.setString(3, phone_Num);
	        ps.setString(4, corp_Name);
	        
	        int rowsAffected = ps.executeUpdate();
	        
	        
	        if (rowsAffected > 0) {
	            return "로그인 정보 추가"; // 쿼리가 성공적으로 실행된 경우
	        } else {
	            return "로그인 정보 추가 실패"; // 쿼리가 실패한 경우
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "로그인 정보 추가 실패: SQL 오류";
	    } catch (Exception e) { 
	        e.printStackTrace();
	        return "로그인 정보 추가 실패: 일반 오류";
	    } finally {
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}



	
	public static byte[] convertImageToFormat(BufferedImage image, String format) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, format, baos);
        return baos.toByteArray();
    }
}