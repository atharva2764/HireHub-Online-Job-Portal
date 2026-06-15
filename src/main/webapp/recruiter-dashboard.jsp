<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if (session.getAttribute("user") == null)
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recruiter Dashboard - EHMS</title>
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
	--stat-num: #4c1d95;
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
	--stat-num: #1e3a8a;
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
	--stat-num: #14532d;
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
	--stat-num: #9f1239;
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
	--stat-num: #a5b4fc;
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
	background: linear-gradient(135deg, var(--nav1, #4c1d95),
		var(--nav2, #7c3aed));
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
	color: var(--accent-text, #c4b5fd);
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 16px;
}

.nav-user {
	color: var(--accent-text, #ddd6fe);
	font-size: 14px;
	font-weight: 500;
}

.nav-user strong {
	color: #fff;
}

.btn-profile {
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

.btn-profile:hover {
	background: rgba(255, 255, 255, 0.25);
}

.btn-logout {
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

.btn-logout:hover {
	background: rgba(255, 255, 255, 0.25);
}

.welcome-banner {
	background: linear-gradient(135deg, var(--nav1, #4c1d95),
		var(--nav2, #7c3aed));
	color: #fff;
	padding: 44px 40px;
}

.welcome-inner {
	max-width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.welcome-text h1 {
	font-size: 32px;
	font-weight: 800;
	margin-bottom: 8px;
}

.welcome-text h1 span {
	color: var(--accent-text, #c4b5fd);
}

.welcome-text p {
	color: var(--accent-text, #ddd6fe);
	font-size: 15px;
}

.welcome-badge {
	background: rgba(255, 255, 255, 0.12);
	border: 1px solid rgba(255, 255, 255, 0.25);
	border-radius: 10px;
	padding: 16px 24px;
	text-align: center;
}

.welcome-badge .role {
	font-size: 11px;
	color: var(--accent-text, #c4b5fd);
	text-transform: uppercase;
	letter-spacing: 1px;
	margin-bottom: 6px;
}

.welcome-badge .role-name {
	font-size: 18px;
	font-weight: 800;
	color: #fff;
}

.stats-row {
	background: #fff;
	border-bottom: 1px solid #e5e7eb;
}

.stats-inner {
	max-width: 1100px;
	margin: 0 auto;
	display: flex;
}

.stat-box {
	flex: 1;
	padding: 24px 30px;
	text-align: center;
	border-right: 1px solid #e5e7eb;
}

.stat-box:last-child {
	border-right: none;
}

.stat-box .num {
	font-size: 28px;
	font-weight: 900;
	color: var(--stat-num, #4c1d95);
}

.stat-box .lbl {
	font-size: 12px;
	color: #64748b;
	font-weight: 500;
	margin-top: 4px;
}

.content {
	max-width: 1100px;
	margin: 0 auto;
	padding: 40px;
}

.section-title {
	font-size: 20px;
	font-weight: 800;
	color: #1e293b;
	margin-bottom: 24px;
}

.action-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
	gap: 22px;
	margin-bottom: 40px;
}

.action-card {
	background: #fff;
	border-radius: 14px;
	padding: 30px 26px;
	text-decoration: none;
	border: 1px solid var(--accent-border, #ede9fe);
	box-shadow: 0 2px 14px rgba(0, 0, 0, 0.06);
	transition: transform 0.22s, box-shadow 0.22s;
	display: block;
}

.action-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
}

.action-icon {
	width: 52px;
	height: 52px;
	border-radius: 13px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	font-weight: 900;
	margin-bottom: 18px;
}

.icon-purple {
	background: #ede9fe;
	color: #7c3aed;
}

.icon-orange {
	background: #fff7ed;
	color: #c2410c;
}

.icon-blue {
	background: #dbeafe;
	color: #1d4ed8;
}

.icon-green {
	background: #dcfce7;
	color: #15803d;
}

.icon-red {
	background: #fee2e2;
	color: #dc2626;
}

.action-card h3 {
	font-size: 16px;
	font-weight: 700;
	color: #1e293b;
	margin-bottom: 7px;
}

.action-card p {
	font-size: 13px;
	color: #64748b;
	line-height: 1.5;
}

.action-card .arrow {
	color: var(--accent, #7c3aed);
	font-weight: 700;
	font-size: 16px;
	margin-top: 14px;
	display: block;
}

.post-cta {
	background: linear-gradient(135deg, var(--nav1, #4c1d95),
		var(--nav2, #7c3aed));
	border-radius: 16px;
	padding: 36px 40px;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.post-cta h3 {
	font-size: 22px;
	font-weight: 800;
	margin-bottom: 8px;
}

.post-cta p {
	color: var(--accent-text, #ddd6fe);
	font-size: 14px;
}

.btn-post-job {
	background: #fff;
	color: var(--accent-dark, #4c1d95);
	text-decoration: none;
	padding: 14px 30px;
	border-radius: 9px;
	font-size: 15px;
	font-weight: 700;
	white-space: nowrap;
	transition: background 0.2s, transform 0.2s;
	display: inline-block;
}

.btn-post-job:hover {
	background: var(--accent-light, #ede9fe);
	transform: translateY(-2px);
}

.tips-box {
	background: var(--accent-light, #faf5ff);
	border: 1px solid var(--accent-border, #ddd6fe);
	border-left: 4px solid var(--accent, #7c3aed);
	border-radius: 10px;
	padding: 22px 26px;
}

.tips-box h4 {
	font-size: 15px;
	font-weight: 700;
	color: var(--accent-dark, #4c1d95);
	margin-bottom: 12px;
}

.tips-box ul {
	list-style: none;
}

.tips-box ul li {
	font-size: 13px;
	color: #374151;
	padding: 5px 0 5px 18px;
	position: relative;
}

.tips-box ul li::before {
	content: '>';
	position: absolute;
	left: 0;
	color: var(--accent, #7c3aed);
	font-weight: 700;
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
		<div class="nav-right">
			<span class="nav-user">Hello, <strong>${user.name}</strong></span> <a
				href="recruiter-profile?id=${user.id}" class="btn-profile">My
				Profile</a> <a href="logout-confirm" class="btn-logout">Logout</a>
		</div>
	</nav>

	<div class="welcome-banner">
		<div class="welcome-inner">
			<div class="welcome-text">
				<h1>
					Welcome, <span>${user.name}</span>!
				</h1>
				<p>Manage your job postings and find the best candidates for
					your company.</p>
			</div>
			<div class="welcome-badge">
				<div class="role">Logged in as</div>
				<div class="role-name">Recruiter</div>
			</div>
		</div>
	</div>

	<%
	com.jsp.ojpms.User dashUser = (com.jsp.ojpms.User) session.getAttribute("user");
	long recruiterJobCount = 0;
	if (dashUser != null) {
		recruiterJobCount = com.jsp.ojpms.dao.JobDao.countJobsByRecruiter(dashUser.getId());
	}
	%>
	<div class="stats-row">
		<div class="stats-inner">
			<div class="stat-box">
				<div class="num"><%=recruiterJobCount%></div>
				<div class="lbl">Jobs Posted</div>
			</div>
			<div class="stat-box">
				<div class="num">0</div>
				<div class="lbl">Applications</div>
			</div>
			<div class="stat-box">
				<div class="num">12k+</div>
				<div class="lbl">Active Seekers</div>
			</div>
			<div class="stat-box">
				<div class="num">98%</div>
				<div class="lbl">Platform Rate</div>
			</div>
		</div>
	</div>

	<div class="content">

		<div class="post-cta">
			<div>
				<h3>Ready to Find Your Next Hire?</h3>
				<p>Post a job in minutes and reach thousands of qualified
					candidates.</p>
			</div>
			<a href="post-job.jsp" class="btn-post-job">+ Post a Job</a>
		</div>

		<div class="section-title">Quick Actions</div>
		<div class="action-grid">

			<a href="post-job.jsp" class="action-card">
				<div class="action-icon icon-purple">P</div>
				<h3>Post a Job</h3>
				<p>Create a new job listing with title, description, location
					and salary details.</p> <span class="arrow">Post Job &rarr;</span>

			</a> <a href="viewjob" class="action-card">
				<div class="action-icon icon-blue">V</div>
				<h3>View All Jobs</h3>
				<p>Browse all currently active job postings on the platform.</p> <span
				class="arrow">View Jobs &rarr;</span>
			</a> <a href="recruiter-jobs" class="action-card">
				<div class="action-icon icon-red">J</div>
				<h3>My Jobs</h3>
				<p>View, edit and delete all jobs you have posted on the
					platform.</p> <span class="arrow">Manage Jobs &rarr;</span>
			</a> <a href="recruiter-profile?id=${user.id}" class="action-card">
				<div class="action-icon icon-green">P</div>
				<h3>My Profile</h3>
				<p>View and update your recruiter account details and
					credentials.</p> <span class="arrow">View Profile &rarr;</span>
			</a> <a href="logout-confirm" class="action-card">
				<div class="action-icon icon-orange">X</div>
				<h3>Logout</h3>
				<p>Safely sign out of your recruiter account when you are done.</p>
				<span class="arrow">Sign Out &rarr;</span>
			</a>

		</div>

		<div class="tips-box">
			<h4>Tips for Effective Recruiting</h4>
			<ul>
				<li>Write clear and specific job titles for better visibility</li>
				<li>Include a detailed job description with responsibilities
					and requirements</li>
				<li>Mention salary range to attract more relevant applicants</li>
				<li>Specify the work location or remote work options clearly</li>
				<li>Review applications promptly to keep candidates engaged</li>
			</ul>
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
