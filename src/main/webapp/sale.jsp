<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Sale</title>

<link rel="stylesheet" href="/css/vendor.css" />
<link rel="stylesheet" href="/css/app.css" />
<link rel="stylesheet" href="/font-awesome/css/font-awesome.css" />
<script src="/js/plugins/angular-1.6.3.js"></script>

</head>

<body ng-app="sale" ng-controller="saleController">

	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="active"><a href="sale?type=sale"><i
							class="fa fa-buysellads"></i> <span class="nav-label">Sale</span></a></li>
					<li><a><i class="fa fa-wrench"></i> <span
							class="nav-label">Settings</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="product?type=getAll">Products</a></li>
							<li><a href="scale?type=getAll">Scales</a></li>
							<li><a href="product-mapping?type=getAll">Product
									Mapping</a></li>
						</ul></li>
					<li><a href="report"><i class="fa fa-file-excel-o"></i> <span
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
								<form id="form" method="POST" action="sale">
									<input type="text" name="type" value="add" hidden>
									<table
										class="table table-striped table-bordered table-hover dataTables">
										<thead>
											<tr>
												<th>Code</th>
												<th>Product</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Sub Total</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="item in items">
												<td><input type="text" name="product-mapping-id" value="{{item.productMappingID}}" hidden>{{item.code}}</td>
												<td>{{item.name}}</td>
												<td><input type="text" name="price" value="{{item.price}}" hidden>{{item.price}}</td>
												<td><input type="text" name="qty" ng-model="item.qty"></td>
												<td>{{item.price*item.qty}}
													<button class="pull-right" ng-click="removeItem($index)">
														<i class="fa fa-trash" style="color: red;"></i>
													</button>
												</td>
											</tr>
											<tr>
												<!-- <td>
											<select class="form-control" ng-model="product"
												ng-change="addNewItem()">
													<option value="">--select-product</option>
													<c:forEach var="product" items="${products}">
														<option value="${product.getProductMappingID()}">${product.getCode()}</option>
													</c:forEach>
											</select>
											</td> -->
												<td><input type="text" pattern="[1-9]{1}[0-9]*"
													ng-model="product" on-enter="addNewItem()"></td>
												<td></td>
												<td></td>
												<td><b>Total</b></td>
												<td><b style="color: blue;">{{getTotal()}}</b></td>
											</tr>
										</tbody>
									</table>
									<button class="btn btn-primary pull-right" ng-click="save()">Submit</button>
								</form>
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
	<script src="/js/plugins/jquery-form.js"></script>


	<script>
		var save = function() {
			$("#form").ajaxForm({
				success : function() {
					alert("Update successfully!");
					//location.reload();
				},
				error : function() {
					alert("Fail to update");
				}
			});
		}
		var sale = angular.module("sale", []);
		sale.directive('onEnter', function() {
			return function(scope, element, attrs) {
				element.bind("keydown keypress", function(event) {
					if (event.which === 13) {
						scope.$apply(function() {
							scope.$eval(attrs.onEnter);
						});

						event.preventDefault();
					}
				});
			};
		});
		sale.controller("saleController", function($scope, $http) {
			$scope.product = "";
			$scope.items = [];
			$scope.addNewItem = function() {
				$http({
					method : 'GET',
					url : "product-mapping",
					params : {
						type : 'get',
						id : $scope.product
					}
				}).then(
						function(response) {
							var data = response.data;
							if (data !== "null") {
								$scope.items.push({
									productMappingID : data.productMappingID,
									code : data.code,
									name : data.productName + " ("
											+ data.scaleType + ")",
									price : data.scalePrice,
									qty : 1
								});
							}
							$scope.product = "";

						}, function(response) {
							alert("Error!!!");
						});
			};
			$scope.removeItem = function(itemIndex) {
				$scope.items.splice(itemIndex, 1);
			};
			$scope.save = function() {
				$("#form").ajaxForm({
					success : function() {
						alert("Transactions completed successfully!");
						$scope.items=[];
						//location.reload();
					},
					error : function() {
						alert("Transaction Fail");
					}
				});
			}
			$scope.getTotal = function() {
				var i;
				var total = 0;
				for (i = 0; i < $scope.items.length; i++) {
					total += $scope.items[i].qty * $scope.items[i].price;
				}
				return total;
			}
		});
	</script>
</body>

</html>
