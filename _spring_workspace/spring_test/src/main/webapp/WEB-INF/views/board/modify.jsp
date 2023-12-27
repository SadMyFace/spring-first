<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include> 

<div class="container-md">
<br>
<h2>Modify Page</h2>
<br>
<c:set value="${boardDTO.bvo }" var="bvo" />
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
	
		<!-- 댓글 표시 라인 -->
	<c:set value="${boardDTO.flist }" var="flist" />
	<div>
		<ul class="list-group list-group-flush">
		<!-- 파일 개수만큼 li를 추가하여 파일을 표시, 타입이 1인 경우만 표시 -->
		<!-- 
			li -> div => img 그림 표시
				  div => 파일이름, 작성일, span size
		 -->
		<!-- 파일 리스트 중 하나만 가져와서 fvo로 저장 -->
		<c:forEach items="${flist }" var="fvo">	
			<li class="list-group-item">
				<c:choose>
					<c:when test="${fvo.file_type > 0 }">
						<div>
						<!-- /upload/save_dir/uuid_file_name -->
						<img alt="" src="/upload/${fn:replace(fvo.save_dir, '\\', '/') }/${fvo.uuid}_th_${fvo.file_name}">							
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<!-- 아이콘 같은 모양 하나 가져와서 넣기 -->
						</div>
					</c:otherwise>
				</c:choose>
				<div>
					<!-- div => 파일이름, 작성일, span size -->
					<div>${fvo.file_name }</div>
					${fvo.reg_date }
				</div>
				<span class="badge text-bg-warning">${fvo.file_size }Byte</span>
				<button type="button" data-uuid="${fvo.uuid }" class="file-x btn btn-danger">X</button>
			</li>
		</c:forEach>
		</ul>
	</div>
	
	<!-- 수정 파일 등록 라인 -->
	<!-- file 입력 라인 추가 -->
		<div class="mb-3">
		  <label for="file" class="form-label">fileUpload</label>                       
		  <input type="file" name="files" class="form-control" id="file" multiple="multiple" style="display:none">
		  <button type="button" class="btn btn-primary" id="trigger">FileUpload</button>
		</div>
		<!-- 파일 목록 표시라인 -->
		<div class="mb-3" id="fileZone">
			
		</div>
		
		<button type="submit" class="btn btn-primary" id="regBtn">Modify</button>
	<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<script src="/resources/js/boardModify.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include> 