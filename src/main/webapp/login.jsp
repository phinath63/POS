<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login</title>

<link rel="stylesheet" href="/css/vendor.css" />
<link rel="stylesheet" href="/css/app.css" />

</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<div>

				<!--                    <h1 class="logo-name">IPR</h1>-->

			</div>
			<h3>POS Management Information System</h3>
			<p>
				Manage your Everything here!!!
				<!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
			</p>
			<p id="error" style="display:none; color:red;">Incorrect username or password!!!</p>
			<form id="login" method="POST" class="m-t" role="form" action="login">
				<div class="form-group">
					<input type="text" name="username" class="form-control"
						placeholder="Username" required>
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control"
						placeholder="Password" required>
				</div>
				<button onclick="login()" type="submit" class="btn btn-primary block full-width m-b">Login</button>

				<!--                <a href="#"><small>Forgot password?</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a>-->
			</form>
			<p class="m-t">
				<small>POS Management System &copy; 2017</small>
			</p>
		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="js/app.js" type="text/javascript"></script>
	<script src="js/plugins/jquery-form.js"></script>
	<script>
		var login = function() {
			$("#login").ajaxForm({
				success : function() {
					window.location = "sale?type=sale";
				},
				error:function(){
					alert("Your username or password might be incorrect");
					$("#error").css({
						display:"block"
					})
				}
			});
		}
	</script>
</body>

</html>
