<%@page import="cn.sjy.utils.GetNotice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="result.jsp">
<meta name="author" content="MichaelSui">
<link rel="icon" href="./img/favicon.ico">

<title>CAI System</title>

<!-- Bootstrap core CSS. -->
<link rel="stylesheet"
	href="./vendor/bootstrap-4.0.0-dist/css/bootstrap.min.css">

<!-- Custom fonts and pictures for this template. -->
<link rel="stylesheet" type="text/css"
	href="./vendor/fontawesome-free-5.0.8/web-fonts-with-css/css/fa-brands.min.css">
<link rel="stylesheet" type="text/css"
	href="./vendor/fontawesome-free-5.0.8/web-fonts-with-css/css/fa-solid.min.css">
<link rel="stylesheet" type="text/css"
	href="./vendor/fontawesome-free-5.0.8/web-fonts-with-css/css/fontawesome.min.css">
<link rel="stylesheet" type="text/css"
	href="./vendor/fonts-googleapis/fonts-googleapis.css">

<!-- Custom styles for this page. -->
<link rel="stylesheet" href="./css/result.css">
</head>

<body>
	<!-- Navigation. -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a href="./index.jsp"> <img id="nav-brand-img"
				src="./img/favicon.ico" alt="brand" />
			</a> <a class="navbar-brand ml-2" href="./index.jsp">CAI System</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse ml-4" id="navbarsExampleDefault">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="goToCodeOnLineAction.do">在线编程</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="goToHandInHomeWorkAction.do">提交作业</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="goToQuestionListAction.do">提出问题</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="goToResourceSharingAction.do">资源共享</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="goToMyInformationAction.do">我的信息</a></li>
					<li class="nav-item active"><a class="nav-link" id="noticeBtn"
						href="#">通知</a></li>
				</ul>
				<a class="btn btn-primary" id="nav-btn-1" href="goToLogInAction.do">登陆</a>
			</div>
		</div>
	</nav>

	<!-- 通知窗口。 -->
	<div id="noticeBackground"></div>
	<div id="noticeDiv">
		<h2>
			通知窗口<a href="#" id="closeBtn">关闭</a>
		</h2>
		<div id="noticeMsg"></div>
	</div>

	<!-- 主体部分。 -->
	<div class="container" id="main-body">
		<div class="row">
			<h2 class="col-lg-12">服务器返回结果：</h2>
			<div class="col-lg-12 mt-4">
				<%=request.getAttribute("msg")%>
			</div>
			<br />
			<div class="col-lg-6">
				<h2 class="mt-4">最终成绩：</h2>
				<div class="mt-4">
					总计用例个数：<%=request.getAttribute("allCount")%>
					<br /> 通过用例个数：<%=request.getAttribute("correctCount")%>
					<br /> 失败用例个数：<%=request.getAttribute("errorCount")%>
					<br /> 本题最终成绩：<%=request.getAttribute("score")%>
				</div>
			</div>
			<div class="col-lg-6">
				<div id="canvas-holder" style="width: 100%">
					<canvas id="chart-area"></canvas>
				</div>
			</div>
			<h2 class="col-lg-12 mt-4">帮助：</h2>
			<div class="col-lg-12">
				1、可以多次提交程序，最终成绩将按照<b>最后一次</b>提交保存。<br /> 2、刷新页面会导致代码的丢失，请自行做好程序备份。<br />
				3、若服务器返回结果无显示，请检查程序中是否包含死循环等其他错误。<br />
			</div>
		</div>
	</div>

	<!-- Footer. -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="goToAboutAction.do">关于</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="goToContactAction.do">联系</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="goToTermsAction.do">使用条款</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a
							href="goToPrivacyPolicyAction.do">隐私政策</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; CAI System
						2017-2018. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a
							href="tencent://message/?Menu=yes&uin=2802138850"> <i
								class="fab fa-qq fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a
							href="mailto:2802138850@qq.com"> <i
								class="fas fa-at fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript and etc. -->
	<script src="./vendor/jquery-3.3.1/jquery-3.3.1.slim.min.js"></script>
	<script src="./vendor/popper/popper.min.js"></script>
	<script src="./vendor/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>
	<%
	    // 将后台的相关数据传递给js。
	    String userId = session.getAttribute("userId").toString();
	    String userAuthority = session.getAttribute("userAuthority").toString();

	    int correctCount = Integer.parseInt(request.getAttribute("correctCount").toString());
	    int errorCount = Integer.parseInt(request.getAttribute("errorCount").toString());

	    // 获取通知信息。
	    ArrayList<String> dates = GetNotice.getDates();
	    ArrayList<String> notices = GetNotice.getNotices();
	    int noticeNum = dates.size();
	%>
	<input type="hidden" id="userId" value="<%=userId%>" />
	<input type="hidden" id="userAuthority" value="<%=userAuthority%>" />
	<input type="hidden" id="correctCount" value="<%=correctCount%>" />
	<input type="hidden" id="errorCount" value="<%=errorCount%>" />
	<input type="hidden" id="noticeNum" value="<%=noticeNum%>" />
	<%
	    for (int i = 0; i < noticeNum; i++) {
			String noticeDateKey = "notice" + i + "Date";
			String noticeDateValue = dates.get(i);

			String noticeMsgKey = "notice" + i + "Msg";
			String noticeMsgValue = notices.get(i);
	%>
	<input type="hidden" id="<%=noticeDateKey%>"
		value="<%=noticeDateValue%>" />
	<input type="hidden" id="<%=noticeMsgKey%>" value="<%=noticeMsgValue%>" />
	<%
	    }
	%>
	<script src="./js/result.js"></script>
	<script src="./vendor/Chart.js/Chart.Bundle.js"></script>
	<script src="./vendor/Chart.js/utils.js"></script>
</body>

</html>