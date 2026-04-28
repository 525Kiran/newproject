<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>NexusShop — Luxury E-Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,500;0,700;1,400&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

  <style>
    :root {
      --bg: #0c0c0f;
      --bg2: #111118;
      --surface: #16161e;
      --card: #1a1a24;
      --gold: #c9a84c;
      --gold2: #f0d080;
      --gold-glow: rgba(201,168,76,0.18);
      --cream: #f5efe0;
      --muted: #8888aa;
      --text: #e8e4dc;
      --accent: #c9a84c;
      --radius: 16px;
      --radius-sm: 10px;
      --container: 1240px;
      --border: rgba(201,168,76,0.12);
    }
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }
    a { color: inherit; text-decoration: none; }

    /* ── NOISE TEXTURE OVERLAY ── */
    body::before {
      content: '';
      position: fixed; inset: 0; z-index: 0; pointer-events: none;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");
      opacity: 0.4;
    }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 24px; position: relative; }

    /* ── HEADER ── */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(12,12,15,0.85);
      backdrop-filter: blur(20px);
      border-bottom: 1px solid var(--border);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between;
      gap: 16px; padding: 16px 0;
    }
    .brand {
      font-family: 'Playfair Display', serif;
      font-size: 22px; font-weight: 700;
      letter-spacing: 0.04em;
      color: var(--cream);
    }
    .brand span { color: var(--gold); }

    nav.main-nav ul { display: flex; gap: 4px; list-style: none; }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 7px;
      padding: 8px 14px; border-radius: var(--radius-sm);
      font-size: 14px; font-weight: 500; color: var(--muted);
      transition: color .2s, background .2s;
    }
    nav.main-nav li a:hover { color: var(--gold); background: var(--gold-glow); }
    nav.main-nav li a i { font-size: 12px; }

    .search-wrap {
      display: flex; align-items: center; gap: 10px;
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 999px;
      padding: 9px 16px;
      min-width: 220px;
      transition: border-color .2s;
    }
    .search-wrap:focus-within { border-color: var(--gold); }
    .search-wrap input {
      background: transparent; border: 0; outline: none;
      color: var(--text); font-size: 14px; width: 100%;
    }
    .search-wrap input::placeholder { color: var(--muted); }
    .search-wrap button { background: none; border: 0; color: var(--muted); cursor: pointer; font-size: 14px; transition: color .2s; }
    .search-wrap button:hover { color: var(--gold); }

    .header-actions { display: flex; align-items: center; gap: 6px; }
    .icon-btn {
      background: transparent; border: 0; cursor: pointer;
      color: var(--muted); font-size: 16px;
      width: 38px; height: 38px; border-radius: var(--radius-sm);
      display: inline-flex; align-items: center; justify-content: center;
      transition: color .2s, background .2s;
    }
    .icon-btn:hover { color: var(--gold); background: var(--gold-glow); }

    .cart-btn {
      position: relative; display: inline-flex; align-items: center; gap: 8px;
      background: var(--gold); color: #1a0e00;
      padding: 9px 18px; border-radius: 999px;
      font-weight: 600; font-size: 14px;
      transition: background .2s, transform .15s;
    }
    .cart-btn:hover { background: var(--gold2); transform: translateY(-1px); }
    .cart-count {
      background: #1a0e00; color: var(--gold);
      font-size: 11px; font-weight: 700;
      width: 20px; height: 20px; border-radius: 50%;
      display: inline-grid; place-items: center;
    }
    .mobile-toggle { display: none; border: 0; background: none; color: var(--text); font-size: 20px; cursor: pointer; }

    /* ── HERO ── */
    .hero {
      position: relative; overflow: hidden;
      min-height: 560px;
      display: flex; align-items: center;
      padding: 80px 0;
    }
    .hero-bg {
      position: absolute; inset: 0; z-index: 0;
      background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
    }
    .hero-bg::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(120deg, rgba(12,12,15,0.95) 45%, rgba(12,12,15,0.6) 100%);
    }
    .hero-mesh {
      position: absolute; inset: 0; z-index: 1;
      background:
        radial-gradient(ellipse 60% 70% at 10% 50%, rgba(201,168,76,0.12) 0%, transparent 70%),
        radial-gradient(ellipse 40% 50% at 80% 80%, rgba(201,168,76,0.06) 0%, transparent 60%);
    }
    .hero-content { position: relative; z-index: 2; max-width: 580px; }
    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 10px;
      font-size: 12px; font-weight: 600; letter-spacing: 0.15em; text-transform: uppercase;
      color: var(--gold);
      background: rgba(201,168,76,0.1); border: 1px solid rgba(201,168,76,0.25);
      padding: 6px 14px; border-radius: 999px; margin-bottom: 22px;
      animation: fadeInUp .6s ease both;
    }
    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(38px, 5vw, 62px);
      font-weight: 700; line-height: 1.1;
      letter-spacing: -0.02em; color: var(--cream);
      margin-bottom: 20px;
      animation: fadeInUp .7s .1s ease both;
    }
    .hero h1 em { font-style: italic; color: var(--gold); }
    .hero p {
      font-size: 17px; color: var(--muted); line-height: 1.7;
      margin-bottom: 36px;
      animation: fadeInUp .7s .2s ease both;
    }
    .hero-btns { display: flex; gap: 14px; flex-wrap: wrap; animation: fadeInUp .7s .3s ease both; }
    .btn {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 13px 26px; border-radius: 999px; font-weight: 600; font-size: 15px;
      cursor: pointer; border: 0; transition: all .2s;
    }
    .btn-gold {
      background: var(--gold); color: #1a0e00;
    }
    .btn-gold:hover { background: var(--gold2); transform: translateY(-2px); box-shadow: 0 8px 30px rgba(201,168,76,0.35); }
    .btn-outline {
      background: transparent; color: var(--cream);
      border: 1.5px solid rgba(255,255,255,0.2);
    }
    .btn-outline:hover { border-color: var(--gold); color: var(--gold); background: var(--gold-glow); }

    .hero-stats {
      position: relative; z-index: 2;
      display: flex; gap: 32px; margin-top: 52px;
      animation: fadeInUp .7s .4s ease both;
    }
    .hero-stat { text-align: left; }
    .hero-stat .num {
      font-family: 'Playfair Display', serif;
      font-size: 28px; font-weight: 700; color: var(--gold);
    }
    .hero-stat .label { font-size: 13px; color: var(--muted); margin-top: 2px; }

    /* ── SECTION ── */
    .section { padding: 72px 0; }
    .section-head { text-align: center; margin-bottom: 48px; }
    .section-eyebrow {
      display: inline-block; font-size: 12px; font-weight: 600;
      letter-spacing: 0.15em; text-transform: uppercase;
      color: var(--gold); margin-bottom: 12px;
    }
    .section-head h2 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(26px, 3.5vw, 40px);
      font-weight: 700; color: var(--cream);
      letter-spacing: -0.01em; margin-bottom: 12px;
    }
    .section-head p { color: var(--muted); font-size: 16px; max-width: 500px; margin: 0 auto; }

    /* ── CATEGORIES ── */
    .cat-grid { display: grid; grid-template-columns: repeat(6, 1fr); gap: 16px; }
    .cat-card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius); padding: 24px 16px;
      text-align: center; cursor: pointer;
      transition: transform .25s, border-color .25s, box-shadow .25s;
      position: relative; overflow: hidden;
    }
    .cat-card::before {
      content: ''; position: absolute; inset: 0;
      background: linear-gradient(135deg, var(--gold-glow), transparent);
      opacity: 0; transition: opacity .3s;
    }
    .cat-card:hover { transform: translateY(-6px); border-color: rgba(201,168,76,0.4); box-shadow: 0 20px 50px rgba(0,0,0,0.4); }
    .cat-card:hover::before { opacity: 1; }
    .cat-icon {
      width: 54px; height: 54px; border-radius: 14px;
      background: rgba(201,168,76,0.1); border: 1px solid rgba(201,168,76,0.2);
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto 14px; font-size: 22px; color: var(--gold);
      transition: background .25s;
    }
    .cat-card:hover .cat-icon { background: rgba(201,168,76,0.2); }
    .cat-card h4 { font-size: 14px; font-weight: 600; color: var(--cream); margin-bottom: 4px; }
    .cat-card span { font-size: 12px; color: var(--muted); }

    /* ── PRODUCTS ── */
    .prod-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
    .product {
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); overflow: hidden;
      display: flex; flex-direction: column;
      transition: transform .25s, box-shadow .25s, border-color .25s;
      position: relative;
    }
    .product:hover { transform: translateY(-6px); box-shadow: 0 30px 60px rgba(0,0,0,0.5); border-color: rgba(201,168,76,0.3); }
    .product-img-wrap { position: relative; overflow: hidden; }
    .product img { width: 100%; height: 220px; object-fit: cover; display: block; transition: transform .4s ease; }
    .product:hover img { transform: scale(1.07); }
    .prod-badge {
      position: absolute; top: 12px; left: 12px; z-index: 2;
      padding: 5px 10px; border-radius: 8px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.05em;
    }
    .badge-new { background: var(--gold); color: #1a0e00; }
    .badge-sale { background: #e55; color: white; }
    .wish-btn {
      position: absolute; top: 12px; right: 12px; z-index: 2;
      width: 34px; height: 34px; border-radius: 50%;
      background: rgba(12,12,15,0.75); backdrop-filter: blur(6px);
      border: 1px solid rgba(255,255,255,0.1);
      color: var(--muted); font-size: 14px;
      display: flex; align-items: center; justify-content: center;
      cursor: pointer; transition: all .2s;
      opacity: 0; transform: translateY(-4px);
    }
    .product:hover .wish-btn { opacity: 1; transform: translateY(0); }
    .wish-btn:hover { color: #e55; border-color: #e55; }
    .product-body { padding: 16px; flex: 1; display: flex; flex-direction: column; gap: 8px; }
    .prod-category { font-size: 11px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gold); }
    .product h5 { font-size: 15px; font-weight: 600; color: var(--cream); line-height: 1.4; }
    .price-row { display: flex; align-items: center; justify-content: space-between; margin-top: 4px; }
    .price { font-size: 18px; font-weight: 700; color: var(--cream); }
    .old-price { font-size: 13px; color: var(--muted); text-decoration: line-through; margin-left: 6px; }
    .rating { display: flex; align-items: center; gap: 4px; font-size: 12px; color: var(--gold); }
    .rating span { color: var(--muted); }
    .add-btn {
      width: 100%; padding: 12px;
      background: transparent; border: 1.5px solid var(--border);
      color: var(--text); border-radius: var(--radius-sm);
      font-weight: 600; font-size: 14px; cursor: pointer;
      display: flex; align-items: center; justify-content: center; gap: 8px;
      transition: all .22s; margin-top: 4px;
    }
    .add-btn:hover { background: var(--gold); border-color: var(--gold); color: #1a0e00; }

    /* ── DEAL BANNER ── */
    .deal-section { padding: 72px 0; }
    .deal-inner {
      background: linear-gradient(135deg, var(--card) 60%, rgba(201,168,76,0.06));
      border: 1px solid var(--border);
      border-radius: 24px; overflow: hidden;
      display: grid; grid-template-columns: 1fr 1fr;
      position: relative;
    }
    .deal-inner::before {
      content: ''; position: absolute;
      left: 0; top: 0; bottom: 0; width: 50%;
      background: linear-gradient(90deg, rgba(201,168,76,0.06), transparent);
      pointer-events: none;
    }
    .deal-img { position: relative; overflow: hidden; min-height: 380px; }
    .deal-img img { width: 100%; height: 100%; object-fit: cover; display: block; transition: transform 6s ease; }
    .deal-inner:hover .deal-img img { transform: scale(1.04); }
    .deal-content { padding: 52px 48px; display: flex; flex-direction: column; justify-content: center; gap: 20px; }
    .deal-eyebrow {
      display: inline-flex; align-items: center; gap: 8px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.15em; text-transform: uppercase;
      color: #e55; background: rgba(238,85,85,0.1); border: 1px solid rgba(238,85,85,0.2);
      padding: 5px 12px; border-radius: 999px; width: fit-content;
    }
    .deal-content h3 {
      font-family: 'Playfair Display', serif;
      font-size: 36px; font-weight: 700; color: var(--cream); line-height: 1.2;
    }
    .deal-content p { color: var(--muted); font-size: 15px; line-height: 1.6; }
    .timer { display: flex; gap: 12px; }
    .time-box {
      background: rgba(201,168,76,0.1); border: 1px solid rgba(201,168,76,0.2);
      border-radius: 12px; padding: 14px 20px; text-align: center; min-width: 72px;
    }
    .time-box .num { font-family: 'Playfair Display', serif; font-size: 28px; font-weight: 700; color: var(--gold); line-height: 1; }
    .time-box .lbl { font-size: 11px; color: var(--muted); margin-top: 4px; letter-spacing: 0.06em; }
    .deal-price-row { display: flex; align-items: center; gap: 14px; }
    .deal-price { font-size: 32px; font-weight: 700; color: var(--cream); font-family: 'Playfair Display', serif; }
    .deal-old { font-size: 16px; color: var(--muted); text-decoration: line-through; }
    .deal-tag { background: #e55; color: white; padding: 6px 12px; border-radius: 8px; font-weight: 700; font-size: 13px; }
    .stock-bar { background: rgba(255,255,255,0.05); border-radius: 999px; height: 6px; margin-top: 6px; }
    .stock-fill { height: 100%; background: linear-gradient(90deg, var(--gold), var(--gold2)); border-radius: 999px; width: 24%; }

    /* ── TESTIMONIALS ── */
    .test-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
    .test-card {
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); padding: 28px;
      transition: border-color .25s, transform .25s;
    }
    .test-card:hover { border-color: rgba(201,168,76,0.3); transform: translateY(-4px); }
    .test-stars { color: var(--gold); font-size: 14px; margin-bottom: 14px; letter-spacing: 2px; }
    .test-text { color: var(--muted); font-size: 15px; line-height: 1.7; font-style: italic; margin-bottom: 20px; }
    .test-author { display: flex; align-items: center; gap: 12px; }
    .test-avatar { width: 44px; height: 44px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(201,168,76,0.3); }
    .test-name { font-weight: 600; color: var(--cream); font-size: 14px; }
    .test-role { font-size: 12px; color: var(--muted); margin-top: 2px; }

    /* ── NEWSLETTER ── */
    .newsletter {
      background: linear-gradient(135deg, #1a1410 0%, #1a160a 100%);
      border: 1px solid rgba(201,168,76,0.2);
      border-radius: 24px; padding: 64px;
      text-align: center; position: relative; overflow: hidden;
    }
    .newsletter::before {
      content: ''; position: absolute;
      top: -80px; left: 50%; transform: translateX(-50%);
      width: 400px; height: 400px; border-radius: 50%;
      background: radial-gradient(circle, rgba(201,168,76,0.12), transparent 70%);
      pointer-events: none;
    }
    .newsletter h3 {
      font-family: 'Playfair Display', serif;
      font-size: 36px; font-weight: 700; color: var(--cream); margin-bottom: 12px;
    }
    .newsletter p { color: var(--muted); font-size: 16px; margin-bottom: 30px; }
    .newsletter-form {
      display: flex; justify-content: center; gap: 10px; flex-wrap: wrap;
    }
    .newsletter-form input {
      background: rgba(255,255,255,0.05); border: 1px solid rgba(201,168,76,0.2);
      border-radius: 999px; padding: 13px 22px; color: var(--text);
      font-size: 15px; outline: none; width: 300px; max-width: 100%;
      transition: border-color .2s;
    }
    .newsletter-form input:focus { border-color: var(--gold); }
    .newsletter-form input::placeholder { color: var(--muted); }
    #newsletterMsg { margin-top: 14px; font-size: 14px; }

    /* ── FOOTER ── */
    footer {
      margin-top: 80px; padding: 60px 0 30px;
      border-top: 1px solid var(--border);
    }
    .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 48px; margin-bottom: 48px; }
    .footer-brand {
      font-family: 'Playfair Display', serif;
      font-size: 22px; color: var(--cream); margin-bottom: 14px;
    }
    .footer-brand span { color: var(--gold); }
    .footer-desc { color: var(--muted); font-size: 14px; line-height: 1.7; margin-bottom: 20px; }
    .footer-socials { display: flex; gap: 10px; }
    .footer-col h5 { font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.1em; color: var(--cream); margin-bottom: 18px; }
    .footer-col ul { list-style: none; display: flex; flex-direction: column; gap: 10px; }
    .footer-col ul li a { font-size: 14px; color: var(--muted); transition: color .2s; }
    .footer-col ul li a:hover { color: var(--gold); }
    .footer-bottom { border-top: 1px solid var(--border); padding-top: 24px; text-align: center; color: var(--muted); font-size: 13px; }

    /* ── ANIMATIONS ── */
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(22px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    .fade-up { opacity: 0; transform: translateY(22px); transition: opacity .6s ease, transform .6s ease; }
    .fade-up.visible { opacity: 1; transform: translateY(0); }

    /* ── SCROLLBAR ── */
    ::-webkit-scrollbar { width: 6px; height: 6px; }
    ::-webkit-scrollbar-track { background: var(--bg); }
    ::-webkit-scrollbar-thumb { background: rgba(201,168,76,0.3); border-radius: 3px; }

    /* ── RESPONSIVE ── */
    @media (max-width: 1100px) {
      .cat-grid { grid-template-columns: repeat(3, 1fr); }
      .prod-grid { grid-template-columns: repeat(3, 1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr; gap: 32px; }
    }
    @media (max-width: 900px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: inline-flex; }
      .prod-grid { grid-template-columns: repeat(2, 1fr); }
      .cat-grid { grid-template-columns: repeat(2, 1fr); }
      .deal-inner { grid-template-columns: 1fr; }
      .deal-img { min-height: 260px; }
      .test-grid { grid-template-columns: repeat(2, 1fr); }
      .hero { min-height: 480px; padding: 60px 0; }
    }
    @media (max-width: 600px) {
      .prod-grid { grid-template-columns: 1fr; }
      .cat-grid { grid-template-columns: repeat(2, 1fr); }
      .test-grid { grid-template-columns: 1fr; }
      .hero h1 { font-size: 32px; }
      .hero-stats { gap: 22px; }
      .deal-content { padding: 28px 22px; }
      .newsletter { padding: 36px 22px; }
      .footer-grid { grid-template-columns: 1fr; gap: 24px; }
      .search-wrap { min-width: 0; width: 130px; }
    }
  </style>
</head>
<body>

<!-- ── HEADER ── -->
<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:16px">
      <button class="mobile-toggle" id="mobileToggle"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#">Nexus<span>Shop</span></a>
    </div>

    <nav class="main-nav" id="mainNav">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#"><i class="fas fa-th-large"></i> Categories</a></li>
        <li><a href="#"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
        <li><a href="#about"><i class="fas fa-info-circle"></i> About</a></li>
      </ul>
    </nav>

    <div style="display:flex;align-items:center;gap:12px;">
      <div class="search-wrap">
        <input type="search" id="searchInput" placeholder="Search products…">
        <button id="searchBtn"><i class="fas fa-search"></i></button>
      </div>
      <div class="header-actions">
        <a class="icon-btn" title="Account" href="#"><i class="far fa-user"></i></a>
        <a class="icon-btn" title="Wishlist" href="#"><i class="far fa-heart"></i></a>
        <a class="cart-btn" href="#" id="cartBtn">
          <i class="fas fa-shopping-bag"></i>
          <span class="cart-count" id="cartCount">0</span>
        </a>
      </div>
    </div>
  </div>
  <div id="mobileMenu" style="display:none;border-top:1px solid var(--border);padding:16px 24px;">
    <nav><ul style="list-style:none;display:flex;flex-direction:column;gap:10px;">
      <li><a href="#" style="color:var(--text);font-weight:500">Home</a></li>
      <li><a href="#" style="color:var(--text);font-weight:500">Categories</a></li>
      <li><a href="#" style="color:var(--text);font-weight:500">Trending</a></li>
      <li><a href="#deals" style="color:var(--text);font-weight:500">Deals</a></li>
      <li><a href="#about" style="color:var(--text);font-weight:500">About</a></li>
    </ul></nav>
  </div>
</header>

<main>

<!-- ── HERO ── -->
<section class="hero">
  <div class="hero-bg"></div>
  <div class="hero-mesh"></div>
  <div class="container">
    <div class="hero-content">
      <div class="hero-eyebrow"><i class="fas fa-star"></i> Premium Collection 2025</div>
      <h1>Discover <em>Luxury</em><br>at Every Click</h1>
      <p>Handpicked fashion, technology & accessories — curated for those who appreciate the finest. Enjoy exclusive deals and complimentary shipping.</p>
      <div class="hero-btns">
        <button class="btn btn-gold" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button>
        <button class="btn btn-outline" id="exploreDeals">Explore Deals</button>
      </div>
      <div class="hero-stats">
        <div class="hero-stat"><div class="num">50K+</div><div class="label">Happy Customers</div></div>
        <div class="hero-stat"><div class="num">1,200+</div><div class="label">Premium Products</div></div>
        <div class="hero-stat"><div class="num">4.9★</div><div class="label">Average Rating</div></div>
      </div>
    </div>
  </div>
</section>

<!-- ── CATEGORIES ── -->
<section class="section container fade-up">
  <div class="section-head">
    <div class="section-eyebrow">Browse</div>
    <h2>Shop by Category</h2>
    <p>Explore our curated collections across every lifestyle.</p>
  </div>
  <div class="cat-grid" id="categoriesGrid"></div>
</section>

<!-- ── PRODUCTS ── -->
<section class="section container fade-up">
  <div class="section-head">
    <div class="section-eyebrow">Popular</div>
    <h2>Trending Products</h2>
    <p>The most-loved pieces, based on real customer activity.</p>
  </div>
  <div class="prod-grid" id="productsGrid"></div>
</section>

<!-- ── FLASH SALE ── -->
<section id="deals" class="deal-section container fade-up">
  <div class="section-head">
    <div class="section-eyebrow">Limited Time</div>
    <h2>Flash Sale</h2>
    <p>Don't blink — these deals won't last.</p>
  </div>
  <div class="deal-inner">
    <div class="deal-img">
      <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="MacBook Air M2">
    </div>
    <div class="deal-content">
      <div class="deal-eyebrow"><i class="fas fa-bolt"></i> Flash Deal</div>
      <h3>MacBook Air M2 — Thin. Powerful. Yours.</h3>
      <p>Experience M2 performance in the world's thinnest laptop. Limited units at this exclusive price.</p>
      <div class="timer">
        <div class="time-box"><div class="num" id="dealDays">0</div><div class="lbl">Days</div></div>
        <div class="time-box"><div class="num" id="dealHours">00</div><div class="lbl">Hours</div></div>
        <div class="time-box"><div class="num" id="dealMinutes">00</div><div class="lbl">Mins</div></div>
        <div class="time-box"><div class="num" id="dealSeconds">00</div><div class="lbl">Secs</div></div>
      </div>
      <div class="deal-price-row">
        <div class="deal-price">$999</div>
        <div class="deal-old">$1,199</div>
        <div class="deal-tag">-17%</div>
      </div>
      <div>
        <div style="font-size:13px;color:var(--muted);margin-bottom:6px">Only <strong style="color:var(--cream)">12</strong> units left</div>
        <div class="stock-bar"><div class="stock-fill"></div></div>
      </div>
      <div style="margin-top:8px">
        <button class="btn btn-gold" id="buyDeal"><i class="fas fa-shopping-bag"></i> Buy Now</button>
      </div>
    </div>
  </div>
</section>

<!-- ── TESTIMONIALS ── -->
<section class="section container fade-up">
  <div class="section-head">
    <div class="section-eyebrow">Reviews</div>
    <h2>What Customers Say</h2>
    <p>Verified reviews from real buyers who love what they got.</p>
  </div>
  <div class="test-grid" id="testimonialsGrid">
    <div class="test-card">
      <div class="test-stars">★★★★★</div>
      <p class="test-text">"Fast shipping and exceptional quality. The product exceeded every expectation I had. Will definitely shop again!"</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt="Ava Martin">
        <div><div class="test-name">Ava Martin</div><div class="test-role">Verified Buyer</div></div>
      </div>
    </div>
    <div class="test-card">
      <div class="test-stars">★★★★☆</div>
      <p class="test-text">"Great selection and the checkout experience was incredibly smooth. NexusShop has become my go-to for tech purchases."</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80" alt="Michael Lee">
        <div><div class="test-name">Michael Lee</div><div class="test-role">Frequent Buyer</div></div>
      </div>
    </div>
    <div class="test-card">
      <div class="test-stars">★★★★★</div>
      <p class="test-text">"The curated selection is impeccable. I found exactly what I was looking for and the packaging was absolutely premium."</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=80&q=80" alt="Priya Sharma">
        <div><div class="test-name">Priya Sharma</div><div class="test-role">Verified Buyer</div></div>
      </div>
    </div>
  </div>
</section>

<!-- ── NEWSLETTER ── -->
<section class="section container fade-up">
  <div class="newsletter">
    <div class="section-eyebrow">Newsletter</div>
    <h3>Stay in the Loop</h3>
    <p>Get exclusive deals, new arrivals and style tips — straight to your inbox.</p>
    <form class="newsletter-form" id="newsletterForm" onsubmit="return false;">
      <input id="newsletterEmail" type="email" placeholder="Enter your email address" required>
      <button class="btn btn-gold" id="subscribeBtn">Subscribe <i class="fas fa-paper-plane"></i></button>
    </form>
    <div id="newsletterMsg"></div>
  </div>
</section>

</main>

<!-- ── FOOTER ── -->
<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="footer-brand">Nexus<span>Shop</span></div>
        <p class="footer-desc">A premium e-commerce experience built with a passion for design and quality. Discover, shop, love.</p>
        <div class="footer-socials">
          <a class="icon-btn" href="#"><i class="fab fa-instagram"></i></a>
          <a class="icon-btn" href="#"><i class="fab fa-twitter"></i></a>
          <a class="icon-btn" href="#"><i class="fab fa-facebook"></i></a>
          <a class="icon-btn" href="#"><i class="fab fa-pinterest"></i></a>
        </div>
      </div>
      <div class="footer-col">
        <h5>Company</h5>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Careers</a></li>
          <li><a href="#">Press</a></li>
          <li><a href="#">Blog</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h5>Support</h5>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Shipping & Returns</a></li>
          <li><a href="#">Track Order</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h5>Legal</h5>
        <ul>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Terms of Service</a></li>
          <li><a href="#">Cookie Policy</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">© <span id="year"></span> NexusShop. Crafted with care. All rights reserved.</div>
  </div>
</footer>

<script>
const CATEGORIES = [
  { id:'phones',      name:'Smartphones',  icon:'fa-mobile-alt',  count:'48 items' },
  { id:'laptops',     name:'Laptops',       icon:'fa-laptop',      count:'32 items' },
  { id:'clothing',    name:'Clothing',      icon:'fa-tshirt',      count:'120 items'},
  { id:'gadgets',     name:'Gadgets',       icon:'fa-headphones',  count:'64 items' },
  { id:'footwear',    name:'Footwear',      icon:'fa-shoe-prints', count:'55 items' },
  { id:'accessories', name:'Accessories',   icon:'fa-watch',       count:'89 items' },
];

const PRODUCTS = [
  { id:1, title:'iPhone 14 Pro Max',    price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New',  img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
  { id:2, title:'MacBook Pro 14"',      price:1999, oldPrice:null, rating:4, reviews:86,  badge:null,   img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
  { id:3, title:'Apple Watch Series 8', price:349,  oldPrice:399,  rating:5, reviews:214, badge:'-25%', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:4, title:'Nike Air Max 270',     price:150,  oldPrice:null, rating:4, reviews:53,  badge:null,   img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
  { id:5, title:'Sony A7 IV Camera',    price:2499, oldPrice:null, rating:5, reviews:42,  badge:null,   img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
  { id:6, title:'Chanel No. 5',         price:120,  oldPrice:null, rating:5, reviews:189, badge:null,   img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:7, title:'Travel Backpack',      price:79,   oldPrice:99,   rating:4, reviews:67,  badge:'-20%', img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:8, title:'Sony WH-1000XM5',      price:399,  oldPrice:null, rating:5, reviews:156, badge:null,   img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
];

let cartCount = 0;
const cartCountEl = document.getElementById('cartCount');
const searchInput  = document.getElementById('searchInput');

function esc(t){ return String(t).replace(/[&<>"']/g,s=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[s])); }

function renderCategories(){
  const g = document.getElementById('categoriesGrid');
  g.innerHTML = '';
  CATEGORIES.forEach(c=>{
    const el = document.createElement('div');
    el.className='cat-card';
    el.innerHTML=`
      <div class="cat-icon"><i class="fas ${c.icon}"></i></div>
      <h4>${c.name}</h4>
      <span>${c.count}</span>
    `;
    el.addEventListener('click',()=>{
      searchInput.value=c.name;
      filterProducts(c.name);
      document.getElementById('productsGrid').scrollIntoView({behavior:'smooth',block:'start'});
    });
    g.appendChild(el);
  });
}

function renderProducts(list){
  const g = document.getElementById('productsGrid');
  g.innerHTML='';
  if(!list.length){
    g.innerHTML='<div style="grid-column:1/-1;text-align:center;padding:60px;color:var(--muted)"><i class="fas fa-search" style="font-size:40px;margin-bottom:16px;display:block"></i>No products found.</div>';
    return;
  }
  list.forEach(p=>{
    const el=document.createElement('article');
    el.className='product';
    const badgeHtml = p.badge
      ? `<div class="prod-badge ${p.badge.startsWith('-')?'badge-sale':'badge-new'}">${p.badge}</div>` : '';
    el.innerHTML=`
      <div class="product-img-wrap">
        ${badgeHtml}
        <img src="${p.img}" alt="${esc(p.title)}" loading="lazy">
        <button class="wish-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
      </div>
      <div class="product-body">
        <div class="prod-category">${p.category}</div>
        <h5>${esc(p.title)}</h5>
        <div class="price-row">
          <div>
            <span class="price">$${p.price.toLocaleString()}</span>
            ${p.oldPrice?`<span class="old-price">$${p.oldPrice.toLocaleString()}</span>`:''}
          </div>
          <div class="rating">${'★'.repeat(Math.round(p.rating))}<span>(${p.reviews})</span></div>
        </div>
        <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add to Cart</button>
      </div>
    `;
    g.appendChild(el);
  });
  g.querySelectorAll('.add-btn').forEach(btn=>{
    btn.addEventListener('click',()=>{
      const id=Number(btn.dataset.id);
      cartCount++;
      cartCountEl.textContent=cartCount;
      const orig=btn.innerHTML;
      btn.innerHTML='<i class="fas fa-check"></i> Added!';
      btn.disabled=true;
      btn.style.background='var(--gold)';
      btn.style.color='#1a0e00';
      btn.style.borderColor='var(--gold)';
      setTimeout(()=>{ btn.innerHTML=orig; btn.disabled=false; btn.style.cssText=''; },1400);
    });
  });
}

function filterProducts(q){
  const s=(q||'').trim().toLowerCase();
  renderProducts(s?PRODUCTS.filter(p=>p.title.toLowerCase().includes(s)||p.category.toLowerCase().includes(s)):PRODUCTS);
}

document.getElementById('searchBtn').addEventListener('click',()=>filterProducts(searchInput.value));
searchInput.addEventListener('keydown',e=>{ if(e.key==='Enter') filterProducts(e.target.value); });

document.getElementById('mobileToggle').addEventListener('click',()=>{
  const m=document.getElementById('mobileMenu');
  m.style.display=m.style.display==='none'||!m.style.display?'block':'none';
});

document.getElementById('shopNow').addEventListener('click',()=>document.getElementById('productsGrid').scrollIntoView({behavior:'smooth'}));
document.getElementById('exploreDeals').addEventListener('click',()=>document.getElementById('deals').scrollIntoView({behavior:'smooth'}));
document.getElementById('buyDeal').addEventListener('click',()=>{ cartCount++; cartCountEl.textContent=cartCount; alert('Deal added to cart!'); });

document.getElementById('newsletterForm').addEventListener('submit',e=>{
  e.preventDefault();
  const email=document.getElementById('newsletterEmail').value.trim();
  const msg=document.getElementById('newsletterMsg');
  if(!email||!email.includes('@')){
    msg.textContent='Please enter a valid email address.';
    msg.style.color='#e55'; return;
  }
  msg.textContent='🎉 You\'re subscribed! Welcome to the club.';
  msg.style.color='var(--gold)';
  document.getElementById('newsletterEmail').value='';
  setTimeout(()=>msg.textContent='',4000);
});

(function dealTimer(){
  const target=new Date(Date.now()+(24*60+36)*60*1000);
  function tick(){
    const d=target-Date.now();
    if(d<=0) return;
    document.getElementById('dealDays').textContent=Math.floor(d/(24*3600*1000));
    document.getElementById('dealHours').textContent=String(Math.floor(d%(24*3600*1000)/(3600*1000))).padStart(2,'0');
    document.getElementById('dealMinutes').textContent=String(Math.floor(d%(3600*1000)/(60*1000))).padStart(2,'0');
    document.getElementById('dealSeconds').textContent=String(Math.floor(d%(60*1000)/1000)).padStart(2,'0');
  }
  tick(); setInterval(tick,1000);
})();

// Intersection Observer for fade-up animations
const io=new IntersectionObserver(entries=>{
  entries.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('visible'); io.unobserve(e.target); } });
},{threshold:0.08});
document.querySelectorAll('.fade-up').forEach(el=>io.observe(el));

(function init(){
  renderCategories();
  renderProducts(PRODUCTS);
  document.getElementById('year').textContent=new Date().getFullYear();
})();
</script>
</body>
</html>
