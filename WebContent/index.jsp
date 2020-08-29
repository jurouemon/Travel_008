<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--@ page import="model.User" --%>
<%--
//セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
String name = null;		// ログインチェック
if (loginUser == null) {	// ログインしていない場合
	name = "";
}
else {						// ログインしている場合、会員名を表示
	name = "ようこそ" + loginUser.getName() + "さん";
}
--%>

<%-- JSTL＆EL式版 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<!-- 必要なメタタグ -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="userPage.css">

<title>IIPトラベル</title>

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

				<h4>
					<c:choose>
						<c:when test="${not empty loginUser}">
							<c:out value="ようこそ${loginUser.name}さん" />
						</c:when>
						<c:otherwise>
							<c:out value="" />
						</c:otherwise>
					</c:choose>
				　</h4>
				<a href="/Travel_008_Otsuka/Login"
					class="btn btn-info btn-sm active" role="button"
					aria-pressed="true">ログイン</a>
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
					alt="First slide [900x300]" src="images/beach.JPG"
					class="img-fluid" data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption text-left">
						<h1>IIPトラベル</h1>
						<p>All the places you want to go.<br>
							心の渇きには、旅がある。</p>
						<p>
							<a class="btn btn-primary" href="#" role="button">本日登録</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="object-fit-img d-block w-100"
					data-src="holder.js/900x300?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide"
					alt="Second slide [900x300]" src="images/bar.jpg" class="img-fluid"
					data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption text-right">
						<h1>IIPトラベル</h1>
						<p>All the places you want to go.<br>
							見たことのない色を、見にいこう。</p>
						<p>
							<a class="btn btn-primary" href="#" role="button">旅について</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="object-fit-img d-block w-100"
					data-src="holder.js/900x300?auto=yes&amp;bg=666&amp;fg=444&amp;text=Second slide"
					alt="Second slide [900x300]" src="images/florence.jpeg"
					class="img-fluid" data-holder-rendered="true">
				<div class="container">
					<div class="carousel-caption text-right">
						<h1>IIPトラベル</h1>
						<p>All the places you want to go.<br>
							自分に行き詰ったら、旅が最良の薬です。</p>
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
				<img class="object-img card-img-top" src="images/mercart.jpg"
					alt="画像">
				<h2>スペイン周遊7日間</h2>
				<p>一番効率的な『アンダルシア×バルセロナ』周遊 7日間。★ ●パラドール手配可能！【関空発/フライト短い同日着！】
					～★専用車で憧れの白い村『フリヒリアナ』立ち寄りアレンジも可能！★～</p>
				<p>
					<a class="btn btn-secondary" href="/WEB-INF/jsp/tour.jsp" role="button">詳細を見る
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="object-img card-img-top" src="images/river.jpg" alt="画像">
				<h2>イタリア8日間</h2>
				<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
				<p>
					<a class="btn btn-secondary" href="#" role="button">詳細を見る
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img class="object-img card-img-top" src="images/naha.JPG" alt="画像">
				<h2>★ お得意様特別企画</h2>
				<p>この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。</p>
				<p>
					<a class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="ログインが必要です" href="/Travel_008_Otsuka/Login" role="button">詳細を見る
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
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>