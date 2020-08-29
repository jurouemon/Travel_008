<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--@ page import="model.User" --%>
<%--
// ログイン時のエラーメッセージ処理(Login.javaで処理)
String errNmsg = (String) request.getAttribute("errNmsg");	// ユーザー名未入力
String errPmsg = (String) request.getAttribute("errPmsg");	// パスワード未入力
String loginERR = (String) request.getAttribute("loginERR");	// ログインエラー
if (loginERR == null) loginERR = "";	// ユーザー名とパスワードが未入力の場合、空白を返す
// セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
--%>

<%-- JSTL&EL式 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>サインインページ</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="login.css">



</head>

<body class="text-center">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-light">
			<a href="/Travel_008_Otsuka" class="navbar-brand text-dark">IIP TOUR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#Navbar" aria-controls="Navbar" aria-expanded="false"
				aria-label="ナビゲーションの切替">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="Navbar">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-dark"
						href="/Travel_008_Otsuka">ホーム <span class="sr-only">(現位置)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">特徴</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">価格</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">概要</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<form action="/Travel_008_Otsuka/Login" method="post"
		class="form-signin">
		<img class="mb-4" src="../images/bootstrap-solid.svg" alt=""
			width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">ログイン</h1>
		<label for="inputID" class="sr-only">ユーザーname</label> <input
			type="text" name="idName" id="inputID" class="form-control"
			placeholder="ユーザーname" required autofocus>
			<p class="text-danger"><c:out value="${requestScope.errNmsg}" /></p>
		<label for="inputPassword" class="sr-only">パスワード</label> <input
			type="password" name="pass" id="inputPassword" class="form-control"
			placeholder="パスワード" required>
			<p class="text-danger"><c:out value="${requestScope.errPmsg}" /></p>
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="remember-me"
				id="rememberCheck"> <label class="form-check-label"
				for="rememberCheck">情報を保存する</label>
		</div>
		<p class="text-danger"><c:out value="${requestScope.loginERR}" /></p>
		<p class="text-danger"><c:out value="${requestScope.errMsg}" /></p>
		<button class="btn btn-lg btn-primary btn-block" type="submit">サインイン</button>

		<p class="mt-5 mb-3 text-muted">&copy; 2020</p>
	</form>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd"
		crossorigin="anonymous"></script>

</body>
</html>

