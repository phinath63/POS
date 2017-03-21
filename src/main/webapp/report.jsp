<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Product | List</title>

<link rel="stylesheet" href="/css/vendor.css" />
<link rel="stylesheet" href="/css/app.css" />
<link rel="stylesheet" href="/font-awesome/css/font-awesome.css" />
<link href="/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
<link href="/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">

					<li><a href="sale?type=sale"><i
							class="fa fa-buysellads"></i> <span class="nav-label">Sale</span></a></li>
					<li><a><i class="fa fa-wrench"></i> <span
							class="nav-label">Settings</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="product?type=getAll">Products</a></li>
							<li><a href="scale?type=getAll">Scales</a></li>
							<li><a href="product-mapping?type=getAll">Product
									Mapping</a></li>
						</ul></li>
					<li class="active"><a href="report"><i class="fa fa-file-excel-o"></i> <span
							class="nav-label">Report</span></a></li>
				</ul>

			</div>
		</nav>
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top white-bg" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li><a href="#"> <i class="fa fa-sign-out"></i> Log out
						</a></li>
					</ul>

				</nav>
			</div>
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Report</h5>
							</div>
							<div class="ibox-content">


							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="pull-right"></div>
				<div>
					<strong>Copyright</strong> RUPP Evening &copy; 2016-2019
				</div>
			</div>

		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="/js/app.js" type="text/javascript"></script>
	<script src="/js/plugins/dataTables/datatables.min.js"></script>
	<script src="/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="/js/plugins/jquery-form.js"></script>

	<script>

	
	
$(document).ready(function(){
    $('.dataTables').DataTable({
        pageLength: 10,
        responsive: true,
        dom: '<"html5buttons"B>lTfgitp',
        buttons: [
            {extend: 'excel', title: 'Product List'},
            {extend: 'pdf', title: 'Product List'},
            {extend: 'print',
                customize: function (win) {
                    consol.log('')
                    $(win.document.body).addClass('white-bg');
                    $(win.document.body).css('font-size', '10px');

                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                }
            }
        ]

    });
});

</script>
</body>

</html>
