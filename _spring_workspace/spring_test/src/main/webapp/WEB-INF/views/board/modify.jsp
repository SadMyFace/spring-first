<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Modify Page</h2>
<br>
<form action="/board/modify" method="post">


	<table class="table">
		<tr>
			<th>Bno</th>
			<td><input type="text" name="bno" class="form-control" id="bno" value="${bvo.bno }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type="text" name="title" class="form-control" id="title" value="${bvo.title }"></td>
		</tr>
		<tr>
			<th>Writer</th>
			<td><input type="text" name="writer" class="form-control" id="writer" value="${bvo.writer }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea name="content" class="form-control" id="content" rows="3">${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>Reg_date</th>
			<td><input type="text" name="reg_date" class="form-control" id="regdate" value="${bvo.reg_date }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td><input type="text" name="read_count" class="form-control" id="readcount" value="${bvo.read_count }" readonly="readonly"></td>
		</tr>
	</table>
	<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
	<button type="submit" class="btn btn-success">modify</button>
</form>
</div>

<jsp:include page="../layout/footer.jsp"></jsp:include> 