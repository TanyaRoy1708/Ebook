<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@include file="AllComponents/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #a37599;
}
</style>
</head>
<body style="background-color: #f7f7d7;">
<%User u=(User)session.getAttribute("userobj"); %>
	<%@include file="AllComponents/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BooksDAOImpl dao2 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao2.getAllRecentBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 190px" class="img-thumblin">
						<h5><%=b.getBookName()%></h5>
						<h5><%=b.getAuthor()%></h5>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a>

							<%
							}
							%>



							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>