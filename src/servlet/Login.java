package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginLogic;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの取得
//		request.setCharacterEncoding("UTF-8");
		String idName = request.getParameter("idName");
		String pass = request.getParameter("pass");

		// ログインしていないときの処理
		if (idName == null && pass == null) {
			request.setAttribute("errNmsg", "");	// 空白を返す
			request.setAttribute("errPmsg", "");	// 空白を返す
		}

		// フォワード
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// アプリケーションスコープに保存された訪問回数を増加
		ServletContext application = this.getServletContext();
		Integer count = (Integer) application.getAttribute("count");
		count++;
		application.setAttribute("count", count);

		// リクエストパラメータの取得
//		request.setCharacterEncoding("UTF-8");
		String idName = request.getParameter("idName");
		String pass = request.getParameter("pass");

		String forwardPath = null;		// フォワード先の設定

		// 入力もれチェック
		if (idName.equals("") || pass.equals("")) {  // IDとパスワードどちらか未入力
			if (idName.equals("")) {	// ID未入力
				request.setAttribute("errNmsg", "ユーザー名が入力されていません");
			}
			else {		// ID入力有り
				request.setAttribute("errNmsg", "");	// 空白を返す
			}
			if (pass.equals("")) {		// パスワード未入力
				request.setAttribute("errPmsg", "パスワードが入力されていません");
			}
			else {		// パスワード入力有り
				request.setAttribute("errPmsg", "");	// 空白を返す
			}
			forwardPath = "/WEB-INF/jsp/login.jsp";		// ログイン画面へフォワード設定
		}
		else {			// IDとパスワードの入力が両方されている時の処理
			// Userインスタンス（ユーザー情報）の生成
			User user = new User(idName, pass);

			// ログイン処理
			LoginLogic loginLogic = new LoginLogic();

			boolean isLogin = loginLogic.execute(user);


			// ログイン成功時の処理
			if (isLogin) {
				String name = loginLogic.chkName(user.getIDname());
				user.setName(name);

				// ユーザー情報をセッションスコープに保存
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", user);
				forwardPath = "/WEB-INF/jsp/loginUserMain.jsp";		// 会員用ページへフォワード設定
			}
			// ログイン失敗時の処理
			else {
				request.setAttribute("errNmsg", "");	// 空白を返す
				request.setAttribute("errPmsg", "");	// 空白を返す
				request.setAttribute("loginERR", "ログインできません");
				request.setAttribute("errMsg", "ユーザー名かパスワードが違います");
				forwardPath = "/WEB-INF/jsp/login.jsp";		// ログイン画面へフォワード設定
			}
		}

		// ログイン結果画面にフォワード
		RequestDispatcher dispatcher =
				request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);

	}

	public void destroy() {
		System.out.println("destroy()が実行されました");
	}

}
