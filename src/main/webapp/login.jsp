<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBOOk:Login</title>
<%@ include file="AllComponents/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7">
	<%@ include file="AllComponents/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body mt-2">
						<h3 class="text-center">Login</h3>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									placeholder="">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" placeholder="">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check" required="required"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary mb-2">
									Login</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 70px">
		<%@include file="AllComponents/footer.jsp"%>
	</div>

</body>
</html>