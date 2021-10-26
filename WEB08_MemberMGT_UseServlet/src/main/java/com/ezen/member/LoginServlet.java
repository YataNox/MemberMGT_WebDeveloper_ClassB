package com.ezen.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ezen.dao.MemberDao;
import com.ezen.dto.MemberDto;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
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
		request.setCharacterEncoding("UTF-8");
		// 로그인 할 수 있는 화면으로 포워딩
		String url = "member/loginForm.jsp"; // 포워딩 될 페이지의 경로 설정
		
		// 서블릿에서 세션은 아래와 같이 request에서 getSession()으로 전달받아야 사용이 가능합니다.
		HttpSession session = request.getSession();
		// .jsp 파일에는 이미 request와 response, session, application등이
		// 이미 존재하기 때문에 session을 바로 사용하는 것이 가능하지만,
		// 서블릿은 그렇지 않고, request와 response를 전달받아 사용하기 때문에
		// 전달된 request를 통해 session을 꺼내서 사용합니다.
		
		// loginUesr 세션 값이 null이 아니라면
		if(session.getAttribute("loginUser") != null) {
			url = "main.do"; // 누군가 로그인 되어있는 상태라면 포워딩될 경로를 변경
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response); // 설정된 경로로 포워딩합니다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("userid");
		String pwd = request.getParameter("userpwd");
		
		// 로그인 실패(아이디 비번오류)했을 때 포워딩 할 경로
		String url = "member/loginForm.jsp";
		
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = mdao.getMember(id);

		if(mdto == null) { // 해당 아이디 없습니다.
			request.setAttribute("message", "존재하지 않는 아이디 입니다.");
		}else if(mdto.getUserpwd() == null) { // 시스템 오류 관리자에게 문의
			request.setAttribute("message", "시스템 오류 관리자에게 문의하세요.");
		}else if(mdto.getUserpwd().equals(pwd)) { // 정상 로그인
			url = "main.do";
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mdto);
		}else if(!mdto.getUserpwd().equals(pwd)) { // 비밀번호가 틀립니다.
			request.setAttribute("message", "비밀번호가 틀립니다.");
		}else { // 어쨋든 로그인 실패
			request.setAttribute("message", "기타 사유로 로그인에 실패합니다.");
		}
		
		RequestDispatcher dp = request.getRequestDispatcher(url);
		dp.forward(request, response);
	}

}
