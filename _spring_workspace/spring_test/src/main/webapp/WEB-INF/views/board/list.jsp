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
	      <th scope="col">commentCount</th>
	      <th scope="col">fileCount</th>
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
	      <td>${bvo.commentCount }</td>
	      <td>${bvo.fileCount }</td>
	      <td>${bvo.writer }</td>
	      <td>${bvo.reg_date }</td>
	      <td>${bvo.read_count }</td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
	
	<!-- 페이지네이션 라인 -->
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  
	  	<!-- 이전 -->
	  	<c:if test="${ph.prev }">
		    <li class="page-item">
		      <a class="page-link" href="/board/list?pageNo=${ph.startPage - 1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>	  	
	  	</c:if>
	    
	    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
		    <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>    
	    </c:forEach>
	    
	    <!-- 다음 -->
	    <c:if test="${ph.next }">
		    <li class="page-item">
		      <a class="page-link" href="/board/list?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>	    
	    </c:if>
	    
	    
		<a class="page-link" href="/board/list">전체보기</a>	
	    
	  </ul>
	</nav>
<!-- 검색 라인 -->
<div>
	<form action="/board/list" method="get">
		<div class="input-group mb-3">
			<select name="type" class="form-select" id="search">
				<option ${ph.pgvo.type == null ? 'selected' : ''} >Choose...</option>
				<option value="t" ${ph.pgvo.type eq 't' ? 'selected' : ''}>Title</option>
				<option value="w" ${ph.pgvo.type eq 'w' ? 'selected' : ''}>Writer</option>
				<option value="c" ${ph.pgvo.type eq 'c' ? 'selected' : ''}>Content</option>
				<option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected' : ''}>Title&Content</option>
				<option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected' : ''}>Title&Writer</option>
				<option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected' : ''}>Writer&Content</option>
				<option value="twc" ${ph.pgvo.type eq 'twc' ? 'selected' : ''}>All</option>
			</select>
			<input type="search" class="form-control me-2" name="keyword" value="${ph.pgvo.keyword }" placeholder="Search...">
			<input type="hidden" name="pageNo" value="1">
			<input type="hidden" name="qty" value="10">
			
			<button type="submit" class="btn btn-primary position-relative">
		  	Search
		  	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
		    ${ph.totalCount }
		    <span class="visually-hidden">unread messages</span>
		  	</span>
		</button>
		</div>
	</form>
</div>
</div>

<script type="text/javascript">
	const isDel = `<c:out value="${isDel}" />`;
	
	if(isDel == 1){
		alert("게시글이 삭제되었습니다.");
	}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include> 