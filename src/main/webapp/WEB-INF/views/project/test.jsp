<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/reset.css"
          rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica,
        Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    }

    .main-container {
        padding: 30px;
    }

    /* HEADING */

    .heading {
        text-align: center;
    }

    .heading__title {
        font-weight: 600;
    }

    .heading__credits {
        margin: 10px 0px;
        color: #888888;
        font-size: 25px;
        transition: all 0.5s;
    }

    .heading__link {
        text-decoration: none;
    }

    .heading__credits .heading__link {
        color: inherit;
    }

    /* CARDS */

    .cards {
        display: flex;
        flex-wrap: wrap;
        justify-content: start;
    }

    .card {
        --background:#FFFFFF;
        margin: 20px;
        padding: 20px;
        padding-top: 0px;
        width: 300px;
        height: 200px;
        min-height: 200px;
        display: grid;
        grid-template-rows: 20px 50px 1fr 50px;
        border-radius: 10px;
        box-shadow:0 0 2rem -1rem rgba(0,0,0,.05);
        transition: all 0.2s;
        color: #ffffff;
    }

    .card:hover {
        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4);
        transform: scale(1.01);
    }

    .card__link,
    .card__exit,
    .card__icon {
        position: relative;
        text-decoration: none;
        color: rgba(255, 255, 255, 0.9);
    }

    .card__link::after {
        position: absolute;
        top: 25px;
        left: 0;
        content: "";
        width: 0%;
        height: 3px;
        background-color: rgba(255, 255, 255, 0.6);
        transition: all 0.5s;
    }

    .card__link:hover::after {
        width: 100%;
    }

    .card__exit {
        grid-row: 1/2;
        justify-self: end;
    }

    .card__icon {
        grid-row: 2/3;
        font-size: 30px;
    }

    .card__title {
        grid-row: 3/4;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        color: #ffffff;
    }

    .card__apply {
        grid-row: 4/5;
        align-self: center;
    }

    /* CARD BACKGROUNDS */

    .card-1 {
        background: #3C3B3D; --text:white;
    }

    .card-2 {
        background: #EC87C0; --text:white;
    }

    .card-3 {
        background: #5D9CEC; --text:white;
    }

    .card-4 {
        background: #6b10ec; --text:white;
    }

    .card-5 {
        background: #76cf0e; --text:white;
    }

    /* RESPONSIVE */

    @media (max-width: 1600px) {
        .cards {
            justify-content: center;
        }
    }

</style>
<body>

<div class="main-content">
    <div class="container">
    <div style="height: 50px"></div>
        <h2>즐겨찾기</h2>
    <div class="cards">
        <div class="card card-1">
            <div class="card__icon"><i class="fas fa-bolt"></i></div>
            <h3 class="card__title">테스트 <i class="fas fa-arrow-right"></i></h3>
            <p class="card__apply">
            <a class="card__link">폰트 추천좀ㅋㅋ</a>
                <a class="card__link" style="float: right">2022-06-02</a>
            </p>
        </div>
        <div class="card card-2">
            <div class="card__icon"><i class="fas fa-bolt"></i></div>
            <h3 class="card__title">테스트2</h3>
            <p class="card__apply">
                <a class="card__link" href="#">ㅁㄴㅇㄹ <i class="fas fa-arrow-right"></i></a>
            </p>
        </div>
        <div class="card card-3">
            <div class="card__icon"><i class="fas fa-bolt"></i></div>
            <h3 class="card__title">뭐해</h3>
            <p class="card__apply">
                <a class="card__link" href="#">ㅋㅋ <i class="fas fa-arrow-right"></i></a>
            </p>
        </div>
        <div class="card card-4">
            <div class="card__icon"><i class="fas fa-bolt"></i></div>
            <h3 class="card__title">테스트4</h3>
            <p class="card__apply">
                <a class="card__link" href="#">2022-06-07 <i class="fas fa-arrow-right"></i></a>
            </p>
        </div>
        <div class="card card-5">
            <div class="card__icon"><i class="fas fa-bolt"></i></div>
            <h3 class="card__title">줄바꿈되면 어떻게되는지 테스트</h3>
            <p class="card__apply">
                <a class="card__link" href="#">ㄹㅇ <i class="fas fa-arrow-right"></i></a>
            </p>
        </div>
    </div>
        <h3>참여중</h3>
        <div class="cards">
            <div class="card card-1">
                <div class="card__icon"><i class="fas fa-bolt"></i></div>
                <h3 class="card__title">테스트</h3>
                <p class="card__apply">
                    <a class="card__link" href="#">폰트 추천좀ㅋㅋ <i class="fas fa-arrow-right"></i></a>
                </p>
            </div>
            <div class="card card-2">
                <div class="card__icon"><i class="fas fa-bolt"></i></div>
                <h3 class="card__title">테스트2</h3>
                <p class="card__apply">
                    <a class="card__link" href="#">ㅁㄴㅇㄹ <i class="fas fa-arrow-right"></i></a>
                </p>
            </div>
            <div class="card card-3">
                <div class="card__icon"><i class="fas fa-bolt"></i></div>
                <h3 class="card__title">뭐해</h3>
                <p class="card__apply">
                    <a class="card__link" href="#">ㅋㅋ <i class="fas fa-arrow-right"></i></a>
                </p>
            </div>
        </div>
</div>
</div>
</body>
</html>