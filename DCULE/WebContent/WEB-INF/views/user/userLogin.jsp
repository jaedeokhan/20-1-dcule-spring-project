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
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) { /* 로그인 상태라면 */
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어있는 상태입니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
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
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) { /* messageContent가 존재 */
	%>
	<!-- regist 후 panel-waring or panel-success 구분 -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-alignment-center">
				<div
					class="modal-content <%if (messageType.equals("오류 메시지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<!-- &times == x버튼에 해당하는 그림 -->
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
		}
	%>
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>