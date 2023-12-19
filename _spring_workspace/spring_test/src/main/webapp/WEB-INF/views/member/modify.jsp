<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
	<h2>Member Modify Page</h2> <br>
</div>
	<div class="container-sm">
		<form action="/member/modify" method="post">
			<table class="table">
			  <tbody>
			    <tr>
				  <input type="hidden" name="id" value="${ses.id }">
			      <th>ID</th>
			      <td>${ses.id }</td>
			    </tr>
			    <tr>
			      <th>Password</th>
			      <td><input type="text" name="pw" class="form-control" id="pw" placeholder="변경할 password..."></td>
			    </tr>
			    <tr>
			      <th>Name</th>
			      <td><input type="text" name="name" class="form-control" value="${ses.name }"></td>
			    </tr>
			    <tr>
			      <th>Email</th>
			      <td><input type="text" name="email" class="form-control" value="${ses.email }"></td>
			    </tr>
			    <tr>
			      <th>Home</th>
			      <td><input type="text" name="home" class="form-control" value="${ses.home }"></td>
			    </tr>
			    <tr>
			      <th>Age</th>
			      <td><input type="text" name="age" class="form-control" value="${ses.age }"></td>
			    </tr>
			  </tbody>
			</table>
			<button type="submit" class="btn btn-primary">modify</button>
			<a href="/member/delete?id=${ses.id }"><button type="button" class="btn btn-danger">Delete</button></a>
		</form>
	</div>
	
	
	<%-- <form action="/member/modify" method="post">
		<div class="mb-3">
	  		<label for="id" class="form-label">Id</label>
	  		<input type="text" name="id" class="form-control" id="id" placeholder="${ses.id }" value="${ses.id }" readonly="readonly">
		</div>
		<div class="mb-3">
	  		<label for="pw" class="form-label">Password</label>
	  		<input type="password" name="pw" class="form-control" id="pw" placeholder="pw" value="${ses.pw }">
		</div>
		<div class="mb-3">
	  		<label for="name" class="form-label">Name</label>
	  		<input type="text" name="name" class="form-control" id="name" placeholder="Name" value="${ses.name }">
		</div>
		<div class="mb-3">
	  		<label for="email" class="form-label">Email</label>
	  		<input type="email" name="email" class="form-control" id="email" placeholder="Email" value="${ses.email }">
		</div>
		<div class="mb-3">
	  		<label for="home" class="form-label">Home</label>
	  		<input type="text" name="home" class="form-control" id="home" placeholder="Home" value="${ses.home }">
		</div>
		<div class="mb-3">
	  		<label for="age" class="form-label">Age</label>
	  		<input type="text" name="age" class="form-control" id="age" placeholder="Age" value="${ses.age }">
		</div>
		<button type="submit" class="btn btn-primary">modify</button>
	</form> --%>

<jsp:include page="../layout/footer.jsp"></jsp:include> 