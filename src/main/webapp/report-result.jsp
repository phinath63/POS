<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="table-responsive">
	<table class="table table-striped table-bordered table-hover dataTables">
		<thead>
			<tr>
				<th>Date</th>
				<th>Product</th>
				<th>Quantity</th>
				<th>Sale Price VS Scale Price</th>
				<th>Total</th>
				<th>Sale By</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${rows}">
				<tr>
					<td>${row.getValueDate() }</td>
					<td>${row.getProductName() } (${row.getScaleType() })</td>
					<td>${row.getSaleQuantity() }</td>
					<td>${row.getSalePrice() }/ ${row.getScalePrice() }</td>
					<td>${row.getSalePrice()*row.getSaleQuantity() }</td>
					<td>${row.getUserName() }</td>

				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>