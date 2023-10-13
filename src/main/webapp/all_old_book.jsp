<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="AllComponents/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #a37599;
}
</style>
</head>
<body style="background-color: #f7f7d7;">
	<%@include file="AllComponents/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
				<%
			BooksDAOImpl dao3 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<h5><%=b.getBookName()%></h5>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
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
	</div>
</body>
</html>