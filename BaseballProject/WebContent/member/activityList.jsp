<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>활동내역</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  <script>
	  
	  
  </script>
</head>
<body>

<%@ include file="/include/topnav.jsp" %>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav" style="background-color:white">
    </div>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->    
    <div class="col-sm-6 text-left"> 
      <h1>활동내역</h1>
      <ul class="nav nav-tabs">
      	<c:if test="${freeBoardList != null }">
      		<c:set var="freeBoardMenu" value="active" />
      	</c:if>
      	<c:if test="${freeCommentList != null }">
      		<c:set var="freeCommentMenu" value="active"/>
      	</c:if>
      	<c:if test="${photoList != null }">
      		<c:set var="photoBoardMenu" value="active"/>
      	</c:if>
      	<c:if test="${photoCommnetList != null }">
      		<c:set var="photoCommentMenu" value="active"/>
      	</c:if>
		<li role="presentation" class="${freeBoardMenu }"><a href="/view/member/activityList/${loginMember.member_id }/freeBoard">자유게시판</a></li>
		<li role="presentation" class="${freeCommentMenu }"><a href="/view/member/activityList/${loginMember.member_id }/freeComment">자유게시판 댓글</a></li>
		<li role="presentation" class="${photoBoardMenu }"><a href="javascript:goPhoto()">사진게시판</a></li>
		<li role="presentation" class="${photoCommentMenu }"><a href="javascript:goPhotoComment()">사진게시판 댓글</a></li>
	  </ul>
      <table class="table table-hover">
		    <thead>
		      <tr>
		         <tr>
			        <th width="5%" style="text-align:center">번호</th>
			        <c:if test="${freeBoardList != null || photoBoardList != null}" >
			        	<c:set var="headName" value="제 목"/>
			        </c:if>
			        <c:if test="${freeCommentList != null || photoCommentList != null}" >
			        	<c:set var="headName" value="내 용"/>
			        </c:if>				        
		        	<th width="60%" style="text-align:center" colspan="2">&nbsp;${headName }</th>
			        <th width="15%">&nbsp;작성일</th>
			        
			        <c:if test="${freeBoardList != null || photoBoardList != null}" >
			        	<th width="10%" style="text-align:center">조회수</th>
			        </c:if>
			      </tr>
		      </tr>
		    </thead>
		    <tbody>
			   <c:choose>
			   		<c:when test="${freeBoardList != null }"><!-- 자유게시판 내역 -->
				      <c:forEach items="${freeBoardList }" var="boardDetail">
					      <tr>
					        <td style="text-align:center">${boardDetail.board_id }</td>
					        <td width="10%"><!-- 빈칸 --></td>
					        <td><a href="/view/board/${boardDetail.board_id }?page=${pager.page}&pagesize=${pager.pageSize}"> ${boardDetail.title }</a></td>
					        <td><fmt:formatDate value="${boardDetail.regdate }" type="both" pattern="yyyy.MM.dd hh:mm:ss"/></td>
					        <td style="text-align:center">${boardDetail.hit }</td>
					      </tr>
				      </c:forEach>
			      	</c:when>
			   		<c:when test="${freeCommentList != null }"><!-- 자유게시판 댓글 내역 -->
			   		  <c:set var="commentNum" value="${pager.totalContents-(pager.startContent-1)  }"/>
				      <c:forEach items="${freeCommentList }" var="commentDetail">
					      <tr>
					        <td style="text-align:center">${commentNum }</td>
					        <td width="10%"><!-- 빈칸 --></td>
					        <td>${commentDetail.content }</td>
					        <td><fmt:formatDate value="${commentDetail.regdate }" type="both" pattern="yyyy.MM.dd hh:mm:ss"/></td>
					      </tr>
					      <c:set var="commentNum" value="${commentNum - 1 }"/>
				      </c:forEach>
			      	</c:when>
			   	</c:choose>
		    </tbody>
		  </table>
		  <!-----------------  페이징 ------------------------------------ -->
	  	<div align="center">
	  		<c:if test="${freeBoardList != null }">
	  			<c:set var="url" value="/view/member/activityList/${loginMember.member_id }/freeBoard?page="/>
	  		</c:if>
	  		<c:if test="${freeCommentList != null }">
	  			<c:set var="url" value="/view/member/activityList/${loginMember.member_id }/freeComment?page="/>
	  		</c:if>
		  	<nav>
			  <ul class="pagination">
			    <c:if test="${pager.prev }">
				    <li>
				      <a href="${url}${(pager.startPage-1)}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <c:forEach var="cnt" begin="${pager.startPage }" end="${pager.endPage }">
			    	<c:choose>
				    	<c:when test="${cnt == pager.page }">
				    		<c:set var="pageClass" value="active"/>
				    	</c:when>
				    	<c:otherwise>
				    		<c:set var="pageClass" value=""/>
				    	</c:otherwise>
			    	</c:choose>	
			    
			    	<li class="${pageClass }">
			    		<a href="${url}${cnt }">${cnt }</a>
			    	</li>
			    </c:forEach>
			    <c:if test="${pager.next }">
				    <li>
				      <a href="${url }${pager.endPage+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>
    </div>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->    
    <div class="col-sm-3 sidenav" style="background-color:white">
    </div>
  </div>
</div>

</body>
</html>
