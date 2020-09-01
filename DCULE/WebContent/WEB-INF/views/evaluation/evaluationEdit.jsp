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
<title>DCULE :: 강의평가 수정</title>
<!-- css, js link -->
<%@ include file="/WEB-INF/views/_header.jspf"%>
</head>
<body>
<!-- nav bar -->
<%@ include file="/WEB-INF/views/_top.jspf"%>
	<div class="container">
			<form:form modelAttribute="evaluation" method="post" action="/DCULE/evaluation/edit/${evaluation.evaluationId}">
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-7 text-left" style="font-size : 15px;">
							<form:hidden path="evaluationId"/>
							<b>강의명 : <form:input path="lectureName" placeholder="강의명을 입력해주세요" class="form-control"/></b>&nbsp;<br><small>교수명 : <form:input path="professorName" placeholder="교수명을 입력해주세요" class="form-control"/></small>
						</div>
						<div class="col-5 text-right" style="font-size : 13px;">
								<form:select path="lectureDivide">
									<form:option value="전공">전공</form:option>
									<form:option value="교양">교양</form:option>
									<form:option value="기타">기타</form:option>
								</form:select>
								<form:select path="lectureYear">
									<form:option value="2013">2013</form:option>
									<form:option value="2014">2014</form:option>
									<form:option value="2015">2015</form:option>
									<form:option value="2016">2016</form:option>
									<form:option value="2017">2017</form:option>
									<form:option value="2018">2018</form:option>
									<form:option value="2019">2019</form:option>
									<form:option value="2020">2020</form:option>
									<form:option value="2021">2021</form:option>
									<form:option value="2022">2022</form:option>
									<form:option value="2023">2023</form:option>
								</form:select>년
								<form:select path="semesterDivide">
									<form:option value="1학기">1학기</form:option>
									<form:option value="여름학기">여름학기</form:option>
									<form:option value="2학기">2학기</form:option>
									<form:option value="겨울학기">겨울학기</form:option>
								</form:select>
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
							종합 <span style="color: red; font-size : 17px;"><b>
							<form:select path="totalScore">
									<form:option value="A">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</b>    </span> 
							조별과제 <span style="color: blue; font-size: 17px;"><b>
							<form:select path="groupTask">
									<form:option value="O">O</form:option>
									<form:option value="X">X</form:option>
							</form:select>
							</b>    </span>
							과제 <span style="color: green; font-size:17px;"><b>
							<form:select path="homeworkCount">
									<form:option value="0">0</form:option>
									<form:option value="1">1</form:option>
									<form:option value="2">2</form:option>
									<form:option value="3">3</form:option>
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
							</b></span> 회   				
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-left" style="font-size : 13px;">
							교수강의력 <span style="color: red; font-size : 17px;"><b>
								<form:select path="professorLectureAbility">
									<form:option value="A">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>							
							</b></span>
							학점만족도 <span style="color: red; font-size : 17px;"><b>
								<form:select path="gradeSatisfaction">
									<form:option value="A">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</b>    </span>
							시험난이도 <span style="color: red; font-size : 17px;"><b>
								<form:select path="examDifficulty" >
									<form:option value="A">A</form:option>
									<form:option value="B">B</form:option>
									<form:option value="C">C</form:option>
									<form:option value="D">D</form:option>
									<form:option value="E">E</form:option>
									<form:option value="F">F</form:option>
								</form:select>
							</b>    </span>		
						</div>
					</div>				
					<div class="row">
						<div class="col-12 text-left"><br>
							<h5 class="card-title">강의평가 제목<br><form:input path="evaluationTitle" class="form-control"/></h5>
							<p class="card-text target"><form:textarea path="evaluationContent" class="form-control"/></p>
						</div>
					</div>
					<div class="row">
						<div class="col-2 text-left"></div>
						<div class="col-10 text-right">
							<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리  -->
							<c:if test="${sessionScope.userId == evaluation.userId}">
								<a class="btn btn-primary mx-1 mt-2" href="/DCULE/evaluation/main/form">목록</a>
								<button class="btn btn-primary mx-1 mt-2">수정</button> 
							</c:if>
							<c:if test="${sessionScope.userId != evaluation.userId}">
								<a class="btn btn-primary mx-1 mt-2" href="/DCULE/evaluation/main/form">목록</a>
							</c:if>
						</div>
					</div>				
				</div>
			</div>
			</form:form>				
	</div>
	<%@ include file="/WEB-INF/views/_footer.jspf"%>
</body>
</html>