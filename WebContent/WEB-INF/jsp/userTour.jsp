<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@ page import="model.User" --%>
<%--
//セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
--%>

<%-- JSTL&EL式 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>お得意様向け特別企画</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="tour.css">

</head>

<body>
  <header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a href="/Travel_008_Otsuka" class="navbar-brand text-light">IIP TOUR</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#Navbar" aria-controls="Navbar" aria-expanded="false"
				aria-label="ナビゲーションの切替">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="Navbar">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link text-light" href="/Travel_008_Otsuka">ホーム
							<span class="sr-only">(現位置)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">特徴</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">価格</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">概要</a></li>
				</ul>

				<h5 class="text-light"><c:out value="ようこそ${loginUser.name}さん" />　</h5>

				<form class="form-inline mt-2 mt-md-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="検索..." aria-label="検索...">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">検索</button>
				</form>
			</div>
		</nav>
	</header>

  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
      <h1 class="display-4 font-weight-normal">特別企画ツアーのご案内</h1>
      <p class="lead font-weight-normal">沖縄4日間※お得意様ご優待価格です!</p>
      <a class="btn btn-outline-secondary" href="#">近日公開</a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
  </div>


<form action="/Travel_008_Otsuka/Main" method="post">
<div class="alert alert-warning" role="alert">- チェックしてください！<br>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="star" value="1">
  <label class="form-check-label">1</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="star" value="2">
  <label class="form-check-label">2</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="star" value="3">
  <label class="form-check-label">3</label>
</div>

<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="star" value="4">
  <label class="form-check-label">4</label>
</div>

<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" name="star" value="5">
  <label class="form-check-label">5</label><br>
</div>

<div class="form-group">
    <label for="exampleFormControlTextarea1">お客様の声をお聞かせください</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="text" rows="3"></textarea><br>

<input type="submit" class="btn btn-primary" value="登録する">
<input type="reset" class="btn btn-primary" value="リセット"><br>
</div>
</div>

<div class="alert alert-primary" role="alert">▼△　お客様の声　△▼<br>

<c:forEach var="mutter" items="${mutterList}" >
	<c:out value="${mutter.userName}さん" /> :
			<c:forEach var="i" begin="1" end="${mutter.star}" step="1">
				★
			</c:forEach><br>
	<c:out value="${mutter.text}" /><br>
</c:forEach>
</div>

<a class="btn btn-success" href="/Travel_008_Otsuka/Main?done=fine" role="button">会員専用ページTOPへ</a><br>

</form><br>

<footer>
  <jsp:include page="/WEB-INF/jsp/footer.jsp" />

</footer>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script>

</body>

</html>
