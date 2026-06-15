<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EHMS - Online Job Portal</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: var(--bg,#f0f4ff); min-height: 100vh; transition: background 0.3s; }

  body.theme-purple { --bg:#faf5ff; --nav1:#4c1d95; --nav2:#7c3aed; --accent:#7c3aed; --accent-dark:#4c1d95; --accent-light:#ede9fe; --accent-border:#ddd6fe; --accent-text:#c4b5fd; --hero1:#4c1d95; --hero2:#7c3aed; --hero3:#6d28d9; --stat-c:#4c1d95; --cta1:#4c1d95; --cta2:#6d28d9; }
  body.theme-blue   { --bg:#f0f4ff; --nav1:#1e3a8a; --nav2:#3b82f6; --accent:#3b82f6; --accent-dark:#1e3a8a; --accent-light:#dbeafe; --accent-border:#bfdbfe; --accent-text:#93c5fd; --hero1:#1e3a8a; --hero2:#2563eb; --hero3:#0ea5e9; --stat-c:#1e3a8a; --cta1:#1e3a8a; --cta2:#2563eb; }
  body.theme-green  { --bg:#f0fdf4; --nav1:#14532d; --nav2:#16a34a; --accent:#16a34a; --accent-dark:#14532d; --accent-light:#dcfce7; --accent-border:#bbf7d0; --accent-text:#86efac; --hero1:#14532d; --hero2:#15803d; --hero3:#059669; --stat-c:#14532d; --cta1:#14532d; --cta2:#15803d; }
  body.theme-rose   { --bg:#fff1f2; --nav1:#9f1239; --nav2:#e11d48; --accent:#e11d48; --accent-dark:#9f1239; --accent-light:#ffe4e6; --accent-border:#fecdd3; --accent-text:#fda4af; --hero1:#9f1239; --hero2:#be123c; --hero3:#e11d48; --stat-c:#9f1239; --cta1:#9f1239; --cta2:#be123c; }
  body.theme-dark   { --bg:#0f172a; --nav1:#0f172a; --nav2:#1e293b; --accent:#6366f1; --accent-dark:#4338ca; --accent-light:#1e1b4b; --accent-border:#312e81; --accent-text:#a5b4fc; --hero1:#0f172a; --hero2:#1e1b4b; --hero3:#312e81; --stat-c:#6366f1; --cta1:#1e1b4b; --cta2:#312e81; }

  /* Floating theme bar */
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

  nav { background: linear-gradient(135deg, var(--nav1), var(--nav2)); padding: 16px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 12px rgba(0,0,0,0.2); }
  .nav-brand { color: #fff; font-size: 24px; font-weight: 800; letter-spacing: 1px; }
  .nav-brand span { color: var(--accent-text); }
  .nav-links a { color: var(--accent-text); text-decoration: none; margin-left: 24px; font-size: 15px; font-weight: 500; padding: 8px 18px; border-radius: 6px; transition: background 0.2s; }
  .nav-links a:hover { background: rgba(255,255,255,0.15); color: #fff; }
  .nav-links a.btn-nav { background: #fff; color: var(--accent-dark); font-weight: 700; }
  .nav-links a.btn-nav:hover { background: var(--accent-light); }

  .hero { background: linear-gradient(135deg, var(--hero1) 0%, var(--hero2) 50%, var(--hero3) 100%); color: #fff; text-align: center; padding: 90px 40px 80px; }
  .hero-badge { display: inline-block; background: rgba(255,255,255,0.18); color: var(--accent-text); border: 1px solid rgba(255,255,255,0.3); border-radius: 50px; padding: 6px 20px; font-size: 13px; font-weight: 600; letter-spacing: 1px; margin-bottom: 22px; text-transform: uppercase; }
  .hero h1 { font-size: 52px; font-weight: 900; line-height: 1.15; margin-bottom: 18px; }
  .hero h1 span { color: var(--accent-text); }
  .hero p { font-size: 18px; color: var(--accent-text); max-width: 560px; margin: 0 auto 38px; line-height: 1.6; }
  .hero-buttons a { display: inline-block; text-decoration: none; padding: 15px 36px; border-radius: 8px; font-size: 16px; font-weight: 700; margin: 0 10px; transition: all 0.25s; }
  .btn-primary { background: #fff; color: var(--accent-dark); }
  .btn-primary:hover { background: var(--accent-light); transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,0.2); }
  .btn-outline { background: transparent; color: #fff; border: 2px solid rgba(255,255,255,0.6); }
  .btn-outline:hover { background: rgba(255,255,255,0.12); transform: translateY(-2px); }

  .stats-bar { background: #fff; display: flex; justify-content: center; box-shadow: 0 2px 16px rgba(0,0,0,0.08); }
  .stat-item { padding: 28px 50px; text-align: center; border-right: 1px solid #e5e7eb; }
  .stat-item:last-child { border-right: none; }
  .stat-num { font-size: 32px; font-weight: 900; color: var(--stat-c); display: block; }
  .stat-label { font-size: 13px; color: #6b7280; font-weight: 500; margin-top: 4px; }

  .section { padding: 70px 40px; }
  .section-title { text-align: center; font-size: 34px; font-weight: 800; color: #1e293b; margin-bottom: 10px; }
  .section-sub { text-align: center; color: #64748b; font-size: 16px; margin-bottom: 50px; }
  .cards-grid { display: flex; justify-content: center; gap: 28px; flex-wrap: wrap; max-width: 1100px; margin: 0 auto; }
  .feature-card { background: #fff; border-radius: 14px; padding: 36px 30px; width: 280px; text-align: center; box-shadow: 0 2px 20px rgba(0,0,0,0.07); border: 1px solid #e8edf5; transition: transform 0.25s, box-shadow 0.25s; }
  .feature-card:hover { transform: translateY(-6px); box-shadow: 0 10px 36px rgba(0,0,0,0.12); }
  .feature-icon { width: 64px; height: 64px; border-radius: 16px; margin: 0 auto 20px; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: 900; }
  .icon-blue { background: #dbeafe; color: #1d4ed8; }
  .icon-green { background: #dcfce7; color: #16a34a; }
  .icon-purple { background: #ede9fe; color: #7c3aed; }
  .feature-card h3 { font-size: 18px; font-weight: 700; color: #1e293b; margin-bottom: 10px; }
  .feature-card p { font-size: 14px; color: #64748b; line-height: 1.6; }

  .how-section { background: #f8faff; padding: 70px 40px; }
  .steps-grid { display: flex; justify-content: center; gap: 0; max-width: 900px; margin: 0 auto; flex-wrap: wrap; }
  .step-item { text-align: center; padding: 30px 40px; flex: 1; min-width: 200px; position: relative; }
  .step-item:not(:last-child)::after { content: '--->'; position: absolute; right: -10px; top: 44px; color: var(--accent-text,#93c5fd); font-size: 20px; font-weight: bold; }
  .step-num { width: 54px; height: 54px; background: linear-gradient(135deg, var(--hero1), var(--hero2)); color: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 22px; font-weight: 800; margin: 0 auto 16px; }
  .step-item h4 { font-size: 16px; font-weight: 700; color: #1e293b; margin-bottom: 8px; }
  .step-item p { font-size: 13px; color: #64748b; }

  .cta-section { background: linear-gradient(135deg, var(--cta1), var(--cta2)); color: #fff; text-align: center; padding: 70px 40px; }
  .cta-section h2 { font-size: 36px; font-weight: 800; margin-bottom: 14px; }
  .cta-section p { color: var(--accent-text); font-size: 16px; margin-bottom: 36px; }
  .cta-buttons a { display: inline-block; text-decoration: none; padding: 14px 34px; border-radius: 8px; font-size: 15px; font-weight: 700; margin: 0 10px; transition: all 0.25s; }
  .cta-buttons .btn-white { background: #fff; color: var(--accent-dark); }
  .cta-buttons .btn-white:hover { background: var(--accent-light); transform: translateY(-2px); }
  .cta-buttons .btn-border { border: 2px solid rgba(255,255,255,0.5); color: #fff; }
  .cta-buttons .btn-border:hover { background: rgba(255,255,255,0.1); transform: translateY(-2px); }

  footer { background: #0f172a; color: #94a3b8; text-align: center; padding: 24px; font-size: 14px; }
  footer span { color: var(--accent,#3b82f6); }
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
  <div class="nav-links">
    <a href="home.jsp">Home</a>
    <a href="login.jsp">Login</a>
    <a href="register.jsp" class="btn-nav">Get Started</a>
  </div>
</nav>

<div class="hero">
  <div class="hero-badge">Enterprise Hiring Management System</div>
  <h1>Find Your Dream Job<br><span>Or Hire Top Talent</span></h1>
  <p>Connecting job seekers with the best opportunities and helping recruiters find the perfect candidates faster than ever.</p>
  <div class="hero-buttons">
    <a href="register.jsp" class="btn-primary">Create Account</a>
    <a href="login.jsp" class="btn-outline">Sign In</a>
  </div>
</div>

<div class="stats-bar">
  <div class="stat-item"><span class="stat-num">5,000+</span><span class="stat-label">Active Jobs</span></div>
  <div class="stat-item"><span class="stat-num">12,000+</span><span class="stat-label">Job Seekers</span></div>
  <div class="stat-item"><span class="stat-num">800+</span><span class="stat-label">Companies</span></div>
  <div class="stat-item"><span class="stat-num">98%</span><span class="stat-label">Success Rate</span></div>
</div>

<div class="section">
  <div class="section-title">Why Choose EHMS?</div>
  <div class="section-sub">Everything you need in one powerful platform</div>
  <div class="cards-grid">
    <div class="feature-card"><div class="feature-icon icon-blue">J</div><h3>Smart Job Matching</h3><p>Browse and apply to thousands of jobs filtered by your skills, location, and salary expectations.</p></div>
    <div class="feature-card"><div class="feature-icon icon-green">R</div><h3>Recruiter Tools</h3><p>Post jobs, manage applications, and find top candidates efficiently with our recruiter dashboard.</p></div>
    <div class="feature-card"><div class="feature-icon icon-purple">S</div><h3>Secure &amp; Reliable</h3><p>Your data is protected with encrypted credentials and a secure session management system.</p></div>
  </div>
</div>

<div class="how-section">
  <div class="section-title">How It Works</div>
  <div class="section-sub">Get started in just a few simple steps</div>
  <div class="steps-grid">
    <div class="step-item"><div class="step-num">1</div><h4>Register</h4><p>Create your free account as a Job Seeker or Recruiter.</p></div>
    <div class="step-item"><div class="step-num">2</div><h4>Explore</h4><p>Browse job listings or post new openings.</p></div>
    <div class="step-item"><div class="step-num">3</div><h4>Apply</h4><p>Apply to jobs or receive applications from candidates.</p></div>
    <div class="step-item"><div class="step-num">4</div><h4>Succeed</h4><p>Land your dream job or build your team.</p></div>
  </div>
</div>

<div class="cta-section">
  <h2>Ready to Get Started?</h2>
  <p>Join thousands of professionals already using OJPMS today.</p>
  <div class="cta-buttons">
    <a href="register.jsp" class="btn-white">Register Now</a>
    <a href="login.jsp" class="btn-border">Login</a>
  </div>
</div>

<footer>&copy; 2025 <span>OJPMS</span> -Enterprise Hiring  Management System. All rights reserved.</footer>

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