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
<title>DCULE :: 강의평가 상세정보</title>
<!-- css, js link -->
<%@ include file="/WEB-INF/views/_header.jspf"%>
</head>
<body>
<!-- nav bar -->
<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-8 text-left" style="font-size : 15px;">
							<b><c:out value="${evaluation.lectureName}"/></b>&nbsp;<small><c:out value="${evaluation.professorName}"/></small>
						</div>
						<div class="col-4 text-right" style="font-size : 13px;">
							<c:out value="${evaluation.lectureYear}"/>년 <c:out value="${evaluation.semesterDivide}"/>
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
								
								</span><c:out value="${evaluation.userId}"/><small>님의 의견</small>
							</h5>
						</div>
						<div class="col-8 text-right" style="font-size : 13px;">
								<span class="fa-stack fa-lg"> 
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i> 
								</span><span style="color: blue; font-size: 17px;"><b><c:out value="${evaluation.likeCount}"/></b></span>  회 
								<span class="fa-stack fa-lg"> 
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-thumbs-down fa-stack-1x fa-inverse"></i> 
								</span><span style="color: red; font-size: 17px;"><b><c:out value="${evaluation.hateCount}"/> </b></span>  회					
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-left" style="font-size : 13px;">
							종합 <span style="color: red; font-size : 17px;"><b><c:out value="${evaluation.totalScore}"/></b>    </span> 
							조별과제 <span style="color: blue; font-size: 17px;"><b><c:out value="${evaluation.groupTask}"/></b>    </span>
							과제 <span style="color: green; font-size:17px;"><b><c:out value="${evaluation.homeworkCount}"/></b></span> 회   				
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-left" style="font-size : 13px;">
							교수강의력 <span style="color: red; font-size : 17px;"><b><c:out value="${evaluation.professorLectureAbility}"/></b></span>
							학점만족도 <span style="color: red; font-size : 17px;"><b><c:out value="${evaluation.gradeSatisfaction}"/></b>    </span>
							시험난이도 <span style="color: red; font-size : 17px;"><b><c:out value="${evaluation.examDifficulty}"/></b>    </span>		
						</div>
					</div>				
					<div class="row">
						<div class="col-12 text-left"><br>
							<h5 class="card-title"><c:out value="${evaluation.evaluationTitle}"/></h5>
							<p class="card-text target"><c:out value="${evaluation.evaluationContent}"/></p>
						</div>
					</div>
					<div class="row">
						<div class="col-2 text-left"></div>
						<div class="col-10 text-right">
							<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리  -->
							<c:if test="${sessionScope.userId == evaluation.userId}">
								<!-- <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#modifyModal">수정</a> -->  
								<a class="btn btn-primary mx-1 mt-2" href="/DCULE/evaluation/main/form">목록</a>
								<a class="btn btn-primary mx-1 mt-2" href="/DCULE/evaluation/edit/${evaluation.evaluationId}/form">수정</a> 
								<a class="btn btn-danger mx-1 mt-2" onclick="confirm('정말로 삭제하시겠습니까?');" href="/DCULE/evaluation/remove/${evaluation.evaluationId}">삭제</a>
							</c:if>
							<c:if test="${sessionScope.userId != evaluation.userId}">
								<a class="btn btn-primary mx-1 mt-2" href="/DCULE/evaluation/main/form">목록</a>
							</c:if>
						</div>
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
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>