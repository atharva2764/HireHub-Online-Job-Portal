<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password - EHMS</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #f59e0b 0%, #d97706 50%, #b45309 100%);
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
	color: #fde68a;
}

.nav-links a {
	color: #fde68a;
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
	padding: 50px 20px;
}

.reset-card {
	background: #fff;
	border-radius: 18px;
	width: 100%;
	max-width: 460px;
	padding: 50px 44px;
	box-shadow: 0 24px 60px rgba(0, 0, 0, 0.25);
}

.card-header {
	text-align: center;
	margin-bottom: 34px;
}

.card-icon {
	width: 70px;
	height: 70px;
	background: linear-gradient(135deg, #f59e0b, #d97706);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 16px;
	color: #fff;
	font-size: 26px;
	font-weight: 900;
}

.card-header h1 {
	font-size: 26px;
	font-weight: 800;
	color: #1e293b;
}

.card-header p {
	color: #64748b;
	font-size: 14px;
	margin-top: 6px;
	line-height: 1.5;
}

/* STEP INDICATOR */
.steps {
	display: flex;
	justify-content: center;
	gap: 0;
	margin-bottom: 30px;
}

.step {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 12px;
	color: #9ca3af;
	font-weight: 500;
}

.step.active {
	color: #d97706;
}

.step-dot {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background: #e5e7eb;
	color: #9ca3af;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	font-weight: 700;
}

.step.active .step-dot {
	background: #f59e0b;
	color: #fff;
}

.step-line {
	width: 32px;
	height: 2px;
	background: #e5e7eb;
	margin: 0 4px;
}

/* INFO BOX */
.info-box {
	background: #fffbeb;
	border: 1px solid #fde68a;
	border-left: 4px solid #f59e0b;
	border-radius: 8px;
	padding: 12px 16px;
	font-size: 13px;
	color: #78350f;
	margin-bottom: 26px;
	line-height: 1.5;
}

.form-group {
	margin-bottom: 22px;
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

.input-wrap input {
	width: 100%;
	padding: 13px 14px 13px 42px;
	border: 2px solid #e5e7eb;
	border-radius: 9px;
	font-size: 15px;
	color: #1e293b;
	outline: none;
	transition: border-color 0.2s, box-shadow 0.2s;
	background: #f9fafb;
}

.input-wrap input:focus {
	border-color: #f59e0b;
	box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.12);
	background: #fff;
}

.btn-submit {
	width: 100%;
	padding: 15px;
	background: linear-gradient(135deg, #f59e0b, #d97706);
	color: #fff;
	border: none;
	border-radius: 9px;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	letter-spacing: 0.5px;
	transition: opacity 0.2s, transform 0.2s;
}

.btn-submit:hover {
	opacity: 0.92;
	transform: translateY(-1px);
}

.divider {
	text-align: center;
	color: #9ca3af;
	font-size: 13px;
	margin: 22px 0;
	position: relative;
}

.divider::before, .divider::after {
	content: '';
	position: absolute;
	top: 50%;
	width: 42%;
	height: 1px;
	background: #e5e7eb;
}

.divider::before {
	left: 0;
}

.divider::after {
	right: 0;
}

.bottom-links {
	text-align: center;
	font-size: 14px;
	color: #64748b;
}

.bottom-links a {
	color: #d97706;
	font-weight: 700;
	text-decoration: none;
}

.bottom-links a:hover {
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

.alert-success {
	background: #f0fdf4;
	border: 1px solid #bbf7d0;
	border-left: 4px solid #22c55e;
	color: #15803d;
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
			<a href="login.jsp">Login</a> <a href="register.jsp">Register</a>
		</div>
	</nav>

	<div class="main">
		<div class="reset-card">

			<div class="card-header">
				<div class="card-icon">K</div>
				<h1>Reset Password</h1>
				<p>Enter your registered email and choose a new password</p>
			</div>

			<!-- STEPS -->
			<div class="steps">
				<div class="step active">
					<div class="step-dot">1</div>
					Verify Email
				</div>
				<div class="step-line"></div>
				<div class="step">
					<div class="step-dot">2</div>
					New Password
				</div>
				<div class="step-line"></div>
				<div class="step">
					<div class="step-dot">3</div>
					Done
				</div>
			</div>

			<!-- INFO BOX -->
			<div class="info-box">Enter the email address linked to your
				account along with a new password. Your password will be updated
				immediately.</div>

			<!-- MESSAGES -->
			<%
			if (request.getAttribute("msg") != null && request.getAttribute("msg").toString().contains("success")) {
			%>
			<div class="alert-success">${msg}</div>
			<%
			} else if (request.getAttribute("msg") != null) {
			%>
			<div class="alert-error">${msg}</div>
			<%
			}
			%>

			<form action="reset" method="post">

				<div class="form-group">
					<label for="email">Registered Email</label>
					<div class="input-wrap">
						<span class="icon">@</span> <input type="email" id="email"
							name="email" placeholder="Enter your registered email" required>
					</div>
				</div>

				<div class="form-group">
					<label for="password">New Password</label>
					<div class="input-wrap">
						<span class="icon">*</span> <input type="password" id="password"
							name="password" placeholder="Enter your new password" required>
					</div>
				</div>

				<button type="submit" class="btn-submit">Reset My Password</button>
			</form>

			<div class="divider">or</div>
			<div class="bottom-links">
				<a href="login.jsp">Back to Login</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a
					href="register.jsp">Create Account</a>
			</div>

		</div>
	</div>

</body>
</html>
