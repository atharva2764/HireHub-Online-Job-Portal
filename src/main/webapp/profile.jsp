<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
if (session.getAttribute("user") == null)
	response.sendRedirect("login.jsp");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile - OJPMS</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: var(--bg, #f0f4ff);
	min-height: 100vh;
	transition: background 0.3s;
}

body.theme-purple {
	--bg: #faf5ff;
	--nav1: #4c1d95;
	--nav2: #7c3aed;
	--accent: #7c3aed;
	--accent-dark: #4c1d95;
	--accent-light: #ede9fe;
	--accent-border: #ddd6fe;
	--accent-text: #c4b5fd;
}

body.theme-blue {
	--bg: #f0f4ff;
	--nav1: #1e3a8a;
	--nav2: #3b82f6;
	--accent: #3b82f6;
	--accent-dark: #1e3a8a;
	--accent-light: #dbeafe;
	--accent-border: #bfdbfe;
	--accent-text: #93c5fd;
}

body.theme-green {
	--bg: #f0fdf4;
	--nav1: #14532d;
	--nav2: #16a34a;
	--accent: #16a34a;
	--accent-dark: #14532d;
	--accent-light: #dcfce7;
	--accent-border: #bbf7d0;
	--accent-text: #86efac;
}

body.theme-rose {
	--bg: #fff1f2;
	--nav1: #9f1239;
	--nav2: #e11d48;
	--accent: #e11d48;
	--accent-dark: #9f1239;
	--accent-light: #ffe4e6;
	--accent-border: #fecdd3;
	--accent-text: #fda4af;
}

body.theme-dark {
	--bg: #0f172a;
	--nav1: #0f172a;
	--nav2: #1e293b;
	--accent: #6366f1;
	--accent-dark: #4338ca;
	--accent-light: #1e1b4b;
	--accent-border: #312e81;
	--accent-text: #a5b4fc;
}

