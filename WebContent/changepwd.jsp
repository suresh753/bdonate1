<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String name=(String)session.getAttribute("user");  
%>
<html>
	<head>
		<title>Change Password</title>
		<script type="text/javascript">
			$(document).ready(function(){  
			    $('#myForm').on('submit',function(event){
			       event.preventDefault();
			       var flag = true;
			       var email = $("#email").val();
				   var old_pwd = $("#pwd").val();
				   var new_pwd = $("$new_pwd").val();
				   var re_pwd = $("$re_pwd").val();
				   if (email == null || email == "") {
				    	alert("Username must be entered");
				    	flag = false;
				   }
				   if (old_pwd == null || old_pwd == "") {
				        alert("Old password must be entered");
				        flag = false;
				   }
				   if (new_pwd == null || new_pwd == "") {
				        alert("New password must be entered");
				        flag = false;
				   }
				   if (re_pwd == null || re_pwd == "") {
				        alert("Re-type new password must be entered");
				        flag = false;
				   }
				   if (old_pwd == new_pwd) {
				    	alert("New password must be different from old password");
				        flag = false;
				   }
				   if (new_pwd != re_pwd) {
				    	alert("Password must match with re-type password");
				        flag = false;
				   }
				   if(flag==true){
					   data= {"email":email,"old_pwd":old_pwd,"new_pwd":new_pwd};
				       load_page_post("ChangePwdController","body",data); 
				   }
			    });  
			});
		</script>
		<style type="text/css">
			tr {
				background-color:#ffffff
			}
			td.tone {
				width: 80px;
				text-align : left;
			}
			td.ttwo {
				width:20px;
				height:30px;
				text-align : center;
			}
			td.tthree {
				width:120px;
				text-align : left;
			}
		</style>
		<!-- 
		onsubmit="return validateForm()"
		 -->
	</head>
	<body bgcolor="#ffffff">
		<div style="width:50%;margin-left:auto;margin-right:auto;box-shadow:0px 2px 2px grey;margin-top:5%;padding-bottom:10px;min-width:500px">
			<blockquote>
          		<p>Change Password<span class="icon-key"></span></p>
        	</blockquote>	
			<form class="form-horizontal" action="ChangePwdController" method="POST" id="myForm">
				<div class="control-group">
			    	<label class="control-label" for="inputEmail">Email</label>
			        <div class="controls">
			           <input type="email" placeholder="Email" id="email" required>
			        </div>
					</div>
					<div class="control-group">
					   <label class="control-label" for="inputPassword">Old Password</label>
					   <div class="controls">
					      <input type="password"  placeholder="Password" id="old_pwd" required>
					   </div>
					</div>
					<div class="control-group">
					   <label class="control-label" for="inputPassword">New Password</label>
					   <div class="controls">
					      <input type="password"  placeholder="Password" id="new_pwd" required>
					   </div>
					</div>
					<div class="control-group">
					   <label class="control-label" for="inputPassword">Retype Password</label>
					   <div class="controls">
					      <input type="password"  placeholder="Password" id="re_pwd" required>
					   </div>
					</div>
					<div class="control-group">
					   <div class="controls">
					      <button type="submit" class="btn">Update</button>
					   </div>
					</div>
			</form>
	</div>
	</body>
</html>