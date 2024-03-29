<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>DCULE :: 회원정보수정</title>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
form {
	width: 300px;
}
</style>
<%@ include file="/WEB-INF/views/_header.jspf"%>
</head>
<body>
	<!-- css, js link -->
	<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">개인정보수정</h4>
				<p class="text-center">변경할 데이터를 입력해주세요.</p>
				<p class="divider-text">
					<span class="bg-light">&nbsp;</span>
				</p>
				<form:form cssClass="form-horizontal" modelAttribute="user"
					method="post" action="/DCULE/user/update">
					<div class="control-group">
						<!-- userId -->
						<label class="control-label" for="userId">아이디</label>
						<div class="controls">
							<c:if test="${not empty user.userId}">
								<input class="form-control" placeholder="${user.userId}"
									disabled />
								<form:hidden path="userId" />
							</c:if>
						</div>
					</div>
					<br>
					<div class="control-group">
						<!-- userPassword1 -->
						<label class="control-label" for="userPassword1">비밀번호</label>
						<div class="controls">
							<form:password path="userPassword1"
								onkeyup="passwordCheckFunction();" placeholder="비밀번호를 입력해주세요"
								class="form-control" />
							<p class="help-block">
								<form:errors path="userPassword1" cssClass="error" />
							</p>
						</div>
					</div>
					<div class="control-group">
						<!-- userPassword2-->
						<label class="control-label" for="userPassword2">비밀번호확인</label>
						<div class="controls">
							<input onkeyup="passwordCheckFunction();" class="form-control"
								type="password" id="userPassword2" name="userPassword2"
								maxlength="20" placeholder="비밀번호 확인을 입력해주세요">
						</div>
						<p class="help-block" id="passwordCheckMessage"></p>
					</div>
					<div class="control-group">
						<!-- userName -->
						<label class="control-label" for="userName">별명 </label>
						<div class="controls">
							<form:input path="userName" placeholder="별명을 입력해주세요"
								class="form-control" />
							<p class="help-block">
								<form:errors path="userName" cssClass="error" />
							</p>
						</div>
					</div>
					<div class="control-group">
						<!-- userEmail -->
						<label class="control-label" for="userEmail">이메일 </label>
						<div class="controls">
							<c:if test="${not empty user.userEmail}">
								<input class="form-control" placeholder="${user.userEmail}"
									disabled />
								<form:hidden path="userEmail" />
							</c:if>
							<br>
							<c:if test="${not empty successMessage}">
								<p class="success-block">${successMessage}</p>
							</c:if>
						</div>
					</div>
					<br>
					<div class="control-group">
						<!-- Button -->
						<div class="controls">
							<button type="submit" class="btn btn-primary btn-block">
								정보수정</button>
							</div>
						</div>
					</form:form>
			</article>
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
	</div>
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>