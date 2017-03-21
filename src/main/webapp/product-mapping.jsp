<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Product Mapping | List</title>

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
					<li class="active"><a><i class="fa fa-wrench"></i> <span
							class="nav-label">Settings</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="product?type=getAll">Products</a></li>
							<li><a href="scale?type=getAll">Scales</a></li>
							<li class="active"><a href="product-mapping?type=getAll">Product
									Mapping</a></li>
						</ul></li>
					<li><a href="report"><i class="fa fa-file-excel-o"></i> <span
							class="nav-label">Report</span></a></li>
				</ul>

			</div>
		</nav>
		<!-- <jsp:include page="layout/navigator.jsp" /> -->
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
								<h5>Product Mapping List</h5>
								<div class="ibox-tools">
									<a class="btn btn-primary" onclick="newRow();"> <i
										class="fa fa-fw fa-plus"></i>New Mapping
									</a>
								</div>
							</div>
							<div class="ibox-content">

								<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-hover dataTables">
										<thead>
											<tr>
												<th>Code</th>
												<th>Product Name</th>
												<th>Scale</th>
												<th>Dependancy</th>
												<th>Price</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row" items="${rows}">
												<tr>
													<td>${row.getCode() }</td>
													<td>${row.getProductName() }</td>
													<td>${row.getScaleType() }</td>
													<td>= ${row.getScaleQuantity() }
														${row.getDependancyType() }</td>
													<td>${row.getScalePrice() }</td>
													<td><a style="color: green;"
														onclick="editRow(${row.getProductMappingID() })"><i
															class="fa fa-edit fa-fw"></i>Edit</a> | <a
														style="color: red;"
														onclick="deleteRow(${row.getProductMappingID() })"> <i
															class="fa fa-trash fa-fw"></i>Delete
													</a></td>
												</tr>

											</c:forEach>
										</tbody>

									</table>
								</div>

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
	<div class="modal fade" id="form-mapping" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Product Mapping</h4>
				</div>
				<div id="message-body" class="modal-body">
					<div class="ibox float-e-margins">

						<div class="ibox-content">
							<form id="form" method="POST" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">Code</label>
									<div class="col-sm-10">
										<input id="code" type="text" name="code" class="form-control"
											placeholder="Code" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Product</label>
									<div class="col-sm-10">
										<select id="product" class="form-control" required
											name="product-id">
											<option class="product-id" value="">--Select
												Product--</option>
											<c:forEach var="product" items="${products}">
												<option class="product-id" value="${product.getProductID()}">${product.getProductName()}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Scale</label>
									<div class="col-sm-10">
										<select id="scale" class="form-control" required
											name="scale-id">
											<option class="scale-id" value="">--Select Scale--</option>
											<c:forEach var="scale" items="${scales}">
												<option class="scale-id" value="${scale.getscaleID()}">${scale.getScaleType()}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Dependancy</label>
									<div class="col-sm-10">
										<select id="dependancy" class="form-control"
											name="map-dependancy-id">
											<option class="depedancy-id" value="">--Select
												Dependancy--</option>
											<c:forEach var="scale" items="${scales}">
												<option class="depedancy-id" value="${scale.getscaleID()}">${scale.getScaleType()}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Scale Quantity</label>
									<div class="col-sm-10">
										<input id="quantity" type="text" name="quantity"
											class="form-control" placeholder="Scale Quantity" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Price</label>
									<div class="col-sm-10">
										<input id="price" type="text" name="price"
											class="form-control" placeholder="Scale Price" required>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<div class="col-sm-12">
										<button class="btn btn-white pull-right" data-dismiss="modal"
											type="reset">Cancel</button>
										<button onclick="update()" class="btn btn-primary pull-right"
											style="margin-right: 10px;" type="submit">Save
											changes</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
	
	var product,scale,dependency;
    var editRow = function(id){
        $.ajax({
        	url:"product-mapping",
        	data:{id:id,type:"get"},
        	type:"GET",
        	success:function(data){
        		data = JSON.parse(data);
        		$("#code").val(data.code);
        		product = $(".product-id");
                for (i = 0; i < product.length; i++){
                	if (data.productID === null){
                		$(product[0]).prop("selected", true);
                		break;
                	}
                	if (data.productID == $(product[i]).val()){
                		$(product[i]).prop("selected", true);
                		break;
                	}
                }
                scale = $(".scale-id");
                for (i = 0; i < product.length; i++){
                	if (data.scaleID === null){
                		$(scale[0]).prop("selected", true);
                		break;
                	}
                	if (data.scaleID == $(scale[i]).val()){
                		$(scale[i]).prop("selected", true);
                		break;
                	}
                }
                dependency = $(".depedancy-id");
                for (i = 0; i < dependency.length; i++){
                	if (data.mapdependancyID === null){
                		$(dependency[0]).prop("selected", true);
                		break;
                	}
                	if (data.mapdependancyID == $(scale[i]).val()){
                		$(dependency[i]).prop("selected", true);
                		break;
                	}
                }
                $("#quantity").val(data.scaleQuantity);
                $("#price").val(data.scalePrice);
        		$("#form").attr("method", "POST");
        		$("#form").attr("action", "product-mapping?type=edit&id="+id);
        		$("#form-mapping").modal("show");
        	}
        });
         
        };
    	var newRow = function(){
    		$("#code").val("");
    		product = $(".product-id");
    		$(product[0]).prop("selected", true);
            scale = $(".scale-id");
            $(scale[0]).prop("selected", true);
            dependency = $(".depedancy-id");
            $(dependency[0]).prop("selected", true);
            $("#quantity").val("");
            $("#price").val("");
    		$("#form").attr("method", "POST");
    		$("#form").attr("action", "product-mapping?type=add");
    		$("#form-mapping").modal("show");
    	};
    	var deleteRow = function(id){
    		$.ajax({
    			url:"product-mapping",
    			data:{id:id,type:"delete"},
    			type:"POST",
    			success:function(){
    				alert("Update successfully!");
    				location.reload();
    			},
    			error:function(){
    				alert("Fail to update");
    			}
    		});
    	};
    	var update = function(){
    		$("#form").ajaxForm({
    			success:function(){
    				alert("Update successfully!");
    				location.reload();
    			},
    			error:function(){
    				alert("Fail to update");
    			}
    		});
    	}
	
	
$(document).ready(function(){
    $('.dataTables').DataTable({
        pageLength: 10,
        responsive: true,
        dom: '<"html5buttons"B>lTfgitp',
        buttons: [
            {extend: 'excel', title: 'Scale'},
            {extend: 'pdf', title: 'Scale'},
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
