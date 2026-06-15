<%@ page contentType="text/html;charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Jobs - EHMS</title>
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
	--hero1: #4c1d95;
	--hero2: #7c3aed;
	--card-left: #7c3aed;
	--job-id-bg: #ede9fe;
	--job-id-c: #7c3aed;
	--job-id-border: #ddd6fe;
	--meta-icon: #7c3aed;
	--desc-bg: #f5f3ff;
	--desc-border: #ddd6fe;
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
	--hero1: #1e3a8a;
	--hero2: #2563eb;
	--card-left: #3b82f6;
	--job-id-bg: #eff6ff;
	--job-id-c: #1d4ed8;
	--job-id-border: #bfdbfe;
	--meta-icon: #3b82f6;
	--desc-bg: #f8faff;
	--desc-border: #bfdbfe;
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
	--hero1: #14532d;
	--hero2: #15803d;
	--card-left: #16a34a;
	--job-id-bg: #dcfce7;
	--job-id-c: #15803d;
	--job-id-border: #bbf7d0;
	--meta-icon: #16a34a;
	--desc-bg: #f0fdf4;
	--desc-border: #bbf7d0;
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
	--hero1: #9f1239;
	--hero2: #be123c;
	--card-left: #e11d48;
	--job-id-bg: #ffe4e6;
	--job-id-c: #be123c;
	--job-id-border: #fecdd3;
	--meta-icon: #e11d48;
	--desc-bg: #fff1f2;
	--desc-border: #fecdd3;
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
	--hero1: #0f172a;
	--hero2: #1e293b;
	--card-left: #6366f1;
	--job-id-bg: #1e1b4b;
	--job-id-c: #a5b4fc;
	--job-id-border: #312e81;
	--meta-icon: #6366f1;
	--desc-bg: #1e1b4b;
	--desc-border: #312e81;
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

.search-hero {
	background: linear-gradient(135deg, var(--hero1), var(--hero2));
	padding: 44px 40px;
	text-align: center;
	color: #fff;
}

.search-hero h1 {
	font-size: 32px;
	font-weight: 800;
	margin-bottom: 8px;
}

.search-hero p {
	color: var(--accent-text);
	font-size: 15px;
	margin-bottom: 28px;
}

.search-bar {
	display: flex;
	justify-content: center;
	gap: 0;
	max-width: 560px;
	margin: 0 auto;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
}

.search-bar input {
	flex: 1;
	padding: 15px 20px;
	border: none;
	outline: none;
	font-size: 15px;
	color: #1e293b;
}

.search-bar button {
	padding: 15px 28px;
	background: #f59e0b;
	color: #fff;
	border: none;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	transition: background 0.2s;
}

.search-bar button:hover {
	background: #d97706;
}

.toolbar {
	background: #fff;
	border-bottom: 1px solid #e5e7eb;
	padding: 16px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.toolbar-left {
	font-size: 14px;
	color: #64748b;
}

.toolbar-left strong {
	color: #1e293b;
}

.btn-refresh {
	background: var(--accent-light);
	color: var(--accent-dark);
	text-decoration: none;
	padding: 8px 18px;
	border-radius: 7px;
	font-size: 13px;
	font-weight: 600;
	border: 1px solid var(--accent-border);
	transition: background 0.2s;
	display: inline-block;
}

.btn-refresh:hover {
	background: var(--accent-border);
}

.content {
	max-width: 1000px;
	margin: 0 auto;
	padding: 32px 20px;
}

.empty-state {
	text-align: center;
	padding: 70px 20px;
	background: #fff;
	border-radius: 14px;
	border: 2px dashed #e5e7eb;
}

.empty-circle {
	width: 80px;
	height: 80px;
	background: #f1f5f9;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	font-size: 32px;
	font-weight: 900;
	color: #94a3b8;
}

.empty-state h3 {
	font-size: 20px;
	font-weight: 700;
	color: #374151;
	margin-bottom: 8px;
}

.empty-state p {
	color: #9ca3af;
	font-size: 14px;
}

.job-card {
	background: #fff;
	border-radius: 14px;
	border: 1px solid #e8edf5;
	border-left: 5px solid var(--card-left);
	margin-bottom: 20px;
	padding: 26px 28px;
	box-shadow: 0 2px 14px rgba(0, 0, 0, 0.06);
	transition: transform 0.22s, box-shadow 0.22s;
}

.job-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 28px rgba(0, 0, 0, 0.1);
}

