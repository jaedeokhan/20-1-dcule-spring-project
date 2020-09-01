<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html>
<head>
<title>DCULE :: 강의평가</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/_header.jspf"%>
<style>
.target {
	display : inline-block;
	/*width : 350px;*/
	white-space : nowrap;
	overflow : hidden;
	text-overflow : ellipsis;
		
	white-space : normal;
	line-height : 1.2;
	height : 1.2em;
	text-align : left;
	word-wrap : break-word;
	display : -webkit-box;
	-webkit-line-clamp : 1;
	-webkit-box-orient : vertical;
}
</style>
<script>
	function loginCheck(){
		confirm('로그인 후 이용해주세요');
		location.href='/DCULE/user/login/form';
	}
/*  	function checkIdOverLapFunction(inputUserId, inputEvaluationId) {
		var userId = inputUserId;
		var evaluationId = inputEvaluationId;
		$.ajax({ 
			type : 'POST',
			url : './checkIdOverLap',
			data : {
				evaluationId : evaluationId,
				userId : userId
			},
			success : function(data) {
				if (data == 1) {  // Evaluation 목록 수정가능
					confirm('변경하시겠습니까?');
					$('#modify').attr('href', '#modifyModal');			
				}
			}
		});
	}  */
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> 
			<a class="btn btn-danger ml-1 mt-2"
				data-toggle="modal" href="#reportModal">신고</a>
		</form>
		<!-- 강의평가  형태 -->
		<c:choose>
			<c:when test="${empty evaluationList}" >
				<h4>존재하는 데이터가 없습니다.</h4>
			</c:when>
			<c:when test="${!empty evaluationList}">
					<c:forEach var="list" items="${evaluationList}">
					<input type="hidden" name="evaluationId" value="${list.evaluationId}" />
					<input type="hidden" name="userId" value="${sessionScope.userId}" />
					<div class="card bg-light mt-3">
						<div class="card-header bg-light">
							<div class="row">
								<div class="col-8 text-left" style="font-size : 15px;">
									<b><a href="/DCULE/evaluation/list/${list.evaluationId}"><c:out value="${list.lectureName}"/></a></b>&nbsp;<small><c:out value="${list.professorName}"/></small>
								</div>
								<div class="col-4 text-right" style="font-size : 13px;">
									<c:out value="${list.lectureYear}"/>년  <c:out value="${list.semesterDivide}"/>
								</div>
							</div>
						</div>
						<div class="card-body">
						   <div class="row">
							   <div class="col-4 text-left">
									<h5 class="card-title">
										<span class="fa-stack fa-lg"> <i
											class="fa fa-circle fa-stack-2x"></i> <i
											class="fa fa-user fa-stack-1x fa-inverse"></i>
										
										</span> <c:out value="${list.userId}"/><small>님의 의견</small>
									</h5>
								</div>
								<div class="col-8 text-right" style="font-size : 13px;">
										<span class="fa-stack fa-lg"> 
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i> 
										</span><span style="color: blue; font-size: 17px;"><b><c:out value="${list.likeCount}"/></b></span>  회 
										<span class="fa-stack fa-lg"> 
											<i class="fa fa-circle fa-stack-2x"></i>
											<i class="fa fa-thumbs-down fa-stack-1x fa-inverse"></i> 
										</span><span style="color: red; font-size: 17px;"><b><c:out value="${list.hateCount}"/></b></span>  회					
								</div>
							</div>	
							<div class="row">
								<div class="col-12 text-left"><br>
									<h5 class="card-title"><c:out value="${list.evaluationTitle}"/></h5>
									<p class="card-text target"><c:out value="${list.evaluationContent}"/></p>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:when>
		</c:choose>
	</div>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item"><a href="#">이전</a></li>
		<li class="page-item"><a class="page-link" href="#">다음</a></li>
	</ul>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form modelAttribute="evaluation" method="POST"
						action="/DCULE/evaluation/regist">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<form:hidden path="userId" value="${sessionScope.userId}"/>
								<form:input path="lectureName" placeholder="강의명을 입력해주세요"
									class="form-control" />
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<form:input path="professorName" placeholder="교수명을 입력해주세요"
									class="form-control" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강 연도</label>
								<form:select path="lectureYear" class="form-control">
									<form:option value="2013">2013</form:option>
									<form:option value="2014">2014</form:option>
									<form:option value="2015">2015</form:option>
									<form:option value="2016">2016</form:option>
									<form:option value="2017">2017</form:option>
									<form:option value="2018">2018</form:option>
									<form:option value="2019">2019</form:option>
									<form:option value="2020" selected="selected">2020</form:option>
									<form:option value="2021">2021</form:option>
									<form:option value="2022">2022</form:option>
									<form:option value="2023">2023</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강 학기</label>
								<form:select path="semesterDivide" class="form-control">
									<form:option value="1학기">1학기</form:option>
									<form:option value="여름학기">여름학기</form:option>
									<form:option value="2학기" selected="selected">2학기</form:option>
									<form:option value="겨울학기">겨울학기</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>강의 구분</label>
								<form:select path="lectureDivide" class="form-control">
									<form:option value="전공" selected="selected">전공</form:option>
									<form:option value="교양">교양</form:option>
									<form:option value="기타">기타</form:option>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<form:input path="evaluationTitle" placeholder="강의평가 제목을 입력해주세요"
								class="form-control" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<form:textarea path="evaluationContent"
								placeholder="강의평가 내용을 입력해주세요" class="form-control"
								style="height : 180px;" />
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>종합</label>
								<form:select path="totalScore" class="form-control"
									placeholder="A ~ F">
									<form:option value="A" selected="selected">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>과제횟수</label>
								<form:select path="homeworkCount" class="form-control"
									placeholder="0 ~ 15">
									<form:option value="0">0</form:option>
									<form:option value="1">1</form:option>
									<form:option value="2">2</form:option>
									<form:option value="3" selected="selected">3</form:option>
									<form:option value="4">4</form:option>
									<form:option value="5">5</form:option>
									<form:option value="6">7</form:option>
									<form:option value="7">7</form:option>
									<form:option value="8">8</form:option>
									<form:option value="9">9</form:option>
									<form:option value="10">10</form:option>
									<form:option value="11">11</form:option>
									<form:option value="12">12</form:option>
									<form:option value="13">13</form:option>
									<form:option value="14">14</form:option>
									<form:option value="15">15</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>조별과제</label>
								<form:select path="groupTask" class="form-control"
									placeholder="O , X">
									<form:option value="O" selected="selected">O</form:option>
									<form:option value="X">X</form:option>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>교수강의력</label>
								<form:select path="professorLectureAbility" class="form-control"
									placeholder="A ~ F">
									<form:option value="A" selected="selected">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>학점만족도</label>
								<form:select path="gradeSatisfaction" class="form-control"
									placeholder="A ~ F">
									<form:option value="A" selected="selected">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</div>
							<div class="form-group col-sm-4">
								<label>시험난이도</label>
								<form:select path="examDifficulty" class="form-control"
									placeholder="A ~ F">
									<form:option value="A" selected="selected">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form method="post" action="./reportAction.jsp">
						<div class="form-group">
							<label>신고 제목</label> <input type="text" name="reportTitle"
								class="form-control" maxlength="20">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea type="text" name="reportContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
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
					class="modal-content panel <%if (messageType.equals("오류 메시지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<h4 class="modal-title" style="text-align: center;">
							<%=messageType%>
						</h4>
						<button type="button" class="close btn pull-right"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
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
	<%
		String removeContent = null;
		if (session.getAttribute("removeContent") != null) {
			removeContent = (String) session.getAttribute("removeContent");
		}
		String removeType = null;
		if (session.getAttribute("removeType") != null) {
			removeType = (String) session.getAttribute("removeType");
		}
		if (removeContent != null) { /* messageContent가 존재 */
	%>
	<!-- regist 후 panel-waring or panel-success 구분 -->
	<div class="modal fade" id="removeMessageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-alignment-center">
				<div
					class="modal-content panel <%if (removeType.equals("오류 메시지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<h4 class="modal-title" style="text-align: center;">
							<%=removeType%>
						</h4>
						<button type="button" class="close btn pull-right"
							data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<%=removeContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#removeMessageModal').modal("show");
	</script>
	<%
			session.removeAttribute("removeContent");
			session.removeAttribute("removeType");
		}
	%>
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>