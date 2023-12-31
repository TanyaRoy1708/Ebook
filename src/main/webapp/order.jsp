<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.dao.BookOrderDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Book</title>
<%@ include file="AllComponents/allCss.jsp"%>
</head>
<body style="background-color: #f7f7d7;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="AllComponents/navbar.jsp"%>
	<div class="container p-1">
	<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			<%
				User u = (User)session.getAttribute("userobj");
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
			List <Book_Order> blist = dao.getBook(u.getEmail());
			for(Book_Order b: blist){%>
				<tr>
					<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			<%}
			%>
				

			</tbody>
		</table>

	</div>
	</div>
</body>
</html>