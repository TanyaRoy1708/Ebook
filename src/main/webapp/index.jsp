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
<title>Ebook : Index</title>
<%@include file="AllComponents/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/wp2036967-books-wallpapers.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #a37599;
}
</style>
</head>
<body style="background-color: #f7f7d7;">

<%User u=(User)session.getAttribute("userobj"); %>


	<%@include file="AllComponents/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BooksDAOImpl dao2 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao2.getRecentBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<h5><%=b.getBookName()%></h5>
						<h5><%=b.getAuthor()%></h5>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%if(u==null)
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a> 
						<%}else{%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a> 
						
							<%}%>
						
							
								
								
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								
								 <a href="" class="btn btn-danger btn-sm "><%=b.getPrice()%><i
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
		<div class="text-center mt-3">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white ">View All</a>
		</div>

	</div>
	<!--End Recent Book  -->
	<hr>
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao.getNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<h5><%=b.getBookName()%></h5>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%if(u==null)
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a> 
						<%}else{%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2 "><i
								class="fa-solid fa-cart-shopping "></i>Add Cart</a> 
						
							<%}%>
						
						
							
								
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> 
								
								<a href="" class="btn btn-danger btn-sm "><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white ">View All</a>
		</div>

	</div>
	<!-- End New Book -->
	<hr>
	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BooksDAOImpl dao3 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<h5><%=b.getBookName()%></h5>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<%@include file="AllComponents/footer.jsp"%>
</body>
</html>