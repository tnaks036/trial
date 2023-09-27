package Model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import Model.DataBase;
import VO.LoginVO;
import VO.UserVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//PasswordEncoder p = new BCryptPasswordEncoder();
		
		String user_ID = request.getParameter("user_ID");
        String user_PW = request.getParameter("user_PW");
        
        DataBase db = new DataBase();
        String sql;
        
        LoginVO loginVO = new LoginVO();
        loginVO.setUser_ID(user_ID);
        loginVO.setUser_PW(user_PW);
		
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		boolean result = false;
		
		
        //UserDAO userDAO = new UserDAOImpl();
		
//		if(user_PW.matches(loginVO.getUser_PW(), login)) {
//			session.setAttribute("user_id", loginVO.getUser_ID());
//			return "redirect:/";
//		} else {
//			rttr.addFlashAttribute("message", false);
//			session.setAttribute("user_id", null);
//			
//			return "redirect:login";
//		}
		
		try {
            conn = db.getConnection();
            sql = "SELECT User_PW FROM SC_Join WHERE User_ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, loginVO.getUser_ID());
            rs = pstmt.executeQuery();
            System.out.println("working?");
            if (rs.next()) {
                String hashedPasswordFromDB = rs.getString("User_PW");
                String userPW = loginVO.getUser_PW();

                // BCrypt를 사용하여 비밀번호 검증
                result = BCrypt.checkpw(userPW, hashedPasswordFromDB);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close(rs);
            db.close(pstmt);
            db.close(conn);
        }
		if (result) {
	        // 로그인 성공
	        HttpSession session = request.getSession();
	        session.setAttribute("user_ID", user_ID);
	        // 로그인 후 리다이렉트 또는 다른 작업을 수행할 수 있습니다.
	        response.sendRedirect("/index.jsp"); // 성공 페이지로 리다이렉트
	    } else {
	        // 로그인 실패
	        response.sendRedirect("/Login.jsp"); // 실패 페이지로 리다이렉트 또는 적절한 처리
	    }
	}
}
