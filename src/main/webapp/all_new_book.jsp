<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@include file="AllComponents/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #a37599;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body style="background-color: #f7f7d7;">
<%User u=(User)session.getAttribute("userobj"); %>
	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	<c:remove var="addCart" scope="session"/>
	</c:if>




	<%@include file="AllComponents/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao.getAllNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 190px" class="img-thumblin">
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
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b.getPrice()%><i
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
	<div style="margin-top: 280px">
		<%@include file="AllComponents/footer.jsp"%>
	</div>
	
</body>
</html>