.job-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 14px;
}

.job-title {
	font-size: 20px;
	font-weight: 800;
	color: #1e293b;
	margin-bottom: 6px;
}

.job-id {
	background: var(--job-id-bg);
	color: var(--job-id-c);
	border: 1px solid var(--job-id-border);
	border-radius: 6px;
	padding: 4px 10px;
	font-size: 12px;
	font-weight: 600;
	white-space: nowrap;
}

.job-meta {
	display: flex;
	gap: 20px;
	margin-bottom: 14px;
	flex-wrap: wrap;
}

.meta-item {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 13px;
	color: #64748b;
}

.meta-icon {
	font-weight: 700;
	color: var(--meta-icon);
}

.job-description {
	font-size: 14px;
	color: #4b5563;
	line-height: 1.6;
	margin-bottom: 18px;
	background: var(--desc-bg);
	border-radius: 8px;
	padding: 14px 16px;
	border-left: 3px solid var(--desc-border);
}

.job-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	gap: 14px;
}

.salary-badge {
	background: #dcfce7;
	color: #15803d;
	border: 1px solid #bbf7d0;
	border-radius: 8px;
	padding: 8px 16px;
	font-size: 14px;
	font-weight: 700;
}

.apply-section {
	display: flex;
	align-items: center;
	gap: 12px;
}

.apply-section input[type="submit"] {
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	color: #fff;
	border: none;
	padding: 11px 28px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 700;
	cursor: pointer;
	transition: opacity 0.2s, transform 0.2s;
}

.apply-section input[type="submit"]:hover {
	opacity: 0.9;
	transform: translateY(-1px);
}

.alert-error {
	background: #fef2f2;
	border: 1px solid #fecaca;
	border-left: 4px solid #ef4444;
	color: #b91c1c;
	padding: 10px 14px;
	border-radius: 7px;
	font-size: 13px;
	font-weight: 500;
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
		<div class="nav-links">
			<a href="user-dashboard.jsp">Dashboard</a> <a href="logout"
				class="btn-logout">Logout</a>
		</div>
	</nav>

	<div class="search-hero">
		<h1>Find Your Perfect Job</h1>
		<p>Explore all available openings and apply with one click</p>
		<form action="viewjob" method="get" style="display: contents;">
			<div class="search-bar">
				<input type="text" name="search"
					placeholder="Search by title, location or keyword...">
				<button type="submit">Search</button>
			</div>
		</form>
	</div>

	<div class="toolbar">
		<div class="toolbar-left">
			Showing <strong>all available jobs</strong>
		</div>
		<a href="viewjob" class="btn-refresh">Refresh</a>
	</div>

	<div class="content">
		<c:if test="${empty jobs}">
			<div class="empty-state">
				<div class="empty-circle">J</div>
				<h3>No Jobs Found</h3>
				<p>There are no job listings at the moment. Please check back
					later.</p>
			</div>
		</c:if>
		
		
		<c:forEach var="job" items="${jobs}">
			<div class="job-card">
				<div class="job-header">
					<div>
						<div class="job-title">${job.title}</div>
						<div class="job-meta">
							<span class="meta-item"><span class="meta-icon">Loc:</span>${job.location}</span>
							<span class="meta-item"><span class="meta-icon">ID:</span>#${job.id}</span>
						</div>
					</div>
					<span class="job-id">Job #${job.id}</span>
				</div>
				<div class="job-description">${job.description}</div>
				<div class="job-footer">
					<div class="salary-badge">Rs. ${job.salary} / year</div>
					<div class="apply-section">
						<c:if test="${appliedId == job.id}">
							<div class="alert-error">${error}</div>
						</c:if>
						<form action="applyjob" method="post">
							<input type="hidden" name="jobId" value="${job.id}"> <input
								type="submit" value="Apply Now">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
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