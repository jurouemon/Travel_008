<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@ page import="model.User" --%>
<%--
//セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//アプリケーションスコープに保存された訪問回数を取得
Integer count = (Integer) application.getAttribute("count");
--%>

<%-- JSTL&EL式 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ログイン画面ページ</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="userPage.css">

</head>

<style>
.object-fit-img {
	width: 100%;
	height: 650px;
	object-fit: cover;
}

.object-img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}
</style>

<body>
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
					<li class="nav-item active"><a class="nav-link text-dark" href="/Travel_008_Otsuka">ホーム
							<span class="sr-only">(現位置)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">特徴</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">価格</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">概要</a></li>
				</ul>

				<h5><c:out value="ようこそ${loginUser.name}さん" />　<br>
				<small>あなたは<c:out value="${count}" />人目の訪問者です　</small></h5>


				<form class="form-inline mt-2 mt-md-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="検索..." aria-label="検索...">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">検索</button>
				</form>
			</div>
		</nav>
	</header>

	<!-- カルーセル
    ================================================== -->
	<main role="main">
	<div id="myCarousel" class="carousel slide carousel-fade"
		data-ride="carousel">
		<!-- インジケータ -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="object-fit-img d-block w-100"
					data-src="holder.js/900x300?auto=yes&amp;bg=666&amp;fg=444&amp;text=First slide"
					alt="First slide [900x300]" src="images/bird.jpg"
					class="img-fluid" data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption text-left">
						<h1>見出しの例。</h1>
						<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
						<p>
							<a class="btn btn-primary" href="#" role="button">本日登録</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="object-fit-img d-block w-100"
					data-src="holder.js/900x300?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide"
					alt="Second slide [900x300]" src="images/temple.jpg" class="img-fluid"
					data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption">
						<h1>別の見出しの例。</h1>
						<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
						<p>
							<a class="btn btn-primary" href="#" role="button">もっと学ぼう</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="object-fit-img d-block w-100"
					data-src="holder.js/900x300?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide"
					alt="Second slide [900x300]" src="images/fukugi.JPG"
					class="img-fluid" data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption text-right">
						<h1>もう1つ良い指標。</h1>
						<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
						<p>
							<a class="btn btn-primary" href="#" role="button">ギャラリーを閲覧</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#myCarousel" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">前へ</span>
		</a> <a class="carousel-control-next" href="#myCarousel" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">次へ</span>
		</a>
	</div>
	<!-- /.carousel --> <!-- マーケティングメッセージングとフィーチャー
      ================================================== --> <!-- 残りのページを別のコンテナで囲んで、すべてのコンテンツを中央に配置 -->
	<div class="container marketing">
		<!-- カルーセルの下にある3列のテキスト -->
		<div class="row">
			<div class="col-lg-4">
				<img class="object-img card-img-top" src="images/spain.jpg"
					alt="画像">
				<h2>ヨーロッパ路地裏探訪</h2>
				<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
				<p>
					<a class="btn btn-secondary" href="/Travel_008_Otsuka/Main" role="button">詳細を見る
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="object-img card-img-top" src="images/nehan.jpg" alt="画像">
				<h2>タイ・バンコク5日間</h2>
				<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
				<p>
					<a class="btn btn-secondary" href="/Travel_008_Otsuka/Main" role="button">詳細を見る
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="object-img card-img-top" src="images/beach3.JPG" alt="画像">
				<h2>沖縄4日間</h2>
				<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
				<p>
					<a class="btn btn-secondary" href="/Travel_008_Otsuka/Main" role="button">詳細を見る
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container --> </main>

	<jsp:include page="/WEB-INF/jsp/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd"
		crossorigin="anonymous"></script>

</body>
</html>
