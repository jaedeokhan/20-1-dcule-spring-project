<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DCULE :: 로그인</title>
<!-- css, js link -->
<%@ include file="/WEB-INF/views/_header.jspf"%>
</head>
<body>
<!-- nav bar -->
<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">로그인</h4>
				<p class="text-center">DCULE 대구가톨릭대학교 강의평가 사이트에 오신것을 환영합니다.</p>
				<p class="divider-text">
					<span class="bg-light">&nbsp;</span>
				</p>
				<form:form cssClass="form-horizontal" modelAttribute="authenticate"
					method="post" action="/DCULE/user/login">
					<div class="control-group">
						<!-- userId -->
						<label class="control-label" for="userId">아이디</label>
						<div class="controls">
							<form:input path="userId" placeholder="아이디를 입력해주세요"
								class="form-control" />
							<p class="help-block">
								<form:errors path="userId" cssClass="error" />
							</p>
						</div>
					</div>
					<br>
					<div class="control-group">
						<!-- userPassword1 -->
						<label class="control-label" for="userPassword1">비밀번호</label>
						<div class="controls">
							<form:password path="userPassword1" placeholder="비밀번호를 입력해주세요"
								class="form-control" />
							<p class="help-block">
								<form:errors path="userPassword1" cssClass="error" />
							</p>
							<c:if test="${not empty errorMessage}">
								<p class="help-block">${errorMessage}</p>
							</c:if>
						</div>
					</div>
					<div class="control-group">
						<!-- Button -->
						<div class="controls">
							<button type="submit" class="btn btn-primary btn-block">
								로그인</button>
						</div>
					</div>
				</form:form>
				<div class="form-group">
					<div class="col-md-12 control">
						<div style="padding-top: 15px; font-size: 85%">
							아직 회원이 아니신가요? <a href="/DCULE/user/join/form"> 회원가입></a>
						</div>
						<div style="padding-top: 15px; font-size: 85%">
							아이디를 잊으셨나요? <a href="/DCULE/user/idFind/form"> 아이디></a>
						</div>
						<div style="padding-top: 15px; font-size: 85%">
							비밀번호를 잊으셨나요? <a href="/DCULE/user/passwordFind"> 비밀번호></a>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
	<%
		String loginErrorContent = null;
		if (session.getAttribute("loginErrorContent") != null) {
			loginErrorContent = (String) session.getAttribute("loginErrorContent");
		}
		String loginErrorType = null;
		if (session.getAttribute("loginErrorType") != null) {
			loginErrorType = (String) session.getAttribute("loginErrorType");
		}
		if (loginErrorContent != null) { /* messageContent가 존재 */
	%>
	<!-- regist 후 panel-waring or panel-success 구분 -->
	<div class="modal fade" id="loginErrorModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-alignment-center">
				<div
					class="modal-content panel <%if (loginErrorType.equals("오류 메시지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<h4 class="modal-title" style="text-align: center;">
							<%=loginErrorType%>
						</h4>
						<button type="button" class="close btn pull-right"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<%=loginErrorContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#loginErrorModal').modal("show");
	</script>
	<%
			session.removeAttribute("loginErrorContent");
			session.removeAttribute("loginErrorType");
		}
	%>	
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>