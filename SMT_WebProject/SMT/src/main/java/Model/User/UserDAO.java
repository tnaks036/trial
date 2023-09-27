package Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.DuplicateFormatFlagsException;

import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import Model.DataBase;
import VO.UserVO;

public class UserDAO {
	DataBase db = new DataBase();
	Connection conn = null;
    PreparedStatement pstmt = null;
    
    public boolean checkUsernameDuplicate(String user_ID) throws DuplicateFormatFlagsException {
	    String sql = "SELECT COUNT(User_ID) FROM user WHERE User_ID = ?";	    
	    boolean result = false;
	    DataBase db = new DataBase();
	    try (Connection conn = db.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, user_ID);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	            	int count = rs.getInt(1);
	                result = count > 0; // 중복 사용자면 true, 아니면 false
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if (result) {
	    	throw new DuplicateFormatFlagsException("Duplicate user ID");
	    }
	    return result;
	}
    
    //SQLExeption 에서 빼고 수정하니 받아와짐 왜?ㅇㅅㅇ
    public int Signup(String user_ID, String user_PW, String phone_Num, String corp_Name) {
        DataBase db = new DataBase();
        //SQL 쿼리문 작성 (SQL SERVER 사용 예제)
    	String query = "INSERT INTO SC_Join (User_ID, User_PW, Phone_Num, Corp_Name) VALUES (?, ?, ?, ?)";
        String hashedPassword = BCrypt.hashpw(user_PW, BCrypt.gensalt()); // 비밀번호 해시화
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        /// 회원 가입 기능 구현
        try {
	        	conn = db.getConnection();
	        	System.out.println("겟빠람빠람");
	        	pstmt = conn.prepareStatement(query);
	        	pstmt.setString(1, user_ID); 
	        	pstmt.setString(2, hashedPassword); //hashedPassword ! 
	        	pstmt.setString(3, phone_Num);
	        	pstmt.setString(4, corp_Name);
	        	System.out.println("working?");
	        	return pstmt.executeUpdate();
        		        	       	        		        	  		        	
			    } catch (Exception e) {
			    	e.printStackTrace();
			    	System.out.println("Error signing up for membership: "+ e.getMessage());
			    } finally {
			    	// 자원 해제
			        try {
						if(rs != null) rs.close();
						if(pstmt != null) db.close(pstmt);
				        db.close(conn);
					} catch (Exception e) {
						e.printStackTrace();
					}  
			    }
			    return -1; //db 오류    
	    }
}


