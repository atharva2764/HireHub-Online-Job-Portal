<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
if (session.getAttribute("user") == null)
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post a Job - EHMS</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: var(--bg, #faf5ff);
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

.nav-links {
	display: flex;
	gap: 8px;
}

.nav-links a {
	color: var(--accent-text);
	text-decoration: none;
	font-size: 14px;
	font-weight: 500;
	padding: 7px 14px;
	border-radius: 6px;
	transition: background 0.2s;
}

.nav-links a:hover {
	background: rgba(255, 255, 255, 0.15);
	color: #fff;
}

.btn-logout {
	background: rgba(255, 255, 255, 0.15);
	border: 1px solid rgba(255, 255, 255, 0.25);
}

.page-header {
	background: linear-gradient(135deg, var(--nav1), var(--nav2));
	color: #fff;
	padding: 36px 40px 32px;
	text-align: center;
}

.page-header h1 {
	font-size: 30px;
	font-weight: 800;
	margin-bottom: 8px;
}

.page-header p {
	color: var(--accent-text);
	font-size: 15px;
}

.content {
	max-width: 860px;
	margin: 0 auto;
	padding: 40px 20px;
}

.form-card {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
	overflow: hidden;
	border: 1px solid var(--accent-border);
}

.form-section {
	padding: 32px 36px;
	border-bottom: 1px solid var(--accent-light);
}

.form-section:last-child {
	border-bottom: none;
}

.section-head {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 26px;
}

.section-num {
	width: 32px;
	height: 32px;
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	color: #fff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: 800;
	flex-shrink: 0;
}

.section-head h3 {
	font-size: 17px;
	font-weight: 700;
	color: #1e293b;
}

.section-head p {
	font-size: 13px;
	color: #64748b;
}

.form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.form-grid-1 {
	grid-column: 1/-1;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-size: 12px;
	font-weight: 600;
	color: #374151;
	margin-bottom: 7px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.form-group input, .form-group textarea {
	padding: 13px 16px;
	border: 2px solid #e5e7eb;
	border-radius: 9px;
	font-size: 15px;
	color: #1e293b;
	outline: none;
	font-family: inherit;
	transition: border-color 0.2s, box-shadow 0.2s;
	background: #f9fafb;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: var(--accent);
	box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.1);
	background: #fff;
}

.form-group textarea {
	min-height: 120px;
	resize: vertical;
}

.form-group .hint {
	font-size: 12px;
	color: #9ca3af;
	margin-top: 5px;
}

.form-footer {
	padding: 24px 36px;
	background: var(--accent-light);
	display: flex;
	gap: 14px;
	justify-content: flex-end;
	align-items: center;
}

.btn-cancel {
	padding: 12px 26px;
	background: #fff;
	border: 2px solid #d1d5db;
	border-radius: 9px;
	font-size: 15px;
	font-weight: 600;
	color: #6b7280;
	cursor: pointer;
	text-decoration: none;
	transition: border-color 0.2s;
}

.btn-cancel:hover {
	border-color: #9ca3af;
}

.btn-submit {
	padding: 13px 32px;
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	color: #fff;
	border: none;
	border-radius: 9px;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	transition: opacity 0.2s, transform 0.2s;
}

.btn-submit:hover {
	opacity: 0.9;
	transform: translateY(-1px);
}

.breadcrumb {
	font-size: 13px;
	color: #64748b;
	margin-bottom: 24px;
}

.breadcrumb a {
	color: var(--accent);
	text-decoration: none;
	font-weight: 500;
}

.breadcrumb a:hover {
	text-decoration: underline;
}

.breadcrumb span {
	margin: 0 8px;
	color: #9ca3af;
}
</style>
</head>
<body class="theme-purple" id="appBody">

	<div class="theme-bar">
		<span>Theme:</span>
		<div class="theme-dot dot-purple active" onclick="setTheme('purple')"
			title="Purple"></div>
		<div class="theme-dot dot-blue" onclick="setTheme('blue')"
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
			EH<span>MS</span>
		</div>
		<div class="nav-links">
			<a href="recruiter-dashboard.jsp">Dashboard</a> 
			<a href="logout-confirm" class="btn-logout">Logout</a>
		</div>
	</nav>

	<div class="page-header">
		<h1>Post a New Job</h1>
		<p>Fill in the details below to publish your job listing</p>
	</div>

	<div class="content">
		<div class="breadcrumb">
			<a href="recruiter-dashboard.jsp">Dashboard</a> <span>&rsaquo;</span>
			Post a Job
		</div>
		<div class="form-card">
			
			
			<form action="postjob" method="post">
				<div class="form-section">
					<div class="section-head">
						<div class="section-num">1</div>
						<div>
							<h3>Job Information</h3>
							<p>Provide the basic details about this position</p>
						</div>
					</div>
					<div class="form-grid">
						<div class="form-group form-grid-1">
							<label for="title">Job Title *</label> <input type="text"
								id="title" name="title" placeholder="e.g. Senior Java Developer"
								required>
						</div>
						<div class="form-group form-grid-1">
							<label for="description">Job Description *</label>
							<textarea id="description" name="description"
								placeholder="Describe the role, responsibilities, required skills..."
								required></textarea>
						</div>
					</div>
				</div>
				<div class="form-section">
					<div class="section-head">
						<div class="section-num">2</div>
						<div>
							<h3>Location &amp; Compensation</h3>
							<p>Where is this role based and what is the salary?</p>
						</div>
					</div>
					<div class="form-grid">
						<div class="form-group">
							<label for="location">Location *</label> <input type="text"
								id="location" name="location" placeholder="e.g. Mumbai, India"
								required>
						</div>
						<div class="form-group">
							<label for="salary">Annual Salary (Rs.) *</label> <input
								type="number" id="salary" name="salary"
								placeholder="e.g. 600000" min="0" required> <span
								class="hint">Enter amount in Indian Rupees (Rs.)</span>
						</div>
					</div>
				</div>
				<div class="form-footer">
					<a href="recruiter-dashboard.jsp" class="btn-cancel">Cancel</a>
					<button type="submit" class="btn-submit">Publish Job</button>
				</div>
			</form>
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
    var saved = localStorage.getItem('ojpms-theme') || 'purple';
    setTheme(saved);
  })();
</script>
</body>
</html>