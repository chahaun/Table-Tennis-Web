import java.io.IOException;
import java.io.PrintWriter;
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
        
        // 임의로 아이디와 비밀번호를 설정한다.
        if(id.equals("chahaun") && password.equals("1234")) { // 로그인에 성공한다면
        	HttpSession sessionSet = request.getSession(); // 세션 생성
        	sessionSet.setAttribute("sessionId", id); // session의 name을 sessionId, value를 id값으로 설정
        	response.sendRedirect("/TTProject/mainpage.jsp"); // 설정 후, 인덱스 페이지로 이동
        }else { // 로그인 실패
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
	}

}
