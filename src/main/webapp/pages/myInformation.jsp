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
<meta name="description" content="myInformation.jsp">
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
<link rel="stylesheet" href="./css/myInformation.css">
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

	<!-- 主题部分。 -->
	<div class="container" id="main-body">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="mb-4">查看、修改个人信息</h2>
				<form class="needs-validation" action="changeMyInformationAction.do"
					method="post" novalidate>
					<div class="row">
						<div class="col-lg-6 mb-3">
							<label for="userId">学号</label> <input type="text"
								class="form-control" id="final_userId" name="userId" readOnly>
						</div>

						<div class="col-lg-6 mb-3">
							<label for="name">姓名</label> <input type="text"
								class="form-control" id="name" name="name" required>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">电子邮箱</label> <input type="email"
							class="form-control" id="email" name="email">
					</div>

					<div class="mb-3">
						<label for="phone">联系方式<span class="text-muted">(推荐手机号码)</span></label>
						<input type="text" class="form-control" id="phone" name="phone"
							required>
					</div>

					<div class="mb-3">
						<label for="QQ/TIM">QQ/TIM</label> <input type="text"
							class="form-control" id="qqOrTim" name="qqOrTim" required>
					</div>

					<div class="mb-3">
						<label for="wechat">微信</label> <input type="text"
							class="form-control" id="wechat" name="wechat" required>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-primary mb-3" type="submit"
								id="changeMyInformationBtn">修改</button>
						</div>
					</div>
				</form>
			</div>

			<h2 class="col-lg-12 mb-4">修改密码：</h2>
			<div class="col-lg-12">
				<form class="form" role="form" action="changePasswordAction.do"
					method="post">
					<input type="password" class="form-control" name="oldPassword"
						placeholder="请输入旧密码" required> <input type="password"
						class="form-control mt-2" name="newPassword1" placeholder="请输入新密码"
						required><input type="password" class="form-control mt-2"
						name="newPassword2" placeholder="请重复输入新密码" required>
					<button type="submit" class="btn btn-primary mt-2 mb-4"
						id="changePasswordBtn">修改密码</button>
				</form>
			</div>

			<h2 class="col-lg-12 mt-2">编程成绩：</h2>
			<div class="col-lg-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>题目编号</th>
							<th>最终成绩</th>
						</tr>
					</thead>
					<tbody id="scoreList"></tbody>
				</table>
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
	<!-- 将后台的相关数据传递给js。 -->
	<%
	    String userId = session.getAttribute("userId").toString();
	    String userAuthority = session.getAttribute("userAuthority").toString();
	    String name = null;
	    String email = null;
	    String phone = null;
	    String qqOrTim = null;
	    String wechat = null;
	    try {
			name = request.getAttribute("name").toString();
			email = request.getAttribute("email").toString();
			phone = request.getAttribute("phone").toString();
			qqOrTim = request.getAttribute("qqOrTim").toString();
			wechat = request.getAttribute("wechat").toString();
	    } catch (NullPointerException e) {
			name = "";
			email = "";
			phone = "";
			qqOrTim = "";
			wechat = "";
	    }
	    int codeScoreNum = Integer.parseInt(request.getAttribute("codeScoreNum").toString());

	    // 获取通知信息。
	    ArrayList<String> dates = GetNotice.getDates();
	    ArrayList<String> notices = GetNotice.getNotices();
	    int noticeNum = dates.size();
	%>
	<input type="hidden" id="userId" value="<%=userId%>" />
	<input type="hidden" id="userAuthority" value="<%=userAuthority%>" />
	<input type="hidden" id="o_name" value="<%=name%>" />
	<input type="hidden" id="o_email" value="<%=email%>" />
	<input type="hidden" id="o_phone" value="<%=phone%>" />
	<input type="hidden" id="o_qqOrTim" value="<%=qqOrTim%>" />
	<input type="hidden" id="o_wechat" value="<%=wechat%>" />
	<input type="hidden" id="codeScoreNum" value="<%=codeScoreNum%>" />
	<%
	    for (int i = 0; i < codeScoreNum; i++) {
			String codeScoreNameKey = "codeScoreName" + i;
			String codeScoreName = request.getAttribute(codeScoreNameKey).toString();
			String codeScoreScoreKey = "codeScoreScore" + i;
			int codeScoreScore = Integer.parseInt(request.getAttribute(codeScoreScoreKey).toString());
	%>
	<input type="hidden" id="<%=codeScoreNameKey%>"
		value="<%=codeScoreName%>" />
	<input type="hidden" id="<%=codeScoreScoreKey%>"
		value="<%=codeScoreScore%>" />
	<%
	    }
	%>
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
	<script src="./js/myInformation.js"></script>
</body>

</html>