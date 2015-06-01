<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register</title>
<link rel="stylesheet" href="/resources/themes/master.css" type="text/css" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<style>
.registerError {
	color: red;
}
</style>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<script	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"	type="text/javascript"></script>
<script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
<script src="/resources/scripts/date.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
 jQuery.validator.setDefaults({
  errorPlacement: function(error, element) {
      error.appendTo(element.parent().find('div.registerError'));
     }
 });
 

 $("#register").validate({
   rules: {
    userName: {
    	required: true,
    	minlength: 5
    },
    email: {
        required: true,
        email: true
      },
    password: {
        required: true,
        pwCheck: true,
        minlength: 8
      }, 
  },
 messages: {
	 username:{
          required: "Please select valid User name"
          },
     password:{
             required: "Please provide a valid email",
             pwCheck: "Password didn't meet required criteria"
             },
     email:{
             required: "Please enter password"
            },
        },
 

 });
  
   $.validator.addMethod("pwCheck", function(value, element) {
	   return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value)
	       && /[a-z]/.test(value)
	       && /[A-Z]/.test(value)
	       && /\d/.test(value)
	});
});
</script>
</head>
<body>
		<div id="registerUser">
			<form:form id="register" name="register" method="POST" modelAttribute="user">
				<h2>User Registration</h2>
				<h4><font color="red"><b>${result}</b></font></h4>
					<table>
						<tr>
							<td valign="top"><label for="userName">User Name</label></td>
							<td><form:input path="userName" size="50"/>
								<div class="registerError"></div></td>
						</tr>
						<tr>
							<td valign="top"><label for="email"> Email</label></td>
							<td><form:input path="email" size="50"/>
								<div class="registerError"></div></td>
						</tr>
						<tr>
							<td valign="top"><label for="password">Password</label></td>
							<td><form:input path="password" type="password" size="50"/>
								<div class="registerError"></div></td>
						</tr>

						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input id="submitUser" type="submit" value="Register" /></td>
						</tr>
					</table>
			</form:form>
		</div>
</body>
</html>