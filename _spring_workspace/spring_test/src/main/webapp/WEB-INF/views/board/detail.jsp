<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Detail Page</h2>
<br>
	<table class="table">
		<tr>
			<th>Bno</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>Writer</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>Reg_date</th>
			<td>${bvo.reg_date }</td>
		</tr>
		<tr>
			<th>Read_count</th>
			<td>${bvo.read_count }</td>
		</tr>
	</table>
	<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
	<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">modify</button></a>
	<a href="/board/remove?bno=${bvo.bno }"><button type="button" class="btn btn-danger">delete</button></a>
	
	<!-- 댓글 등록 라인 -->
	<div class="input-group mb-3">
		<span id="cmtWriter" class="input-group-text">${ses.id }</span>
		<input type="text" id="cmtText" class="form-control" placeholder="Add Comment...">
		<button type="button" id="cmtAddBtn" class="btn btn-outline-secondary">댓글 등록</button>
	</div>
	
	<!-- 댓글 표시 라인 -->
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	        cno, writer, reg_date
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        <strong>Add Comment...</strong>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
</div>
<br>
<script type="text/javascript">
	const bnoVal = `<c:out value="${bvo.bno}"/>`;
</script>

<script src="../resources/js/boardComment.js"></script>

<script type="text/javascript">
	spreadCommentListFromServer(bnoVal);
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include> 