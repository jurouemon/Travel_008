package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Mutter;
import model.PostMutterLogic;
import model.User;

/**
 * Servlet implementation class Main
 */
@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 評価コメントをアプリケーションスコープから取得
		ServletContext application = this.getServletContext();
		List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");

		// 取得できなかった場合は、評価コメントリストを新規作成して
		// アプリケーションスコープに保存
		if (mutterList == null) {
			mutterList = new ArrayList<>();
			application.setAttribute("mutterList", mutterList);
		}

		// ログインしているか確認するため、セッションスコープからユーザー情報を取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {	// ログインしていない場合
			// リダイレクト
			response.sendRedirect("/Travel_008_Otsuka/");
		}
		else {		// ログイン済みの場合
			String forwardPath = null;		// フォワード先の設定

			// リクエストパラメータの取得
//			request.setCharacterEncoding("UTF-8");
			String done = request.getParameter("done");
			System.out.print(done);

			if (done != null && done.equals("fine")) {
				forwardPath = "/WEB-INF/jsp/loginUserMain.jsp";
			}
			else {
				forwardPath = "/WEB-INF/jsp/userTour.jsp";
			}
			// フォワード
			RequestDispatcher dispatcher =
					request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの取得
		String text = request.getParameter("text");
		String tensu = request.getParameter("star");

		int star = 0;
		if (tensu == null) {	// 評価点無しの場合
			tensu = "";
		}
		else {
			star = Integer.parseInt(tensu);		// 評価ありの場合、整数値に変換
		}


		// 入力値チェック
		if ((text != null && text.length() != 0) || (tensu != null && tensu.length() != 0)){
			// アプリケーションスコープに保存された評価コメントを取得
			ServletContext application = this.getServletContext();
			List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");

			// セッションスコープに保存されたユーザー情報を取得
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");

			// コメントを評価コメントリストに追加
			Mutter mutter = new Mutter(loginUser.getName(), text, star);
			PostMutterLogic postMutterLogic = new PostMutterLogic();
			postMutterLogic.execute(mutter, mutterList);

			// アプリケーションスコープに評価コメントを保存
			application.setAttribute("mutterList", mutterList);
		}

		// お得意様特別企画画面にフォワード
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jsp/userTour.jsp");
		dispatcher.forward(request, response);
	}

}
