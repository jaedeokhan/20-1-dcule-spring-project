<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>DCULE :: 회원가입</title>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/_header.jspf"%>
<script type="text/javascript">
	function registerCheckFunction() {
		var userId = $('#userId').val(); /* 현재 사용자가 입력한 userID 의 값을 가져온다.*/
		$.ajax({ /* ajax를 이용한 비동기통신 */
			type : 'POST',
			url : './idCheck',
			data : {
				userId : userId
			},
			success : function(data) {
				if (data == 1) {
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
				} else {
					$("#id_check").text("사용가능한 아이디입니다 :p");
					$("#id_check").css("color", "blue");
				}
			}
		});
	}
	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호와 비밀번호확인을 동일하게 입력해주세요.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
</script>
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
	<!-- css, js link -->
	<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">회원가입</h4>
				<p class="text-center">DCULE 대구가톨릭대학교 강의평가 사이트에 오신것을 환영합니다.</p>
				<p class="divider-text">
					<span class="bg-light">&nbsp;</span>
				</p>
				<form:form cssClass="form-horizontal" modelAttribute="user"
					method="POST" action="/DCULE/user/join">
					<div class="control-group">
						<!-- userId -->
						<label class="control-label" for="userId">아이디</label>
						<div class="controls">
									<form:input path="userId" placeholder="아이디를 입력해주세요"
										class="form-control" />
									<p class="help-block" id="id_check"></p>
									<p class="help-block">
										<form:errors path="userId" cssClass="error" />
									</p>
									<button class="btn btn-primary"
										onclick="registerCheckFunction();" type="button">중복체크</button>
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
									<form:input path="userEmail" placeholder="이메일을 입력해주세요"
										class="form-control" />
									<p class="help-block">
										<form:errors path="userEmail" cssClass="error" />
									</p>
						</div>
					</div>
					<br>
					<div class="control-group">
						<!-- Button -->
						<div class="controls">
									<button type="submit" class="btn btn-primary btn-block">
										회원가입</button>
						</div>
					</div>
				</form:form>
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
	%>>
	</div>
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>