.theme-bar {
	background: var(--accent-light);
	border-bottom: 1px solid var(--accent-border);
	padding: 8px 40px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.theme-bar span {
	font-size: 12px;
	font-weight: 700;
	color: var(--accent-dark);
}

.theme-dot {
	width: 22px;
	height: 22px;
	border-radius: 50%;
	cursor: pointer;
	border: 2px solid transparent;
	transition: transform 0.2s, border-color 0.2s;
}

.theme-dot:hover {
	transform: scale(1.2);
}

.theme-dot.active {
	border-color: #fff;
	box-shadow: 0 0 0 2px var(--accent);
}

.dot-purple {
	background: linear-gradient(135deg, #4c1d95, #7c3aed);
}

.dot-blue {
	background: linear-gradient(135deg, #1e3a8a, #3b82f6);
}

.dot-green {
	background: linear-gradient(135deg, #14532d, #16a34a);
}

.dot-rose {
	background: linear-gradient(135deg, #9f1239, #e11d48);
}

.dot-dark {
	background: linear-gradient(135deg, #0f172a, #6366f1);
}

nav {
	background: linear-gradient(135deg, var(--nav1), var(--nav2));
	padding: 0 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 64px;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.2);
}

.nav-brand {
	color: #fff;
	font-size: 22px;
	font-weight: 800;
}

.nav-brand span {
	color: var(--accent-text);
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 16px;
}

.nav-user {
	color: var(--accent-text);
	font-size: 14px;
	font-weight: 500;
}

.nav-user strong {
	color: #fff;
}

.btn-nav {
	background: rgba(255, 255, 255, 0.15);
	color: #fff;
	text-decoration: none;
	padding: 8px 18px;
	border-radius: 7px;
	font-size: 14px;
	font-weight: 600;
	border: 1px solid rgba(255, 255, 255, 0.25);
	transition: background 0.2s;
}

.btn-nav:hover {
	background: rgba(255, 255, 255, 0.25);
}

.page-header {
	background: linear-gradient(135deg, var(--nav1), var(--nav2));
	color: #fff;
	padding: 36px 40px 50px;
}

.page-header-inner {
	max-width: 800px;
	margin: 0 auto;
}

.page-header h1 {
	font-size: 28px;
	font-weight: 800;
	margin-bottom: 6px;
}

.page-header p {
	color: var(--accent-text);
	font-size: 14px;
}

.main {
	max-width: 800px;
	margin: -24px auto 0;
	padding: 0 20px 60px;
}

.alert-success {
	background: #dcfce7;
	border: 1px solid #86efac;
	border-left: 4px solid #16a34a;
	border-radius: 10px;
	padding: 14px 20px;
	color: #15803d;
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 24px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.profile-card {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
	border: 1px solid var(--accent-border);
	overflow: hidden;
	margin-bottom: 24px;
}

.profile-card-header {
	background: linear-gradient(135deg, var(--accent-light), #fff);
	padding: 32px 36px;
	display: flex;
	align-items: center;
	gap: 24px;
	border-bottom: 1px solid var(--accent-border);
}

.avatar {
	width: 80px;
	height: 80px;
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 32px;
	font-weight: 900;
	color: #fff;
	flex-shrink: 0;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.2);
}

.profile-header-info h2 {
	font-size: 22px;
	font-weight: 800;
	color: #1e293b;
	margin-bottom: 4px;
}

.role-tag {
	display: inline-block;
	background: var(--accent);
	color: #fff;
	font-size: 11px;
	font-weight: 700;
	padding: 3px 12px;
	border-radius: 20px;
	text-transform: uppercase;
	letter-spacing: 0.8px;
}

.profile-fields {
	padding: 32px 36px;
}

.field-row {
	display: flex;
	align-items: flex-start;
	padding: 18px 0;
	border-bottom: 1px solid #f3f4f6;
}

.field-row:last-child {
	border-bottom: none;
}

.field-icon {
	width: 40px;
	height: 40px;
	background: var(--accent-light);
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 17px;
	font-weight: 700;
	margin-right: 20px;
	flex-shrink: 0;
	color: var(--accent);
}

.field-content {
	flex: 1;
}

.field-label {
	font-size: 11px;
	font-weight: 700;
	color: #94a3b8;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	margin-bottom: 4px;
}

.field-value {
	font-size: 15px;
	font-weight: 600;
	color: #1e293b;
}

.field-value.masked {
	letter-spacing: 3px;
	color: #64748b;
}

.profile-actions {
	padding: 0 36px 32px;
	display: flex;
	gap: 14px;
	align-items: center;
}

.btn-update {
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	color: #fff;
	padding: 13px 32px;
	border-radius: 9px;
	font-size: 15px;
	font-weight: 700;
	text-decoration: none;
	border: none;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	gap: 8px;
	transition: transform 0.2s, box-shadow 0.2s;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.18);
}

.btn-update:hover {
	transform: translateY(-2px);
}

.btn-back {
	background: #fff;
	color: var(--accent);
	padding: 13px 24px;
	border-radius: 9px;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	border: 2px solid var(--accent-border);
	transition: background 0.2s;
}

.btn-back:hover {
	background: var(--accent-light);
}
</style>
</head>
<body class="theme-blue" id="appBody">

	<div class="theme-bar">
		<span>Theme:</span>
		<div class="theme-dot dot-purple" onclick="setTheme('purple')"
			title="Purple"></div>
		<div class="theme-dot dot-blue active" onclick="setTheme('blue')"
			title="Blue"></div>
		<div class="theme-dot dot-green" onclick="setTheme('green')"
			title="Green"></div>
		<div class="theme-dot dot-rose" onclick="setTheme('rose')"
			title="Rose"></div>
		<div class="theme-dot dot-dark" onclick="setTheme('dark')"
			title="Dark"></div>
	</div>

	<nav>
		<div class="nav-brand">
			OJ<span>PMS</span>
		</div>
		<div class="nav-right">
			<span class="nav-user">Hello, <strong>${user.name}</strong></span> <a
				href="user-dashboard.jsp" class="btn-nav">Dashboard</a> <a
				href="logout-confirm" class="btn-nav">Logout</a>
		</div>
	</nav>

	<div class="page-header">
		<div class="page-header-inner">
			<h1>My Profile</h1>
			<p>View your account details</p>
		</div>
	</div>

	<div class="main">
		<%
		if (msg != null && !msg.isEmpty()) {
		%>
		<div class="alert-success">
			&#10003;
			<%=msg%></div>
		<%
		}
		%>

		<div class="profile-card">
			<div class="profile-card-header">
				<div class="avatar">${user.name.substring(0,1).toUpperCase()}</div>
				<div class="profile-header-info">
					<h2>${user.name}</h2>
					<span class="role-tag">Job Seeker</span>
				</div>
			</div>
			<div class="profile-fields">
				<div class="field-row">
					<div class="field-icon">#</div>
					<div class="field-content">
						<div class="field-label">User ID</div>
						<div class="field-value">${user.id}</div>
					</div>
				</div>
				<div class="field-row">
					<div class="field-icon">N</div>
					<div class="field-content">
						<div class="field-label">Full Name</div>
						<div class="field-value">${user.name}</div>
					</div>
				</div>
				<div class="field-row">
					<div class="field-icon">@</div>
					<div class="field-content">
						<div class="field-label">Email Address</div>
						<div class="field-value">${user.email}</div>
					</div>
				</div>
				<div class="field-row">
					<div class="field-icon">R</div>
					<div class="field-content">
						<div class="field-label">Role</div>
						<div class="field-value">${user.role}</div>
					</div>
				</div>
				<div class="field-row">
					<div class="field-icon">*</div>
					<div class="field-content">
						<div class="field-label">Password</div>
						<div class="field-value masked">
							<!-- &#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679; -->
							${user.password }
						</div>
					</div>
				</div>
			</div>
			<div class="profile-actions">
				<a href="editprofile?userId=${user.id}" class="btn-update">&#9998;
					Update Profile</a> <a href="user-dashboard.jsp" class="btn-back">&#8592;
					Back to Dashboard</a>
			</div>
		</div>
	</div>

	<script>
  function setTheme(t) {
    document.getElementById('appBody').className = 'theme-' + t;
    document.querySelectorAll('.theme-dot').forEach(d => d.classList.remove('active'));
    document.querySelector('.dot-' + t).classList.add('active');
    localStorage.setItem('ojpms-theme', t);
  }
  (function() {
    var saved = localStorage.getItem('ojpms-theme') || 'blue';
    setTheme(saved);
  })();
</script>
</body>
</html>