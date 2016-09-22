<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="//cdn.ckeditor.com/4.5.9/standard/ckeditor.js"></script>
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
		function regist(){
			// 제목 입력여부 확인
			if(writeForm.title.value.trim().length < 1){
				alert("제목을 입력해주세요.");
				writeForm.title.focus();
				return;			
			}
			
			writeForm.action="/view/notice";
			writeForm.method="POST";
			writeForm.submit();
		}
		
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
	      <h1>공지사항 작성</h1>
	      <br>
	      	<form name="writeForm">
			    <div class="form-group">
			    	<label for="writer" class="control-label">작성자 : </label>
		      		<input type="text" class="form-control" id="writer" value="${loginMember.nickname }" name="writer" readonly>
				</div>
			    <div class="form-group">
				    <label for="title" class="control-label">제 목 :</label>
		      		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요.">
				</div>
				<div class="form-group">
			    	<textarea id="content" class="form-control" name="content"></textarea>
			    </div>
			    <script>
	                // Replace the <textarea id="editor1"> with a CKEditor
	                // instance, using default configuration.
	                CKEDITOR.replace( 'content' );
            	</script>
			</form>
	      	<div class="form-group" align="right">
			  <input type="button" class="btn btn-primary" value="등록" onClick="regist()">
			  <input type="button" class="btn btn-danger" value="취소" onClick="history.back()">
			</div>
	    </div>
	<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->    
	    <div class="col-sm-3 sidenav" style="background-color:white">
	    </div>
	  </div>
	</div>

</body>
</html>
