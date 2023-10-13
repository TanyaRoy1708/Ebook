<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.DB.DBConnect"%>
	<%@page import ="com.dao.BookOrderDAOImpl" %>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">

		<thead class="bg-danger text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
		 	List <Book_Order> blist = dao.getAllOrders();
		 	for(Book_Order b:blist){%>
		 		<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAdd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
				

			</tr>
		 		
		 	<%}
		
		
		%>
					</tbody>
	</table>
	<div style="margin-top:280px">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>