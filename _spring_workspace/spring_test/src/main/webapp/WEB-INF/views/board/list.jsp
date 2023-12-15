<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include> 


<div class="container-md">
<br>
<h2>즐거운 이야기 게시판</h2>
<br>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">title</th>
	      <th scope="col">writer</th>
	      <th scope="col">reg_date</th>
	      <th scope="col">read_count</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${list }" var="bvo">
	    <tr>
	      <th scope="row">${bvo.bno }</th>
	      <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
	      <td>${bvo.writer }</td>
	      <td>${bvo.reg_date }</td>
	      <td>${bvo.read_count }</td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include> 