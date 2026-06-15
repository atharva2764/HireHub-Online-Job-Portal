<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
if (session.getAttribute("user") == null)
	response.sendRedirect("login.jsp");
String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Jobs - EHMS</title>
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

/* ===== THEME VARS ===== */
body.theme-purple {
	--bg: #faf5ff;
	--nav1: #4c1d95;
	--nav2: #7c3aed;
	--accent: #7c3aed;
	--accent-dark: #4c1d95;
	--accent-light: #ede9fe;
	--accent-border: #ddd6fe;
	--accent-text: #c4b5fd;
	--badge-bg: #7c3aed;
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
	--badge-bg: #3b82f6;
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
	--badge-bg: #16a34a;
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
	--badge-bg: #e11d48;
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
	--badge-bg: #6366f1;
	--stat-num: #a5b4fc;
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
	gap: 12px;
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
	padding: 8px 16px;
	border-radius: 7px;
	font-size: 13px;
	font-weight: 600;
	border: 1px solid rgba(255, 255, 255, 0.25);
	transition: background 0.2s;
	cursor: pointer;
}

.btn-nav:hover {
	background: rgba(255, 255, 255, 0.28);
}

/* Theme switcher */
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

.page-header {
	background: linear-gradient(135deg, var(--nav1), var(--nav2));
	color: #fff;
	padding: 36px 40px 50px;
}

