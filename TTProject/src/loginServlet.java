import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); // 한글 깨짐 방지 , 로그인 실패 alert 시 한글이 깨지는 것을 막아준다.
        
        String id = request.getParameter("login_id"); // loginForm에서 받아온 id의 값을 담는다.
        String password = request.getParameter("login_pwd");
        
        Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from shopping.user where userID = '" + id + "'; ");
	        if (rs.next()) {
	        	String tempPWD = rs.getString("userPWD");
	        	if(password.equals(tempPWD)) {
	        		HttpSession sessionSet = request.getSession(); // 세션 생성
	            	sessionSet.setAttribute("sessionId", id); // session의 name을 sessionId, value를 id값으로 설정
	            	response.sendRedirect("/TTProject/mainpage.jsp"); // 설정 후, 인덱스 페이지로 이동
	        	} else { // 로그인 실패
		        	PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('비밀번호가 틀립니다.')");
		            script.println("history.back()");
		            script.println("</script>");
		        }
	        } else { // 로그인 실패
	        	PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('아이디가 틀립니다.')");
	            script.println("history.back()");
	            script.println("</script>");
	        }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
                stmt.close();
         	}
         	catch (Exception ignored) {
         	}
         	try {
         	       conn.close();
         	}
        	catch (Exception ignored) {
        	}
		}
	}

}
