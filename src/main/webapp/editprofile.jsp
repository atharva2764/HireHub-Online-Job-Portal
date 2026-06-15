<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
  if(session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile - EHMS</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: var(--bg,#f0f4ff); min-height: 100vh; transition: background 0.3s; }

  body.theme-purple { --bg:#faf5ff; --nav1:#4c1d95; --nav2:#7c3aed; --accent:#7c3aed; --accent-dark:#4c1d95; --accent-light:#ede9fe; --accent-border:#ddd6fe; --accent-text:#c4b5fd; }
  body.theme-blue   { --bg:#f0f4ff; --nav1:#1e3a8a; --nav2:#3b82f6; --accent:#3b82f6; --accent-dark:#1e3a8a; --accent-light:#dbeafe; --accent-border:#bfdbfe; --accent-text:#93c5fd; }
  body.theme-green  { --bg:#f0fdf4; --nav1:#14532d; --nav2:#16a34a; --accent:#16a34a; --accent-dark:#14532d; --accent-light:#dcfce7; --accent-border:#bbf7d0; --accent-text:#86efac; }
  body.theme-rose   { --bg:#fff1f2; --nav1:#9f1239; --nav2:#e11d48; --accent:#e11d48; --accent-dark:#9f1239; --accent-light:#ffe4e6; --accent-border:#fecdd3; --accent-text:#fda4af; }
  body.theme-dark   { --bg:#0f172a; --nav1:#0f172a; --nav2:#1e293b; --accent:#6366f1; --accent-dark:#4338ca; --accent-light:#1e1b4b; --accent-border:#312e81; --accent-text:#a5b4fc; }

  .theme-bar { background: var(--accent-light); border-bottom: 1px solid var(--accent-border); padding: 8px 40px; display: flex; align-items: center; gap: 10px; }
  .theme-bar span { font-size: 12px; font-weight: 700; color: var(--accent-dark); }
  .theme-dot { width: 22px; height: 22px; border-radius: 50%; cursor: pointer; border: 2px solid transparent; transition: transform 0.2s, border-color 0.2s; }
  .theme-dot:hover { transform: scale(1.2); }
  .theme-dot.active { border-color: #fff; box-shadow: 0 0 0 2px var(--accent); }
  .dot-purple { background: linear-gradient(135deg,#4c1d95,#7c3aed); }
  .dot-blue   { background: linear-gradient(135deg,#1e3a8a,#3b82f6); }
  .dot-green  { background: linear-gradient(135deg,#14532d,#16a34a); }
  .dot-rose   { background: linear-gradient(135deg,#9f1239,#e11d48); }
  .dot-dark   { background: linear-gradient(135deg,#0f172a,#6366f1); }

  nav { background: linear-gradient(135deg, var(--nav1), var(--nav2)); padding: 0 40px; display: flex; justify-content: space-between; align-items: center; height: 64px; box-shadow: 0 2px 12px rgba(0,0,0,0.2); }
  .nav-brand { color: #fff; font-size: 22px; font-weight: 800; }
  .nav-brand span { color: var(--accent-text); }
  .nav-right { display: flex; align-items: center; gap: 16px; }
  .nav-user { color: var(--accent-text); font-size: 14px; font-weight: 500; }
  .nav-user strong { color: #fff; }
  .btn-nav { background: rgba(255,255,255,0.15); color: #fff; text-decoration: none; padding: 8px 18px; border-radius: 7px; font-size: 14px; font-weight: 600; border: 1px solid rgba(255,255,255,0.25); transition: background 0.2s; }
  .btn-nav:hover { background: rgba(255,255,255,0.25); }

  .page-header { background: linear-gradient(135deg, var(--nav1), var(--nav2)); color: #fff; padding: 36px 40px 50px; }
  .page-header-inner { max-width: 800px; margin: 0 auto; }
  .page-header h1 { font-size: 28px; font-weight: 800; margin-bottom: 6px; }
  .page-header p { color: var(--accent-text); font-size: 14px; }

  .main { max-width: 800px; margin: -24px auto 0; padding: 0 20px 60px; }

  .edit-card { background: #fff; border-radius: 16px; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border: 1px solid var(--accent-border); padding: 36px; }
  .edit-card h3 { font-size: 18px; font-weight: 800; color: #1e293b; margin-bottom: 28px; padding-bottom: 14px; border-bottom: 2px solid var(--accent-light); }
  .form-group { margin-bottom: 22px; }
  .form-group label { display: block; font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 7px; text-transform: uppercase; letter-spacing: 0.5px; }
  .form-group input { width: 100%; padding: 12px 16px; border: 2px solid #e5e7eb; border-radius: 9px; font-size: 14px; color: #1e293b; background: #fafafa; transition: border-color 0.2s; outline: none; }
  .form-group input:focus { border-color: var(--accent); background: #fff; }
  .form-group input[readonly] { background: #f3f4f6; color: #9ca3af; cursor: not-allowed; }
  .form-actions { display: flex; gap: 14px; margin-top: 8px; }
  .btn-submit { flex: 1; background: linear-gradient(135deg, var(--accent-dark), var(--accent)); color: #fff; padding: 13px 32px; border-radius: 9px; font-size: 15px; font-weight: 700; border: none; cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; box-shadow: 0 4px 14px rgba(0,0,0,0.18); }
  .btn-submit:hover { transform: translateY(-2px); }
  .btn-cancel { background: #fff; color: var(--accent); padding: 13px 24px; border-radius: 9px; font-size: 15px; font-weight: 600; text-decoration: none; border: 2px solid var(--accent-border); transition: background 0.2s; display: inline-flex; align-items: center; }
  .btn-cancel:hover { background: var(--accent-light); }
</style>
</head>
<body class="theme-blue" id="appBody">

<div class="theme-bar">
  <span>Theme:</span>
  <div class="theme-dot dot-purple" onclick="setTheme('purple')" title="Purple"></div>
  <div class="theme-dot dot-blue active" onclick="setTheme('blue')" title="Blue"></div>
  <div class="theme-dot dot-green"  onclick="setTheme('green')"  title="Green"></div>
  <div class="theme-dot dot-rose"   onclick="setTheme('rose')"   title="Rose"></div>
  <div class="theme-dot dot-dark"   onclick="setTheme('dark')"   title="Dark"></div>
</div>

<nav>
  <div class="nav-brand">EH<span>MS</span></div>
  <div class="nav-right">
    <span class="nav-user">Hello, <strong>${user.name}</strong></span>
    <a href="user-dashboard.jsp" class="btn-nav">Dashboard</a>
    <a href="logout" class="btn-nav">Logout</a>
  </div>
</nav>

<div class="page-header">
  <div class="page-header-inner">
    <h1>&#9998; Edit Profile</h1>
    <p>Update your account details below</p>
  </div>
</div>

<div class="main">
  <div class="edit-card">
    <h3>Update Profile</h3>
    <form action="edituserprofile" method="post">
      <div class="form-group"><label>User ID</label><input type="number" name="id" value="${user.id}" readonly></div>
      <div class="form-group"><label>Full Name</label><input type="text" name="name" value="${user.name}" required placeholder="Enter your full name"></div>
      <div class="form-group"><label>Email Address</label><input type="email" name="email" value="${user.email}" required placeholder="Enter your email"></div>
      <div class="form-group"><label>Password</label><input type="password" name="password" value="${user.password}" required placeholder="Enter new password"></div>
      <div class="form-actions">
        <button type="submit" class="btn-submit">&#10003; Save Changes</button>
        <a href="profile?id=${user.id}" class="btn-cancel">&#8592; Cancel</a>
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
    var saved = localStorage.getItem('ojpms-theme') || 'blue';
    setTheme(saved);
  })();
</script>
</body>
</html>