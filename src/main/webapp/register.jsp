<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - EHMS</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 50%, #0ea5e9 100%);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

nav {
	background: rgba(0, 0, 0, 0.2);
	padding: 14px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.nav-brand {
	color: #fff;
	font-size: 22px;
	font-weight: 800;
	text-decoration: none;
}

.nav-brand span {
	color: #93c5fd;
}

.nav-links a {
	color: #bfdbfe;
	text-decoration: none;
	margin-left: 20px;
	font-size: 14px;
	font-weight: 500;
	padding: 6px 14px;
	border-radius: 6px;
	transition: background 0.2s;
}

.nav-links a:hover {
	background: rgba(255, 255, 255, 0.15);
	color: #fff;
}

.main {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 40px 20px;
}

.register-card {
	background: #fff;
	border-radius: 18px;
	width: 100%;
	max-width: 540px;
	padding: 50px 48px;
	box-shadow: 0 24px 60px rgba(0, 0, 0, 0.25);
}

.form-header {
	text-align: center;
	margin-bottom: 34px;
}

.form-header .logo-circle {
	width: 70px;
	height: 70px;
	background: linear-gradient(135deg, #1e3a8a, #3b82f6);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 16px;
	color: #fff;
	font-size: 26px;
	font-weight: 900;
}

.form-header h1 {
	font-size: 26px;
	font-weight: 800;
	color: #1e293b;
}

.form-header p {
	color: #64748b;
	font-size: 14px;
	margin-top: 6px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-size: 12px;
	font-weight: 600;
	color: #374151;
	margin-bottom: 7px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.input-wrap {
	position: relative;
}

.input-wrap .icon {
	position: absolute;
	left: 14px;
	top: 50%;
	transform: translateY(-50%);
	color: #9ca3af;
	font-size: 15px;
	font-weight: 700;
}

.input-wrap input, .input-wrap select {
	width: 100%;
	padding: 13px 14px 13px 42px;
	border: 2px solid #e5e7eb;
	border-radius: 9px;
	font-size: 15px;
	color: #1e293b;
	outline: none;
	transition: border-color 0.2s, box-shadow 0.2s;
	background: #f9fafb;
	appearance: none;
}

.input-wrap input:focus, .input-wrap select:focus {
	border-color: #3b82f6;
	box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.12);
	background: #fff;
}

/* ROLE SELECTOR */
.role-label {
	font-size: 12px;
	font-weight: 600;
	color: #374151;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.role-cards {
	display: flex;
	gap: 14px;
	margin-bottom: 20px;
}

.role-card {
	flex: 1;
	border: 2px solid #e5e7eb;
	border-radius: 10px;
	padding: 16px 12px;
	text-align: center;
	cursor: pointer;
	transition: all 0.2s;
	background: #f9fafb;
	position: relative;
}

.role-card input[type="radio"] {
	position: absolute;
	opacity: 0;
	width: 0;
	height: 0;
}

.role-card:hover {
	border-color: #3b82f6;
	background: #eff6ff;
}

.role-card.selected {
	border-color: #1d4ed8;
	background: #eff6ff;
}

.role-icon {
	width: 42px;
	height: 42px;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 10px;
	font-size: 18px;
	font-weight: 900;
}

.role-card-seeker .role-icon {
	background: #dbeafe;
	color: #1d4ed8;
}

.role-card-recruiter .role-icon {
	background: #ede9fe;
	color: #7c3aed;
}

.role-card h4 {
	font-size: 13px;
	font-weight: 700;
	color: #1e293b;
	margin-bottom: 4px;
}

.role-card p {
	font-size: 11px;
	color: #64748b;
}

.btn-submit {
	width: 100%;
	padding: 15px;
	background: linear-gradient(135deg, #1e3a8a, #3b82f6);
	color: #fff;
	border: none;
	border-radius: 9px;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	letter-spacing: 0.5px;
	margin-top: 8px;
	transition: opacity 0.2s, transform 0.2s;
}

.btn-submit:hover {
	opacity: 0.92;
	transform: translateY(-1px);
}

.login-link {
	text-align: center;
	font-size: 14px;
	color: #64748b;
	margin-top: 20px;
}

.login-link a {
	color: #1d4ed8;
	font-weight: 700;
	text-decoration: none;
}

.login-link a:hover {
	text-decoration: underline;
}

.alert-error {
	background: #fef2f2;
	border: 1px solid #fecaca;
	border-left: 4px solid #ef4444;
	color: #b91c1c;
	padding: 12px 16px;
	border-radius: 8px;
	font-size: 14px;
	margin-bottom: 18px;
}
</style>
</head>
<body>

	<nav>
		<a href="home.jsp" class="nav-brand">OJ<span>PMS</span></a>
		<div class="nav-links">
			<a href="home.jsp">Home</a> <a href="login.jsp">Login</a>
		</div>
	</nav>

	<div class="main">
		<div class="register-card">
			<div class="form-header">
				<div class="logo-circle">R</div>
				<h1>Create Account</h1>
				<p>Join OJPMS and start your journey today</p>
			</div>

			<%
			if (request.getAttribute("error") != null) {
			%>
			<div class="alert-error">${error}</div>
			<%
			}
			%>

			<form action="register" method="post">

				<div class="form-group">
					<label for="name">Full Name</label>
					<div class="input-wrap">
						<span class="icon">N</span> <input type="text" id="name"
							name="name" placeholder="Enter your full name" required>
					</div>
				</div>

				<div class="form-group">
					<label for="email">Email Address</label>
					<div class="input-wrap">
						<span class="icon">@</span> <input type="email" id="email"
							name="email" placeholder="Enter your email" required>
					</div>
				</div>

				<div class="form-group">
					<label for="password">Password</label>
					<div class="input-wrap">
						<span class="icon">*</span> <input type="password" id="password"
							name="password" placeholder="Create a strong password" required>
					</div>
				</div>

				<!-- ROLE SELECTION -->
				<div class="role-label">Select Your Role</div>
				<div class="role-cards">
					<label class="role-card role-card-seeker" id="card-seeker"
						onclick="selectRole('JOB_SEEKER')"> <input type="radio"
						name="role" value="JOB_SEEKER" id="role-seeker" checked>
						<div class="role-icon">J</div>
						<h4>Job Seeker</h4>
						<p>Find and apply to jobs</p>
					</label> <label class="role-card role-card-recruiter" id="card-recruiter"
						onclick="selectRole('RECRUITER')"> <input type="radio"
						name="role" value="RECRUITER" id="role-recruiter">
						<div class="role-icon">R</div>
						<h4>Recruiter</h4>
						<p>Post jobs and hire talent</p>
					</label>
				</div>

				<button type="submit" class="btn-submit">Create Account</button>
			</form>

			<div class="login-link">
				Already have an account? <a href="login.jsp">Login here</a>
			</div>
		</div>
	</div>

	<script>
		function selectRole(val) {
			document.getElementById('card-seeker').classList.remove('selected');
			document.getElementById('card-recruiter').classList
					.remove('selected');
			if (val === 'JOB_SEEKER') {
				document.getElementById('card-seeker').classList
						.add('selected');
				document.getElementById('role-seeker').checked = true;
			} else {
				document.getElementById('card-recruiter').classList
						.add('selected');
				document.getElementById('role-recruiter').checked = true;
			}
		}
		document.addEventListener('DOMContentLoaded', function() {
			selectRole('JOB_SEEKER');
		});
	</script>
</body>
</html>
