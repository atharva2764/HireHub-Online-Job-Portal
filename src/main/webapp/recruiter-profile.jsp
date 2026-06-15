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
<title>Recruiter Profile - EHMS</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #faf5ff;
    min-height: 100vh;
  }

  /* ===== NAVBAR ===== */
  nav {
    background: linear-gradient(135deg, #4c1d95, #7c3aed);
    padding: 0 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 64px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.2);
  }
  .nav-brand { color: #fff; font-size: 22px; font-weight: 800; }
  .nav-brand span { color: #c4b5fd; }
  .nav-right { display: flex; align-items: center; gap: 16px; }
  .nav-user { color: #ddd6fe; font-size: 14px; font-weight: 500; }
  .nav-user strong { color: #fff; }
  .btn-nav {
    background: rgba(255,255,255,0.15);
    color: #fff;
    text-decoration: none;
    padding: 8px 18px;
    border-radius: 7px;
    font-size: 14px;
    font-weight: 600;
    border: 1px solid rgba(255,255,255,0.25);
    transition: background 0.2s;
  }
  .btn-nav:hover { background: rgba(255,255,255,0.25); }

  /* ===== PAGE HEADER ===== */
  .page-header {
    background: linear-gradient(135deg, #4c1d95, #7c3aed);
    color: #fff;
    padding: 36px 40px 50px;
  }
  .page-header-inner { max-width: 800px; margin: 0 auto; }
  .page-header h1 { font-size: 28px; font-weight: 800; margin-bottom: 6px; }
  .page-header p { color: #ddd6fe; font-size: 14px; }

  /* ===== MAIN CONTENT ===== */
  .main { max-width: 800px; margin: -24px auto 0; padding: 0 20px 60px; position: relative; }

  /* ===== SUCCESS MESSAGE ===== */
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

  /* ===== PROFILE CARD ===== */
  .profile-card {
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 4px 24px rgba(76,29,149,0.1);
    border: 1px solid #ede9fe;
    overflow: hidden;
    margin-bottom: 24px;
  }

  .profile-card-header {
    background: linear-gradient(135deg, #ede9fe, #f5f3ff);
    padding: 32px 36px;
    display: flex;
    align-items: center;
    gap: 24px;
    border-bottom: 1px solid #e9d5ff;
  }
  .avatar {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #4c1d95, #7c3aed);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 32px;
    font-weight: 900;
    color: #fff;
    flex-shrink: 0;
    box-shadow: 0 4px 14px rgba(124,58,237,0.35);
  }
  .profile-header-info h2 {
    font-size: 22px;
    font-weight: 800;
    color: #1e293b;
    margin-bottom: 4px;
  }
  .profile-header-info .role-tag {
    display: inline-block;
    background: #7c3aed;
    color: #fff;
    font-size: 11px;
    font-weight: 700;
    padding: 3px 12px;
    border-radius: 20px;
    text-transform: uppercase;
    letter-spacing: 0.8px;
  }

  /* ===== PROFILE FIELDS ===== */
  .profile-fields { padding: 32px 36px; }
  .field-row {
    display: flex;
    align-items: flex-start;
    padding: 18px 0;
    border-bottom: 1px solid #f3f4f6;
  }
  .field-row:last-child { border-bottom: none; }
  .field-icon {
    width: 40px;
    height: 40px;
    background: #f5f3ff;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 17px;
    margin-right: 20px;
    flex-shrink: 0;
    color: #7c3aed;
    font-weight: 700;
  }
  .field-content { flex: 1; }
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
  .field-value.masked { letter-spacing: 3px; color: #64748b; }

  /* ===== UPDATE BUTTON ===== */
  .profile-actions {
    padding: 0 36px 32px;
    display: flex;
    gap: 14px;
    align-items: center;
  }
  .btn-update {
    background: linear-gradient(135deg, #4c1d95, #7c3aed);
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
    box-shadow: 0 4px 14px rgba(124,58,237,0.35);
  }
  .btn-update:hover { transform: translateY(-2px); box-shadow: 0 8px 22px rgba(124,58,237,0.42); }
  .btn-back {
    background: #fff;
    color: #7c3aed;
    padding: 13px 24px;
    border-radius: 9px;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    border: 2px solid #ddd6fe;
    transition: background 0.2s, border-color 0.2s;
  }
  .btn-back:hover { background: #f5f3ff; border-color: #c4b5fd; }

  /* ===== EDIT FORM CARD ===== */
  .edit-card {
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 4px 24px rgba(76,29,149,0.1);
    border: 1px solid #ede9fe;
    padding: 36px;
    display: none;
  }
  .edit-card.active { display: block; }
  .edit-card h3 {
    font-size: 18px;
    font-weight: 800;
    color: #1e293b;
    margin-bottom: 28px;
    padding-bottom: 14px;
    border-bottom: 2px solid #ede9fe;
  }
  .form-group { margin-bottom: 22px; }
  .form-group label {
    display: block;
    font-size: 13px;
    font-weight: 700;
    color: #374151;
    margin-bottom: 7px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }
  .form-group input {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e5e7eb;
    border-radius: 9px;
    font-size: 14px;
    color: #1e293b;
    background: #fafafa;
    transition: border-color 0.2s, background 0.2s;
    outline: none;
  }
  .form-group input:focus { border-color: #7c3aed; background: #fff; }
  .form-group input[readonly] {
    background: #f3f4f6;
    color: #9ca3af;
    cursor: not-allowed;
  }
  .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 18px; }
  .btn-submit {
    background: linear-gradient(135deg, #4c1d95, #7c3aed);
    color: #fff;
    padding: 13px 32px;
    border-radius: 9px;
    font-size: 15px;
    font-weight: 700;
    border: none;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    box-shadow: 0 4px 14px rgba(124,58,237,0.35);
    width: 100%;
    margin-top: 6px;
  }
  .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 8px 22px rgba(124,58,237,0.42); }
</style>
</head>
<body>

<nav>
  <div class="nav-brand">OJ<span>PMS</span></div>
  <div class="nav-right">
    <span class="nav-user">Hello, <strong>${user.name}</strong></span>
    <a href="recruiter-dashboard.jsp" class="btn-nav">Dashboard</a>
    <a href="logout-confirm" class="btn-nav">Logout</a>
  </div>
</nav>

<div class="page-header">
  <div class="page-header-inner">
    <h1>My Profile</h1>
    <p>View and manage your recruiter account details</p>
  </div>
</div>

<div class="main">

  <%-- Success message --%>
  <c:if test="${not empty msg}" xmlns:c="http://java.sun.com/jsp/jstl/core">
    <div class="alert-success">&#10003; ${msg}</div>
  </c:if>
  <%
    String msg = (String) request.getAttribute("msg");
    if (msg != null && !msg.isEmpty()) {
  %>
    <div class="alert-success">&#10003; <%= msg %></div>
  <% } %>

  <%-- PROFILE VIEW CARD --%>
  <div class="profile-card" id="profileView">
    <div class="profile-card-header">
      <div class="avatar">${user.name.substring(0,1).toUpperCase()}</div>
      <div class="profile-header-info">
        <h2>${user.name}</h2>
        <span class="role-tag">Recruiter</span>
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
          <div class="field-value masked">&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;</div>
        </div>
      </div>
    </div>

    <div class="profile-actions">
      <button class="btn-update" onclick="showEditForm()">&#9998; Update Profile</button>
      <a href="recruiter-dashboard.jsp" class="btn-back">&#8592; Back to Dashboard</a>
    </div>
  </div>

  <%-- EDIT FORM CARD --%>
  <div class="edit-card" id="editCard">
    <h3>&#9998; Update Profile</h3>
    <form action="recruiter-profile" method="post">
      <input type="hidden" name="id" value="${user.id}">

      <div class="form-group">
        <label>User ID</label>
        <input type="text" value="${user.id}" readonly>
      </div>

      <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="name" value="${user.name}" required placeholder="Enter your full name">
      </div>

      <div class="form-group">
        <label>Email Address</label>
        <input type="email" name="email" value="${user.email}" required placeholder="Enter your email">
      </div>

      <div class="form-group">
        <label>Password</label>
        <input type="password" name="password" value="${user.password}" required placeholder="Enter new password">
      </div>

      <div class="form-group">
        <label>Role</label>
        <input type="text" value="${user.role}" readonly>
      </div>

      <button type="submit" class="btn-submit">&#10003; Save Changes</button>
    </form>
    <br>
    <a href="#" onclick="hideEditForm(); return false;" class="btn-back" style="display:inline-block; text-align:center; width:100%;">Cancel</a>
  </div>

</div>

<script>
  function showEditForm() {
    document.getElementById('profileView').style.display = 'none';
    document.getElementById('editCard').classList.add('active');
    window.scrollTo({top: 0, behavior: 'smooth'});
  }
  function hideEditForm() {
    document.getElementById('profileView').style.display = 'block';
    document.getElementById('editCard').classList.remove('active');
  }
</script>

</body>
</html>
