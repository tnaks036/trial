package Model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.DuplicateFormatFlagsException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.google.gson.JsonArray;
import com.google.gson.stream.JsonReader;

import Model.DataBase;
import Model.User.UserDAO;
import VO.UserVO;
/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAO userDAO; 
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        this.userDAO = new UserDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
        //JsonArray arrayObj = new JsonArray();                         //JSON리스트를 가져오기 위해 Array생성
        
        UserDAO userDAO  = new UserDAO();
        // 사용자 정보를 저장하는 방식을 여기에 추가-db에 저장 가능
        // 사용자 정보를 UserVO 객체에 저장
        UserVO user = new UserVO();
      
		String user_ID = request.getParameter("user_ID");
		System.out.println("user_ID: " + user_ID);
        String user_PW = request.getParameter("user_PW");
        System.out.println("user_PW: " + user_PW);
        String user_PW2 = request.getParameter("user_PW2");
        String phone_Num = request.getParameter("phone_Num");
        String corp_Name = request.getParameter("corp_Name");
        System.out.println("또잉서블");
        System.out.println("Is this working???");
        //HttpSession session = request.getSession();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        int result = this.userDAO.Signup(user_ID, user_PW, phone_Num, corp_Name);
        
        if (result == 1) {
            // 회원가입 성공
            response.getWriter().write("Success !!!!! ");
        } else {
            // 회원가입 실패
            response.getWriter().write("Failed for Sign Up :(");
        }
    }
}