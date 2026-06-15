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
<title>User Dashboard - EHMS</title>
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
	--stat-num: #4c1d95;
	--tips-bg: #faf5ff;
	--tips-border: #ddd6fe;
	--tips-left: #7c3aed;
	--tips-h: #4c1d95;
	--arrow: #7c3aed;
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
	--tips-bg: #eff6ff;
	--tips-border: #bfdbfe;
	--tips-left: #3b82f6;
	--tips-h: #1e3a8a;
	--arrow: #3b82f6;
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
	--tips-bg: #f0fdf4;
	--tips-border: #bbf7d0;
	--tips-left: #16a34a;
	--tips-h: #14532d;
	--arrow: #16a34a;
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
	--tips-bg: #fff1f2;
	--tips-border: #fecdd3;
	--tips-left: #e11d48;
	--tips-h: #9f1239;
	--arrow: #e11d48;
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
	--tips-bg: #1e1b4b;
	--tips-border: #312e81;
	--tips-left: #6366f1;
	--tips-h: #a5b4fc;
	--arrow: #6366f1;
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
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.2);
	height: 64px;
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

.welcome-banner {
	background: linear-gradient(135deg, var(--nav1), var(--nav2));
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
	color: var(--accent-text);
}

.welcome-text p {
	color: var(--accent-text);
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
	color: var(--accent-text);
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
	color: var(--stat-num);
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
	border: 1px solid var(--accent-border);
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

.icon-blue {
	background: #dbeafe;
	color: #1d4ed8;
}

.icon-green {
	background: #dcfce7;
	color: #15803d;
}

.icon-orange {
	background: #fff7ed;
	color: #c2410c;
}

.icon-purple {
	background: #ede9fe;
	color: #7c3aed;
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
	color: var(--arrow);
	font-weight: 700;
	font-size: 16px;
	margin-top: 14px;
	display: block;
}

.tips-box {
	background: var(--tips-bg);
	border: 1px solid var(--tips-border);
	border-left: 4px solid var(--tips-left);
	border-radius: 10px;
	padding: 22px 26px;
}

.tips-box h4 {
	font-size: 15px;
	font-weight: 700;
	color: var(--tips-h);
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
	color: var(--tips-left);
	font-weight: 700;
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
				href="profile?id=${user.id}" class="btn-nav">My Profile</a> <a
				href="logout-confirm" class="btn-nav">Logout</a>
		</div>
	</nav>

	<div class="welcome-banner">
		<div class="welcome-inner">
			<div class="welcome-text">
				<h1>
					Welcome back, <span>${user.name}</span>!
				</h1>
				<p>Your career dashboard is ready. Browse jobs and track your
					applications.</p>
			</div>
			<div class="welcome-badge">
				<div class="role">Logged in as</div>
				<div class="role-name">Job Seeker</div>
			</div>
		</div>
	</div>

	<div class="stats-row">
		<div class="stats-inner">
			<div class="stat-box">
				<div class="num">5,000+</div>
				<div class="lbl">Jobs Available</div>
			</div>
			<div class="stat-box">
				<div class="num">800+</div>
				<div class="lbl">Companies</div>
			</div>
			<div class="stat-box">
				<div class="num">12k+</div>
				<div class="lbl">Registered Users</div>
			</div>
			<div class="stat-box">
				<div class="num">98%</div>
				<div class="lbl">Success Rate</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="section-title">Quick Actions</div>
		<div class="action-grid">
			<a href="viewjob" class="action-card">
				<div class="action-icon icon-blue">J</div>
				<h3>Browse Jobs</h3>
				<p>Explore thousands of job openings across all industries and
					locations.</p> <span class="arrow">View Jobs &rarr;</span>
			</a>
			<!-- <a href="viewjob?search=" class="action-card">
      <div class="action-icon icon-green">S</div>
      <h3>Search Jobs</h3>
      <p>Search for jobs by title, keyword, location or salary range.</p>
      <span class="arrow">Search Now &rarr;</span>
    </a> -->
			<a href="profile?id=${user.id}" class="action-card">
				<div class="action-icon icon-purple">P</div>
				<h3>My Profile</h3>
				<p>View and update your account details and credentials.</p> <span
				class="arrow">View Profile &rarr;</span>
			</a> <a href="logout-confirm" class="action-card">
				<div class="action-icon icon-orange">X</div>
				<h3>Logout</h3>
				<p>Safely sign out of your EHMS account when you are done.</p> <span
				class="arrow">Sign Out &rarr;</span>
			</a>
		</div>

		<div class="tips-box">
			<h4>Tips for a Successful Job Search</h4>
			<ul>
				<li>Keep your profile and contact details up to date</li>
				<li>Apply to roles that match at least 70% of the requirements</li>
				<li>Check back daily for fresh job listings</li>
				<li>Use specific keywords when searching for jobs</li>
				<li>Follow up after applying to show your enthusiasm</li>
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
    var saved = localStorage.getItem('ojpms-theme') || 'blue';
    setTheme(saved);
  })();
</script>
</body>
</html>