.page-header-inner {
	max-width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
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

.job-count-badge {
	background: rgba(255, 255, 255, 0.15);
	border: 1px solid rgba(255, 255, 255, 0.3);
	border-radius: 12px;
	padding: 16px 28px;
	text-align: center;
}

.job-count-badge .count-num {
	font-size: 36px;
	font-weight: 900;
	color: #fff;
}

.job-count-badge .count-lbl {
	font-size: 12px;
	color: var(--accent-text);
	text-transform: uppercase;
	letter-spacing: 1px;
	margin-top: 2px;
}

.main {
	max-width: 1100px;
	margin: -24px auto 0;
	padding: 0 20px 60px;
}

.alert {
	border-radius: 10px;
	padding: 14px 20px;
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 24px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.alert-success {
	background: #dcfce7;
	border: 1px solid #86efac;
	border-left: 4px solid #16a34a;
	color: #15803d;
}

.alert-danger {
	background: #fee2e2;
	border: 1px solid #fca5a5;
	border-left: 4px solid #dc2626;
	color: #b91c1c;
}

.card {
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 24px rgba(0, 0, 0, 0.07);
	border: 1px solid var(--accent-border);
	overflow: hidden;
}

.card-header {
	background: var(--accent-light);
	padding: 20px 28px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid var(--accent-border);
}

.card-header h3 {
	font-size: 16px;
	font-weight: 800;
	color: var(--accent-dark);
}

.btn-post {
	background: linear-gradient(135deg, var(--accent-dark), var(--accent));
	color: #fff;
	text-decoration: none;
	padding: 9px 20px;
	border-radius: 8px;
	font-size: 13px;
	font-weight: 700;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
	transition: transform 0.2s, box-shadow 0.2s;
	display: inline-block;
}

.btn-post:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

/* Table */
.table-wrap {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead tr {
	background: var(--accent-light);
}

thead th {
	padding: 14px 18px;
	text-align: left;
	font-size: 11px;
	font-weight: 800;
	color: var(--accent-dark);
	text-transform: uppercase;
	letter-spacing: 0.8px;
	border-bottom: 2px solid var(--accent-border);
}

tbody tr {
	border-bottom: 1px solid #f1f5f9;
	transition: background 0.15s;
}

tbody tr:last-child {
	border-bottom: none;
}

tbody tr:hover {
	background: var(--accent-light);
}

tbody td {
	padding: 16px 18px;
	font-size: 14px;
	color: #1e293b;
	vertical-align: middle;
}

.badge-id {
	background: var(--accent-light);
	color: var(--accent);
	font-size: 11px;
	font-weight: 700;
	padding: 3px 10px;
	border-radius: 20px;
	display: inline-block;
}

.job-title {
	font-weight: 700;
	color: #1e293b;
}

.job-desc {
	font-size: 12px;
	color: #64748b;
	margin-top: 3px;
	max-width: 280px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.location-tag {
	font-size: 12px;
	color: #64748b;
}

.salary-val {
	font-weight: 700;
	color: var(--accent-dark);
}

.action-btns {
	display: flex;
	gap: 8px;
}

.btn-edit {
	background: linear-gradient(135deg, #1e3a8a, #3b82f6);
	color: #fff;
	text-decoration: none;
	padding: 7px 16px;
	border-radius: 7px;
	font-size: 12px;
	font-weight: 700;
	transition: transform 0.2s;
	white-space: nowrap;
}

.btn-edit:hover {
	transform: translateY(-1px);
}

.btn-delete {
	background: linear-gradient(135deg, #9f1239, #e11d48);
	color: #fff;
	text-decoration: none;
	padding: 7px 16px;
	border-radius: 7px;
	font-size: 12px;
	font-weight: 700;
	border: none;
	cursor: pointer;
	transition: transform 0.2s;
	white-space: nowrap;
}

.btn-delete:hover {
	transform: translateY(-1px);
}

.empty-state {
	padding: 60px 20px;
	text-align: center;
}

.empty-state .icon {
	font-size: 48px;
	margin-bottom: 14px;
}

.empty-state h3 {
	font-size: 18px;
	font-weight: 700;
	color: #374151;
	margin-bottom: 8px;
}

.empty-state p {
	color: #9ca3af;
	font-size: 14px;
	margin-bottom: 20px;
}

/* Confirm modal */
.modal-overlay {
	display: none;
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, 0.45);
	z-index: 1000;
	align-items: center;
	justify-content: center;
}

.modal-overlay.open {
	display: flex;
}

.modal-box {
	background: #fff;
	border-radius: 16px;
	padding: 36px;
	max-width: 420px;
	width: 90%;
	text-align: center;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
	animation: popIn 0.2s ease;
}

@
keyframes popIn {from { transform:scale(0.9);
	opacity: 0;
}

to {
	transform: scale(1);
	opacity: 1;
}

}
.modal-box .modal-icon {
	font-size: 44px;
	margin-bottom: 14px;
}

.modal-box h3 {
	font-size: 20px;
	font-weight: 800;
	color: #1e293b;
	margin-bottom: 8px;
}

.modal-box p {
	color: #64748b;
	font-size: 14px;
	margin-bottom: 28px;
}

.modal-actions {
	display: flex;
	gap: 12px;
	justify-content: center;
}

.btn-confirm-del {
	background: linear-gradient(135deg, #9f1239, #e11d48);
	color: #fff;
	padding: 11px 28px;
	border-radius: 9px;
	font-size: 14px;
	font-weight: 700;
	border: none;
	cursor: pointer;
	transition: transform 0.2s;
}

.btn-confirm-del:hover {
	transform: translateY(-2px);
}

.btn-cancel-del {
	background: #f3f4f6;
	color: #374151;
	padding: 11px 28px;
	border-radius: 9px;
	font-size: 14px;
	font-weight: 600;
	border: none;
	cursor: pointer;
}

.btn-back-link {
	display: inline-block;
	margin-top: 24px;
	color: var(--accent);
	font-weight: 600;
	text-decoration: none;
	font-size: 14px;
}
</style>
</head>
<body class="theme-purple" id="appBody">

	<!-- Theme Switcher Bar -->
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
			<span class="nav-user">Hello, <strong>${user.name}</strong></span> 
			<a href="recruiter-dashboard.jsp" class="btn-nav">Dashboard</a> 
			<a href="recruiter-profile?id=${user.id}" class="btn-nav">Profile</a> 
			<a href="logout-confirm" class="btn-nav">Logout</a>
		</div>
	</nav>

	<div class="page-header">
		<div class="page-header-inner">
			<div>
				<h1>My Job Postings</h1>
				<p>Manage all jobs you have posted — edit or delete anytime</p>
			</div>
			<div class="job-count-badge">
				<div class="count-num">${jobCount}</div>
				<div class="count-lbl">Jobs Posted</div>
			</div>
		</div>
	</div>

	<div class="main">

		<% if ("updated".equals(msg)) {%>
		<div class="alert alert-success">&#10003; Job updated
			successfully!</div>
		<%} else if ("deleted".equals(msg)) 
		{%>
		<div class="alert alert-danger">&#128465; Job deleted
			successfully.</div>
		<%
		}
		%>

		<div class="card">
			<div class="card-header">
				<h3>All My Jobs (${jobCount})</h3>
				<a href="post-job.jsp" class="btn-post">+ Post New Job</a>
			</div>

			<div class="table-wrap">
				<c:choose>
					<c:when test="${empty jobs}">
						<div class="empty-state">
							<div class="icon">&#128196;</div>
							<h3>No Jobs Posted Yet</h3>
							<p>You haven't posted any jobs. Start hiring today!</p>
							<a href="post-job.jsp" class="btn-post">+ Post Your First Job</a>
						</div>
					</c:when>
					<c:otherwise>
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Job Title</th>
									<th>Location</th>
									<th>Salary (LPA)</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="job" items="${jobs}">
									<tr>
										<td><span class="badge-id">${job.id}</span></td>
										<td>
											<div class="job-title">${job.title}</div>
											<div class="job-desc">${job.description}</div>
										</td>
										<td><span class="location-tag">&#128205;
												${job.location}</span></td>
										<td><span class="salary-val">&#8377; ${job.salary}
												LPA</span></td>
										<td>
											<div class="action-btns">
												<a href="editjob?jobId=${job.id}" class="btn-edit">&#9998;
													Edit</a>
												<button class="btn-delete"
													onclick="confirmDelete(${job.id}, '${job.title}')">&#128465;
													Delete</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<a href="recruiter-dashboard.jsp" class="btn-back-link">&#8592;
			Back to Dashboard</a>

	</div>

	<!-- Delete Confirm Modal -->
	<div class="modal-overlay" id="deleteModal">
		<div class="modal-box">
			<div class="modal-icon">&#9888;</div>
			<h3>Delete Job?</h3>
			<p id="deleteMsg">This will permanently remove the job from the database.</p>
			<div class="modal-actions">
				<button class="btn-confirm-del" id="confirmDelBtn">Yes,Delete</button>
				<button class="btn-cancel-del" onclick="closeModal()">Cancel</button>
			</div>
		</div>
	</div>

	<script>
  // Theme switcher - persist in localStorage
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

  // Delete modal
  function confirmDelete(jobId, title) {
    document.getElementById('deleteMsg').textContent = 'Are you sure you want to delete "' + title + '"? This cannot be undone.';
    document.getElementById('confirmDelBtn').onclick = function() {
      window.location.href = 'deletejob?jobId=' + jobId;
    };
    document.getElementById('deleteModal').classList.add('open');
  }
  function closeModal() {
    document.getElementById('deleteModal').classList.remove('open');
  }
  document.getElementById('deleteModal').addEventListener('click', function(e) {
    if (e.target === this) closeModal();
  });
</script>

</body>
</html>
