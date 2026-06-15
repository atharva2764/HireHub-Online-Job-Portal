<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - EHMS</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, var(--hero1,#1e3a8a) 0%, var(--hero2,#2563eb) 50%, var(--hero3,#0ea5e9) 100%); min-height: 100vh; display: flex; flex-direction: column; transition: all 0.3s; }

  body.theme-purple { --hero1:#4c1d95; --hero2:#6d28d9; --hero3:#7c3aed; --accent:#7c3aed; --accent-dark:#4c1d95; --accent-light:#ede9fe; --accent-border:#ddd6fe; --focus-c:#7c3aed; --left1:#4c1d95; --left2:#6d28d9; }
  body.theme-blue   { --hero1:#1e3a8a; --hero2:#2563eb; --hero3:#0ea5e9; --accent:#3b82f6; --accent-dark:#1e3a8a; --accent-light:#dbeafe; --accent-border:#bfdbfe; --focus-c:#3b82f6; --left1:#1e3a8a; --left2:#1d4ed8; }
  body.theme-green  { --hero1:#14532d; --hero2:#15803d; --hero3:#059669; --accent:#16a34a; --accent-dark:#14532d; --accent-light:#dcfce7; --accent-border:#bbf7d0; --focus-c:#16a34a; --left1:#14532d; --left2:#15803d; }
  body.theme-rose   { --hero1:#9f1239; --hero2:#be123c; --hero3:#e11d48; --accent:#e11d48; --accent-dark:#9f1239; --accent-light:#ffe4e6; --accent-border:#fecdd3; --focus-c:#e11d48; --left1:#9f1239; --left2:#be123c; }
  body.theme-dark   { --hero1:#0f172a; --hero2:#1e293b; --hero3:#334155; --accent:#6366f1; --accent-dark:#4338ca; --accent-light:#1e1b4b; --accent-border:#312e81; --focus-c:#6366f1; --left1:#0f172a; --left2:#1e1b4b; }

  .theme-float { position: fixed; top: 10px; right: 16px; background: rgba(255,255,255,0.15); backdrop-filter: blur(8px); border: 1px solid rgba(255,255,255,0.25); border-radius: 30px; padding: 6px 14px; display: flex; align-items: center; gap: 8px; z-index: 100; }
  .theme-float span { font-size: 11px; font-weight: 700; color: #fff; }
  .theme-dot { width: 18px; height: 18px; border-radius: 50%; cursor: pointer; border: 2px solid transparent; transition: transform 0.2s, border-color 0.2s; }
  .theme-dot:hover { transform: scale(1.2); }
  .theme-dot.active { border-color: #fff; }
  .dot-purple { background: linear-gradient(135deg,#4c1d95,#7c3aed); }
  .dot-blue   { background: linear-gradient(135deg,#1e3a8a,#3b82f6); }
  .dot-green  { background: linear-gradient(135deg,#14532d,#16a34a); }
  .dot-rose   { background: linear-gradient(135deg,#9f1239,#e11d48); }
  .dot-dark   { background: linear-gradient(135deg,#0f172a,#6366f1); }

  nav { background: rgba(0,0,0,0.2); padding: 14px 40px; display: flex; justify-content: space-between; align-items: center; }
  .nav-brand { color: #fff; font-size: 22px; font-weight: 800; text-decoration: none; }
  .nav-brand span { color: rgba(255,255,255,0.6); }
  .nav-links a { color: rgba(255,255,255,0.8); text-decoration: none; margin-left: 20px; font-size: 14px; font-weight: 500; padding: 6px 14px; border-radius: 6px; transition: background 0.2s; }
  .nav-links a:hover { background: rgba(255,255,255,0.15); color: #fff; }

  .main { flex: 1; display: flex; align-items: center; justify-content: center; padding: 50px 20px; }
  .login-wrapper { display: flex; gap: 0; max-width: 900px; width: 100%; border-radius: 18px; overflow: hidden; box-shadow: 0 24px 60px rgba(0,0,0,0.3); }
  .login-left { background: linear-gradient(160deg, var(--left1), var(--left2)); padding: 60px 40px; flex: 1; color: #fff; display: flex; flex-direction: column; justify-content: center; }
  .login-left h2 { font-size: 30px; font-weight: 900; margin-bottom: 14px; }
  .login-left p { color: rgba(255,255,255,0.75); font-size: 15px; line-height: 1.7; margin-bottom: 32px; }
  .login-perks { list-style: none; }
  .login-perks li { color: rgba(255,255,255,0.85); font-size: 14px; padding: 8px 0 8px 22px; position: relative; border-bottom: 1px solid rgba(255,255,255,0.08); }
  .login-perks li::before { content: '>'; position: absolute; left: 0; color: rgba(255,255,255,0.6); font-weight: 700; }

  .login-right { background: #fff; padding: 52px 44px; flex: 1.1; }
  .form-header { margin-bottom: 34px; }
  .form-header h1 { font-size: 28px; font-weight: 800; color: #1e293b; }
  .form-header p { color: #64748b; font-size: 14px; margin-top: 6px; }

  .form-group { margin-bottom: 22px; }
  .form-group label { display: block; font-size: 13px; font-weight: 600; color: #374151; margin-bottom: 7px; text-transform: uppercase; letter-spacing: 0.5px; }
  .input-wrap { position: relative; }
  .input-wrap .icon { position: absolute; left: 14px; top: 50%; transform: translateY(-50%); color: #9ca3af; font-size: 16px; font-weight: 700; }
  .input-wrap input { width: 100%; padding: 13px 14px 13px 42px; border: 2px solid #e5e7eb; border-radius: 9px; font-size: 15px; color: #1e293b; outline: none; transition: border-color 0.2s, box-shadow 0.2s; background: #f9fafb; }
  .input-wrap input:focus { border-color: var(--focus-c); box-shadow: 0 0 0 3px rgba(59,130,246,0.12); background: #fff; }

  .form-meta { display: flex; justify-content: flex-end; margin-bottom: 24px; }
  .form-meta a { color: var(--accent-dark); text-decoration: none; font-size: 13px; font-weight: 500; }
  .form-meta a:hover { text-decoration: underline; }

  .btn-submit { width: 100%; padding: 15px; background: linear-gradient(135deg, var(--left1), var(--accent,#3b82f6)); color: #fff; border: none; border-radius: 9px; font-size: 16px; font-weight: 700; cursor: pointer; transition: opacity 0.2s, transform 0.2s; }
  .btn-submit:hover { opacity: 0.92; transform: translateY(-1px); }

  .divider { text-align: center; color: #9ca3af; font-size: 13px; margin: 22px 0; position: relative; }
  .divider::before, .divider::after { content: ''; position: absolute; top: 50%; width: 42%; height: 1px; background: #e5e7eb; }
  .divider::before { left: 0; }
  .divider::after { right: 0; }

  .register-link { text-align: center; font-size: 14px; color: #64748b; }
  .register-link a { color: var(--accent-dark); font-weight: 700; text-decoration: none; }
  .register-link a:hover { text-decoration: underline; }

  .alert-error { background: #fef2f2; border: 1px solid #fecaca; border-left: 4px solid #ef4444; color: #b91c1c; padding: 12px 16px; border-radius: 8px; font-size: 14px; margin-bottom: 18px; }
  .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; border-left: 4px solid #22c55e; color: #15803d; padding: 12px 16px; border-radius: 8px; font-size: 14px; margin-bottom: 18px; }
</style>
</head>
<body class="theme-blue" id="appBody">

<div class="theme-float">
  <span>Theme</span>
  <div class="theme-dot dot-purple" onclick="setTheme('purple')" title="Purple"></div>
  <div class="theme-dot dot-blue active" onclick="setTheme('blue')" title="Blue"></div>
  <div class="theme-dot dot-green"  onclick="setTheme('green')"  title="Green"></div>
  <div class="theme-dot dot-rose"   onclick="setTheme('rose')"   title="Rose"></div>
  <div class="theme-dot dot-dark"   onclick="setTheme('dark')"   title="Dark"></div>
</div>

<nav>
  <a href="home.jsp" class="nav-brand">EH<span>MS</span></a>
  <div class="nav-links">
    <a href="home.jsp">Home</a>
    <a href="register.jsp">Register</a>
  </div>
</nav>

<div class="main">
  <div class="login-wrapper">
    <div class="login-left">
      <h2>Welcome Back!</h2>
      <p>Sign in to access your dashboard, view jobs, and manage your career journey.</p>
      <ul class="login-perks">
        <li>Browse thousands of job listings</li>
        <li>Apply with a single click</li>
        <li>Track all your applications</li>
        <li>Connect with top recruiters</li>
        <li>Get job alerts instantly</li>
      </ul>
    </div>
    <div class="login-right">
      <div class="form-header">
        <h1>Sign In</h1>
        <p>Enter your credentials to access your account</p>
      </div>
      <% if(request.getAttribute("error") != null && !request.getAttribute("error").toString().isEmpty()) { %>
      <div class="alert-error">${error}</div>
      <% } %>
      <% if(request.getAttribute("msg") != null && !request.getAttribute("msg").toString().isEmpty()) { %>
      <div class="alert-success">${msg}</div>
      <% } %>
      <form action="login" method="post">
        <div class="form-group">
          <label for="email">Email Address</label>
          <div class="input-wrap"><span class="icon">@</span><input type="email" id="email" name="email" placeholder="Enter your email" required></div>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <div class="input-wrap"><span class="icon">*</span><input type="password" id="password" name="password" placeholder="Enter your password" required></div>
        </div>
        <div class="form-meta"><a href="reset.jsp">Forgot Password?</a></div>
        <button type="submit" class="btn-submit">Login to Account</button>
      </form>
      <div class="divider">or</div>
      <div class="register-link">Don't have an account? <a href="register.jsp">Register here</a></div>
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