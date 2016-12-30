<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.practise.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<style type="text/css">
.sorted_column {
	background-color: white;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="float: right;">
			<button class="btn btn-primary logout_btn">
				<strong>Log Out</strong>
			</button>
		</div>
		<div class="row">
			<br>
			<div class="row well">
				<h4>Current User:</h4>
				<div class="col-md-12">
					<p>
						Username:<%
						out.print((String) session.getAttribute("username"));
					%>
					</p>
					<p>
						First Name:<%
						out.print((String) session.getAttribute("firstname"));
					%>
					</p>
					<p>
						Last Name:<%
						out.print((String) session.getAttribute("lastname"));
					%>
					</p>
					<p>
						Age:<%
						out.print((String) session.getAttribute("age"));
					%>
					</p>
					<p>
						Mobile:<%
						out.print((String) session.getAttribute("mobile"));
					%>
					</p>
					<p>
						Email:<%
						out.print((String) session.getAttribute("email"));
					%>
					</p>
					<p>
						Address:<%
						out.print((String) session.getAttribute("address"));
					%>
					</p>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="dropdown col-md-6">
					<strong>Filter By:&nbsp;</strong>
					<button class="btn btn-primary dropdown-toggle filter_select_btn" type="button"
						data-toggle="dropdown">
						Select Filter<span class="caret"></span>
					</button>
					<ul class="dropdown-menu filter_list">
						<li><a href="#">First Name</a></li>
						<li><a href="#">Last Name</a></li>
						<li><a href="#">Email</a></li>
						<li><a href="#">Mobile</a></li>
						<li><a href="#">Clear Filters</a></li>
					</ul>
				</div>

				<!-- <div class="dropdown col-md-6">
					<strong>Sort By:&nbsp;</strong>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						Sort By<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">First Name</a></li>
						<li><a href="#">Last Name</a></li>
						<li><a href="#">Age</a></li>
					</ul>
				</div> -->
			</div>
			<br>
			<div class="filter_form row hide">
				<input type="text" placeholder="Keyword"
					class=" filter_keyword col-md-6"
					style="margin-right: 15px; padding: 5px;">&nbsp;
				<button class="btn-primary filter_btn col-md-3"
					style="padding: 5px;">Filter</button>
			</div>
			<br>

			<div class="row">
				<h3>Users List</h3>

				<table class="table table-striped table-hover"
					style="margin-top: 15px;">
					<tr class="thead-inverse">
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Age</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Address</th>
						<th>Actions</th>
					</tr>


					<%
						ArrayList<User> list = (ArrayList<User>) request.getAttribute("userlist");

						for (User user : list) {
							out.println("<tr><td>" + user.getUsername() + "</td><td>" + user.getFirstname() + "</td><td>"
									+ user.getLastname() + "</td><td>" + user.getAge() + "</td><td>" + user.getEmail() + "</td><td>"
									+ user.getMobile() + "</td><td>" + user.getAddress()
									+ "</td><td><button class='btn-primary edit_btn hide'>Edit</button>&nbsp;<button class='btn-danger delete_btn'>Delete</button></td></tr>");
						}
					%>

				</table>
				<br>

				<h4>User Management</h4>
				<br>
				<div class="form_div well hide">
					<input class="username form-control" placeholder="UserName"><br>
					<input class="password form-control" placeholder="Password"><br>
					<input class="firstname form-control" placeholder="First Name"><br>
					<input class="lastname form-control" placeholder="Last Name"><br>
					<input class="age form-control" placeholder="Age"> <br>
					<input class="mobile form-control" placeholder="Mobile"> <br>
					<input class="email form-control" placeholder="Email"> <br>
					<input class="address form-control" placeholder="Address">
					<br>
					<button class="saveRow form-control btn-primary">Create
						User</button>
				</div>
				<br>

				<div class="row_actions row">
					<div class="form-group col-md-6 coll-md-offset-3">
						<button class="addRow form-control btn btn-success">Add
							User</button>
					</div>
					<!-- <div class="form-group col-md-6">
						<button class="removeRow form-control btn btn-danger">Delete
							User</button>
					</div> -->


				</div>



			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//write filters
	
	$('.filter_list li').click(function(){
		
		var filter=$(this).children('a').text();
		if(filter=="Clear Filters"){
			$('.filter_form').addClass('hide');
			$('.filter_form').attr("title", filter);
			$('.filter_select_btn').html(filter+'<span class="caret"></span>');
			$("tbody tr").show();
			}
		else{
			$('.filter_form').removeClass('hide');
			$('.filter_form').attr("title", filter);
			$('.filter_select_btn').html(filter+'<span class="caret"></span>');
			}
		
		
		});
	
	$('.filter_btn').click(function(event){
		var filter_key=$('.filter_keyword').val();
		var filter_type=-1;
		switch ($('.filter_form').attr('title')) {
		case "First Name":
			filter_type=2;
			break;
		case "Last Name":
			filter_type=3;
			break;
		case "Email":
			filter_type=5;
			break;
		case "Mobile":
			filter_type=6;
			break;
		case "Clear Filters":
			filter_type=-1;
			break;
		default:
			filter_type=-1;
			break;
		}
		$("tbody tr").show();
		$("tbody tr:not(:first-child)").each(function(index) {
			  if(filter_type<=0){
				  $('.filter_form').addClass('hide');
				  $("tbody tr").show();
				  }
			  else{
				  $('.filter_form').addClass('hide');
				  if($( this ).children('td:nth-child('+filter_type+')').text()!=filter_key){
					  $( this ).hide();
					  }
				  
				  }
			  
			  
			});
		});
	

	
	$('table > tbody > tr > th')
			.click(
					function() {
						var index = $('th').index(this);
						sortTable(index);
						$('table tr td').removeClass('sorted_column');
						$(
								'table tr td:nth-child(' + (index + 1)
										+ '):not(:last-child)').addClass(
								'sorted_column');
					});

	function sortTable(index) {
		var rows = $('table tbody tr:not(:first-child)').get();

		rows.sort(function(a, b) {
			var A = $(a).children('td').eq(index).text().toUpperCase();
			var B = $(b).children('td').eq(index).text().toUpperCase();

			if (A < B) {
				return -1;
			}

			if (A > B) {
				return 1;
			}

			return 0;

		});

		$.each(rows, function(index, row) {
			$('table').children('tbody').append(row);
		});

	}

	$('.addRow').click(function() {
		$('.form_div').removeClass("hide");
		$('.form_div').slideDown();
	});

	$('.saveRow')
			.click(
					function() {

						$
								.ajax({
									url : 'http://127.0.0.1:7811/HelloWorld/SaveUser?username='
											+ $('.username').val()
											+ '&firstname='
											+ $('.firstname').val()
											+ '&lastname='
											+ $('.lastname').val()
											+ '&password='
											+ $('.password').val()
											+ '&age='
											+ $('.age').val()
											+ '&mobile='
											+ $('.mobile').val()
											+ '&email='
											+ $('.email').val()
											+ '&address='
											+ $('.address').val(),
									error : function() {
										console.log("error");
									},
									success : function(data) {
										console.log(data);
										$('.form_div').hide();
										$('table > tbody')
												.append(
														'<tr><td>'
																+ $('.username')
																		.val()
																+ '</td><td>'
																+ $(
																		'.firstname')
																		.val()
																+ '</td><td>'
																+ $('.lastname')
																		.val()
																+ '</td><td>'
																+ $('.age')
																		.val()
																+ '</td><td>'
																+ $('.mobile')
																		.val()
																+ '</td><td>'
																+ $('.email')
																		.val()
																+ '</td><td>'
																+ $('.address')
																		.val()
																+ '</td><td><button class="btn-primary edit_btn">Edit</button>&nbsp;<button class="btn-danger delete_btn">Delete</button></td></tr>');

									},
									type : 'GET'
								});
					});

	$('.delete_btn').click(
			function() {

				var root=$(this);
				$.ajax({
					url : 'http://127.0.0.1:7811/HelloWorld/SaveUser?username='
							+ root.parents("tr").find('td:first-child')
									.text(),

					error : function() {
						console.log("error");
					},
					success : function(data) {
						console.log("success");
						root.parents("tr").addClass('hide');
						root.parents("tr").remove();
					},
					type : 'DELETE'
				});

			});

	$('.logout_btn').click(function() {

		$.ajax({
			url : 'http://127.0.0.1:7811/HelloWorld/SaveUser?action=logout',

			error : function() {
				console.log("error");
			},
			success : function(data) {
				console.log("success");
				window.location.replace("/HelloWorld");
			},
			type : 'PUT'
		});

	});
</script>
</html>