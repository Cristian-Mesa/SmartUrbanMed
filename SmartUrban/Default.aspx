<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartUrban._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
#bg-canvas {
    position: fixed; top: 0; left: 0;
    width: 100%; height: 100%;
    z-index: 0; pointer-events: none; opacity: .45;
}
.hero-wrap {
    position: relative; min-height: 92vh;
    display: flex; align-items: center; overflow: hidden;
    margin: -2rem -1.5rem 0; padding: 6rem 2.5rem 5rem;
}
.hero-noise {
    position: absolute; inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none; opacity: .6;
}
.hero-scanlines {
    position: absolute; inset: 0;
    background: repeating-linear-gradient(0deg, transparent, transparent 2px, rgba(0,255,148,.012) 2px, rgba(0,255,148,.012) 4px);
    pointer-events: none;
}
.hero-left { position: relative; z-index: 2; max-width: 700px; }
.hero-eyebrow {
    display: inline-flex; align-items: center; gap: .6rem;
    background: rgba(0,255,148,.08); border: 1px solid rgba(0,255,148,.2);
    border-radius: 999px; padding: .35rem 1rem .35rem .6rem;
    font-family: 'JetBrains Mono', monospace; font-size: .68rem;
    color: var(--verde); letter-spacing: .08em; margin-bottom: 1.75rem;
    animation: fadeUp .6s ease both;
}
.hero-eyebrow-dot { width: 7px; height: 7px; border-radius: 50%; background: var(--verde); animation: pulse 2s infinite; flex-shrink: 0; }
.hero-mega-title {
    font-family: 'Bebas Neue', sans-serif;
    font-size: clamp(4.5rem, 10vw, 8.5rem);
    line-height: .88; letter-spacing: .03em; color: #fff; margin-bottom: 1.5rem;
    animation: fadeUp .6s .08s ease both;
}
.hero-mega-title .line-muted { color: rgba(255,255,255,.18); display: block; }
.hero-mega-title .line-verde {
    color: var(--verde); display: block;
    text-shadow: 0 0 60px rgba(0,255,148,.5), 0 0 120px rgba(0,255,148,.2);
}
.hero-desc {
    font-size: 1.05rem; color: rgba(226,232,240,.6); line-height: 1.7;
    max-width: 520px; margin-bottom: 2.5rem;
    animation: fadeUp .6s .16s ease both;
}
.hero-ctas { display: flex; gap: 1rem; flex-wrap: wrap; animation: fadeUp .6s .24s ease both; }
.cta-primary {
    display: inline-flex; align-items: center; gap: .6rem;
    background: var(--verde); color: #080C14;
    font-family: 'Bebas Neue', sans-serif; font-size: 1.1rem; letter-spacing: .08em;
    padding: .85rem 2rem; border-radius: .5rem; text-decoration: none;
    transition: all .25s; box-shadow: 0 0 30px rgba(0,255,148,.3), 0 0 60px rgba(0,255,148,.1);
    position: relative; overflow: hidden;
}
.cta-primary::before {
    content: ''; position: absolute; top: 0; left: -100%;
    width: 100%; height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,.3), transparent);
    transition: left .4s ease;
}
.cta-primary:hover::before { left: 100%; }
.cta-primary:hover { background: #fff; transform: translateY(-2px); box-shadow: 0 0 50px rgba(0,255,148,.5), 0 8px 32px rgba(0,0,0,.4); }
.cta-arrow { font-size: 1.2rem; transition: transform .25s; }
.cta-primary:hover .cta-arrow { transform: translateX(4px); }
.cta-outline {
    display: inline-flex; align-items: center; gap: .6rem;
    background: transparent; color: rgba(226,232,240,.7);
    font-family: 'Space Grotesk', sans-serif; font-size: .9rem; font-weight: 500;
    padding: .85rem 1.75rem; border-radius: .5rem; text-decoration: none;
    border: 1px solid rgba(255,255,255,.12); transition: all .25s;
}
.cta-outline:hover { border-color: rgba(0,255,148,.3); color: var(--verde); background: rgba(0,255,148,.05); }

/* 3D Floating card */
.hero-3d-card {
    position: absolute; right: 3%; top: 50%; transform: translateY(-50%);
    z-index: 2; width: clamp(260px, 26vw, 380px);
    perspective: 1000px; animation: fadeUp .6s .32s ease both;
}
.hero-3d-inner {
    background: linear-gradient(135deg, rgba(20,27,45,.95), rgba(13,19,32,.98));
    border: 1px solid rgba(0,255,148,.2); border-radius: 1rem; padding: 1.5rem;
    transform: rotateY(-8deg) rotateX(4deg); transform-style: preserve-3d;
    box-shadow: 0 30px 80px rgba(0,0,0,.6), 0 0 60px rgba(0,255,148,.08), inset 0 1px 0 rgba(255,255,255,.05);
    transition: transform .4s ease;
}
.hero-3d-card:hover .hero-3d-inner { transform: rotateY(0deg) rotateX(0deg); }
.card-3d-hdr { display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.25rem; }
.card-3d-ttl { font-family: 'JetBrains Mono', monospace; font-size: .7rem; color: var(--verde); letter-spacing: .1em; }
.card-3d-st { display: flex; align-items: center; gap: .35rem; font-family: 'JetBrains Mono', monospace; font-size: .62rem; color: var(--verde); }
.card-3d-st-dot { width: 6px; height: 6px; border-radius: 50%; background: var(--verde); animation: pulse 1.5s infinite; }
.mrow { padding: .9rem 0; border-bottom: 1px solid rgba(255,255,255,.05); }
.mrow:last-child { border-bottom: none; padding-bottom: 0; }
.mlbl { font-family: 'JetBrains Mono', monospace; font-size: .68rem; color: var(--muted); text-transform: uppercase; letter-spacing: .06em; margin-bottom: .35rem; }
.mval { font-family: 'Bebas Neue', sans-serif; font-size: 2rem; letter-spacing: .04em; line-height: 1; }
.mval.v { color: var(--verde); text-shadow: 0 0 20px rgba(0,255,148,.4); }
.mval.a { color: var(--azul); text-shadow: 0 0 20px rgba(59,130,246,.4); }
.mval.o { color: var(--oro);  text-shadow: 0 0 20px rgba(251,191,36,.4); }
.mbar { height: 3px; background: rgba(255,255,255,.06); border-radius: 99px; margin-top: .4rem; overflow: hidden; }
.mbar-fill { height: 100%; border-radius: 99px; animation: barGrow 1.2s .5s ease both; }
@keyframes barGrow { from { width: 0; } }
.mbar-fill.v { background: var(--verde); width: 68%; }
.mbar-fill.a { background: var(--azul);  width: 45%; }
.mbar-fill.o { background: var(--oro);   width: 89%; }

/* Ticker */
.ticker-wrap {
    overflow: hidden; border-top: 1px solid var(--border); border-bottom: 1px solid var(--border);
    background: rgba(0,255,148,.03); padding: .55rem 0;
    margin: 0 -1.5rem 3rem; position: relative; z-index: 1;
}
.ticker-inner { display: flex; animation: ticker 28s linear infinite; width: max-content; }
@keyframes ticker { from { transform: translateX(0); } to { transform: translateX(-50%); } }
.tick { display: flex; align-items: center; gap: .5rem; padding: 0 2.5rem; font-family: 'JetBrains Mono', monospace; font-size: .68rem; color: var(--muted); white-space: nowrap; letter-spacing: .05em; }
.tick-dot { width: 4px; height: 4px; border-radius: 50%; background: var(--verde); flex-shrink: 0; }
.tick-hi { color: var(--verde); }

/* Live Stats */
.live-stats {
    display: grid; grid-template-columns: repeat(4, 1fr);
    gap: .75rem; margin-bottom: 4rem; position: relative; z-index: 1;
}
.lstat {
    background: var(--panel); border: 1px solid var(--border);
    border-radius: .75rem; padding: 1.25rem 1rem 1rem;
    text-align: center; text-decoration: none;
    display: flex; flex-direction: column; align-items: center;
    position: relative; overflow: hidden; transition: all .3s;
}
.lstat::after { content: ''; position: absolute; bottom: 0; left: 0; right: 0; height: 2px; transform: scaleX(0); transition: transform .3s; border-radius: 0 0 .75rem .75rem; }
.lstat:hover { transform: translateY(-4px); }
.lstat:hover::after { transform: scaleX(1); }
.lstat.sv::after,.lstat:hover.sv { --bc: var(--verde); }
.lstat.sa::after,.lstat:hover.sa { --bc: var(--azul); }
.lstat.so::after,.lstat:hover.so { --bc: var(--oro); }
.lstat.sr::after,.lstat:hover.sr { --bc: var(--rojo); }
.lstat.sv::after { background: var(--verde); }
.lstat.sa::after { background: var(--azul); }
.lstat.so::after { background: var(--oro); }
.lstat.sr::after { background: var(--rojo); }
.lstat:hover.sv { border-color: rgba(0,255,148,.25); box-shadow: 0 0 30px rgba(0,255,148,.08); }
.lstat:hover.sa { border-color: rgba(59,130,246,.25); box-shadow: 0 0 30px rgba(59,130,246,.08); }
.lstat:hover.so { border-color: rgba(251,191,36,.25); box-shadow: 0 0 30px rgba(251,191,36,.08); }
.lstat:hover.sr { border-color: rgba(248,113,113,.25); box-shadow: 0 0 30px rgba(248,113,113,.08); }
.lstat-ico { font-size: 1.6rem; margin-bottom: .5rem; }
.lstat-num { font-family: 'Bebas Neue', sans-serif; font-size: 3rem; letter-spacing: .04em; line-height: 1; }
.sv .lstat-num { color: var(--verde); }
.sa .lstat-num { color: var(--azul); }
.so .lstat-num { color: var(--oro); }
.sr .lstat-num { color: var(--rojo); }
.lstat-lbl { font-size: .68rem; color: var(--muted); text-transform: uppercase; letter-spacing: .07em; margin-top: .25rem; }

/* Modules section */
.mod-section { position: relative; z-index: 1; padding-top: 4rem; }
.sec-eye { display: flex; align-items: center; gap: .75rem; margin-bottom: .75rem; }
.sec-eye-line { height: 1px; width: 40px; background: var(--verde); opacity: .6; }
.sec-eye-txt { font-family: 'JetBrains Mono', monospace; font-size: .65rem; letter-spacing: .14em; text-transform: uppercase; color: var(--verde); }
.sec-big-title { font-family: 'Bebas Neue', sans-serif; font-size: clamp(2.5rem, 6vw, 5rem); letter-spacing: .04em; color: #fff; line-height: .95; margin-bottom: .75rem; }
.sec-sub { color: var(--muted); font-size: .9rem; margin-bottom: 3rem; }

.mods-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
}
.mc {
    position: relative; border-radius: .875rem; overflow: hidden;
    text-decoration: none; display: flex; flex-direction: column;
    min-height: 220px; transition: transform .3s cubic-bezier(.34,1.56,.64,1), box-shadow .3s;
    border: 1px solid rgba(255,255,255,.06);
}
.mc:hover { transform: translateY(-6px) scale(1.01); box-shadow: 0 24px 60px rgba(0,0,0,.6); z-index: 2; }
.mc.wide { grid-column: span 2; min-height: 260px; }

.mc-prov { background: linear-gradient(135deg, #0D1A2D, #0D2040 60%, #071228); }
.mc-serv { background: linear-gradient(135deg, #0A1F18, #0D2E1E 60%, #071A12); }
.mc-soli { background: linear-gradient(135deg, #1A150A, #2A1F08 60%, #150F05); }
.mc-regp { background: linear-gradient(135deg, #1A0A1A, #250D3A 60%, #100818); }
.mc-sols { background: linear-gradient(135deg, #0A1520, #0F2030 60%, #060F18); }
.mc-cali { background: linear-gradient(135deg, #1A1008, #2A1A08 60%, #120B05); }

.mc::before {
    content: ''; position: absolute; border-radius: 50%; pointer-events: none; transition: all .4s;
}
.mc-prov::before { width:200px;height:200px;top:-60px;right:-40px;background:radial-gradient(circle,rgba(59,130,246,.2),transparent 70%); }
.mc-serv::before { width:180px;height:180px;top:-50px;right:-30px;background:radial-gradient(circle,rgba(0,255,148,.2),transparent 70%); }
.mc-soli::before { width:300px;height:300px;top:-100px;right:-60px;background:radial-gradient(circle,rgba(251,191,36,.15),transparent 70%); }
.mc-regp::before { width:160px;height:160px;top:-40px;right:-30px;background:radial-gradient(circle,rgba(167,139,250,.2),transparent 70%); }
.mc-sols::before { width:200px;height:200px;top:-60px;right:-40px;background:radial-gradient(circle,rgba(56,189,248,.2),transparent 70%); }
.mc-cali::before { width:180px;height:180px;top:-50px;right:-30px;background:radial-gradient(circle,rgba(251,191,36,.25),transparent 70%); }
.mc:hover::before { transform: scale(1.4); }

.mc::after { content:''; position:absolute;inset:0; background-image:radial-gradient(circle,rgba(255,255,255,.06) 1px,transparent 1px); background-size:20px 20px; pointer-events:none; }

.mc-inner { position:relative;z-index:1;padding:1.75rem;display:flex;flex-direction:column;height:100%;gap:.35rem; }
.mc-tag { font-family:'JetBrains Mono',monospace;font-size:.6rem;letter-spacing:.12em;text-transform:uppercase;padding:.2rem .6rem;border-radius:.25rem;display:inline-block;width:fit-content;margin-bottom:.1rem; }
.tag-az { background:rgba(59,130,246,.15);color:#93C5FD;border:1px solid rgba(59,130,246,.2); }
.tag-vd { background:rgba(0,255,148,.1);color:var(--verde);border:1px solid rgba(0,255,148,.2); }
.tag-or { background:rgba(251,191,36,.1);color:#FDE68A;border:1px solid rgba(251,191,36,.2); }
.tag-pu { background:rgba(167,139,250,.1);color:#C4B5FD;border:1px solid rgba(167,139,250,.2); }
.tag-sk { background:rgba(56,189,248,.1);color:#7DD3FC;border:1px solid rgba(56,189,248,.2); }

.mc-emoji { font-size:2.8rem;line-height:1;transition:transform .3s cubic-bezier(.34,1.56,.64,1); }
.mc:hover .mc-emoji { transform:scale(1.15) rotate(-5deg); }
.mc-title { font-family:'Bebas Neue',sans-serif;font-size:1.7rem;letter-spacing:.04em;color:#fff;line-height:1; }
.mc.wide .mc-title { font-size:2.2rem; }
.mc-desc { font-size:.78rem;color:rgba(226,232,240,.45);line-height:1.55;flex:1; }
.mc-foot { display:flex;align-items:center;justify-content:space-between;margin-top:.75rem;padding-top:.75rem;border-top:1px solid rgba(255,255,255,.06); }
.mc-arrow { font-family:'Bebas Neue',sans-serif;font-size:.9rem;letter-spacing:.1em;color:rgba(255,255,255,.25);transition:all .25s; }
.mc:hover .mc-arrow { color:#fff;transform:translateX(4px); }
.mc-cnt { font-family:'JetBrains Mono',monospace;font-size:.65rem;color:rgba(255,255,255,.2); }

@media(max-width:1024px){ .hero-3d-card{display:none;} .hero-wrap{min-height:70vh;} .mods-grid{grid-template-columns:1fr 1fr;} .mc.wide{grid-column:span 2;} }
@media(max-width:768px){ .mods-grid,.live-stats{grid-template-columns:1fr;} .mc.wide{grid-column:span 1;min-height:220px;} .hero-wrap{padding:4rem 1.5rem 3rem;} }
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<canvas id="bg-canvas"></canvas>

<!-- HERO -->
<section class="hero-wrap">
    <div class="hero-noise"></div>
    <div class="hero-scanlines"></div>
    <div class="hero-left">
        <div class="hero-eyebrow">
            <span class="hero-eyebrow-dot"></span>
            Sistema activo &middot; Medellín, Colombia
        </div>
        <h1 class="hero-mega-title">
            <span class="line-muted">CIUDAD</span>
            <span class="line-verde" id="glitch-text">INTELIGENTE</span>
            MEDELLÍN
        </h1>
        <p class="hero-desc">
            Conectamos ciudadanos con proveedores de servicios urbanos verificados.
            Plomeros, electricistas, carpinteros y más — cerca de ti, en tiempo real.
        </p>
        <div class="hero-ctas">
            <a href="Servicios.aspx" class="cta-primary">Explorar Servicios <span class="cta-arrow">→</span></a>
            <a href="RegistrarProveedor.aspx" class="cta-outline">＋ Ofrecer servicio</a>
        </div>
    </div>
    <!-- Floating 3D card -->
    <div class="hero-3d-card">
        <div class="hero-3d-inner">
            <div class="card-3d-hdr">
                <span class="card-3d-ttl">// DASHBOARD LIVE</span>
                <span class="card-3d-st"><span class="card-3d-st-dot"></span>ONLINE</span>
            </div>
            <div class="mrow"><div class="mlbl">Proveedores activos</div><div class="mval v">02</div><div class="mbar"><div class="mbar-fill v"></div></div></div>
            <div class="mrow"><div class="mlbl">Servicios disponibles</div><div class="mval a">06</div><div class="mbar"><div class="mbar-fill a"></div></div></div>
            <div class="mrow"><div class="mlbl">Calificación promedio</div><div class="mval o">4.8 ★</div><div class="mbar"><div class="mbar-fill o"></div></div></div>
        </div>
    </div>
</section>

<!-- TICKER -->
<div class="ticker-wrap">
    <div class="ticker-inner">
        <span class="tick"><span class="tick-dot"></span><span class="tick-hi">NUEVO</span> Proveedor registrado en El Poblado</span>
        <span class="tick"><span class="tick-dot"></span>Solicitud #0042 completada &mdash; 5 estrellas</span>
        <span class="tick"><span class="tick-dot"></span><span class="tick-hi">3 SERVICIOS</span> disponibles en Laureles hoy</span>
        <span class="tick"><span class="tick-dot"></span>Electricista verificado activo en Envigado</span>
        <span class="tick"><span class="tick-dot"></span>Plomero disponible en Bello &mdash; Respuesta 15min</span>
        <span class="tick"><span class="tick-dot"></span><span class="tick-hi">NUEVO</span> Proveedor registrado en El Poblado</span>
        <span class="tick"><span class="tick-dot"></span>Solicitud #0042 completada &mdash; 5 estrellas</span>
        <span class="tick"><span class="tick-dot"></span><span class="tick-hi">3 SERVICIOS</span> disponibles en Laureles hoy</span>
        <span class="tick"><span class="tick-dot"></span>Electricista verificado activo en Envigado</span>
        <span class="tick"><span class="tick-dot"></span>Plomero disponible en Bello &mdash; Respuesta 15min</span>
    </div>
</div>

<!-- LIVE STATS -->
<div class="live-stats animate-up">
    <a href="Proveedores.aspx" class="lstat sv">
        <div class="lstat-ico">🏪</div>
        <div class="lstat-num" data-target="2" data-count>0</div>
        <div class="lstat-lbl">Proveedores</div>
    </a>
    <a href="Servicios.aspx" class="lstat sa">
        <div class="lstat-ico">🛠️</div>
        <div class="lstat-num" data-target="6" data-count>0</div>
        <div class="lstat-lbl">Servicios</div>
    </a>
    <a href="Solicitudes.aspx" class="lstat so">
        <div class="lstat-ico">📋</div>
        <div class="lstat-num" data-target="3" data-count>0</div>
        <div class="lstat-lbl">Solicitudes</div>
    </a>
    <div class="lstat sr">
        <div class="lstat-ico">⭐</div>
        <div class="lstat-num">4.8</div>
        <div class="lstat-lbl">Calificación prom.</div>
    </div>
</div>

<!-- MÓDULOS -->
<div class="mod-section animate-up delay-2">
    <div class="sec-eye">
        <span class="sec-eye-line"></span>
        <span class="sec-eye-txt">Sistema de Gestión Urbana</span>
    </div>
    <h2 class="sec-big-title">¿QUÉ<br>NECESITAS?</h2>
    <p class="sec-sub">Selecciona un módulo para continuar</p>

    <div class="mods-grid">
        <a href="Proveedores.aspx" class="mc mc-prov wide">
            <div class="mc-inner">
                <span class="mc-tag tag-az">GESTIÓN</span>
                <span class="mc-emoji">🏪</span>
                <div class="mc-title">Proveedores</div>
                <p class="mc-desc">Ver y gestionar todos los proveedores de servicio. Filtros por zona, categoría y calificación.</p>
                <div class="mc-foot"><span class="mc-arrow">VER TODOS →</span><span class="mc-cnt">02 activos</span></div>
            </div>
        </a>
        <a href="Servicios.aspx" class="mc mc-serv">
            <div class="mc-inner">
                <span class="mc-tag tag-vd">CATÁLOGO</span>
                <span class="mc-emoji">🛠️</span>
                <div class="mc-title">Servicios</div>
                <p class="mc-desc">Catálogo completo de servicios disponibles en Medellín.</p>
                <div class="mc-foot"><span class="mc-arrow">EXPLORAR →</span><span class="mc-cnt">06 tipos</span></div>
            </div>
        </a>
        <a href="Solicitudes.aspx" class="mc mc-soli wide">
            <div class="mc-inner">
                <span class="mc-tag tag-or">HISTORIAL</span>
                <span class="mc-emoji">📋</span>
                <div class="mc-title">Solicitudes</div>
                <p class="mc-desc">Historial completo y seguimiento en tiempo real de todas tus solicitudes activas.</p>
                <div class="mc-foot"><span class="mc-arrow">VER HISTORIAL →</span><span class="mc-cnt">03 solicitudes</span></div>
            </div>
        </a>
        <a href="RegistrarProveedor.aspx" class="mc mc-regp">
            <div class="mc-inner">
                <span class="mc-tag tag-pu">REGISTRO</span>
                <span class="mc-emoji">➕</span>
                <div class="mc-title">Registrar<br>Proveedor</div>
                <p class="mc-desc">Agregar nuevo proveedor con mapa interactivo.</p>
                <div class="mc-foot"><span class="mc-arrow">REGISTRAR →</span></div>
            </div>
        </a>
        <a href="SolicitarServicio.aspx" class="mc mc-sols">
            <div class="mc-inner">
                <span class="mc-tag tag-sk">NUEVA</span>
                <span class="mc-emoji">📤</span>
                <div class="mc-title">Solicitar<br>Servicio</div>
                <p class="mc-desc">Crear solicitud con ubicación exacta en el mapa.</p>
                <div class="mc-foot"><span class="mc-arrow">SOLICITAR →</span></div>
            </div>
        </a>
        <a href="CalificarServicio.aspx" class="mc mc-cali">
            <div class="mc-inner">
                <span class="mc-tag tag-or">RATING</span>
                <span class="mc-emoji">⭐</span>
                <div class="mc-title">Calificar<br>Servicio</div>
                <p class="mc-desc">Evalúa la calidad del servicio con estrellas.</p>
                <div class="mc-foot"><span class="mc-arrow">CALIFICAR →</span></div>
            </div>
        </a>
    </div>
</div>

</asp:Content>

<asp:Content ID="Scripts" ContentPlaceHolderID="Scripts" runat="server">
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script>
// Three.js particles background
(function(){
    var c=document.getElementById('bg-canvas');
    if(!c||typeof THREE==='undefined')return;
    var r=new THREE.WebGLRenderer({canvas:c,antialias:true,alpha:true});
    r.setPixelRatio(Math.min(devicePixelRatio,2));
    r.setSize(innerWidth,innerHeight);
    r.setClearColor(0,0);
    var sc=new THREE.Scene();
    var cam=new THREE.PerspectiveCamera(75,innerWidth/innerHeight,.1,1000);
    cam.position.z=30;
    var N=1800,g=new THREE.BufferGeometry();
    var p=new Float32Array(N*3),cl=new Float32Array(N*3);
    for(var i=0;i<N;i++){
        p[i*3]=(Math.random()-.5)*120;
        p[i*3+1]=(Math.random()-.5)*80;
        p[i*3+2]=(Math.random()-.5)*60;
        var rr=Math.random();
        if(rr<.5){cl[i*3]=0;cl[i*3+1]=1;cl[i*3+2]=.58;}
        else if(rr<.75){cl[i*3]=.23;cl[i*3+1]=.51;cl[i*3+2]=.96;}
        else{cl[i*3]=.85;cl[i*3+1]=.9;cl[i*3+2]=.95;}
    }
    g.setAttribute('position',new THREE.BufferAttribute(p,3));
    g.setAttribute('color',new THREE.BufferAttribute(cl,3));
    var m=new THREE.PointsMaterial({size:.12,vertexColors:true,transparent:true,opacity:.7,sizeAttenuation:true,blending:THREE.AdditiveBlending,depthWrite:false});
    var pts=new THREE.Points(g,m);
    sc.add(pts);
    var mouse={x:0,y:0};
    addEventListener('mousemove',function(e){mouse.x=(e.clientX/innerWidth-.5)*2;mouse.y=-(e.clientY/innerHeight-.5)*2;});
    var scrollY=0;
    addEventListener('scroll',function(){scrollY=window.scrollY;});
    addEventListener('resize',function(){cam.aspect=innerWidth/innerHeight;cam.updateProjectionMatrix();r.setSize(innerWidth,innerHeight);});
    var clk=new THREE.Clock();
    (function anim(){
        requestAnimationFrame(anim);
        var t=clk.getElapsedTime();
        pts.rotation.y=t*.04+mouse.x*.08;
        pts.rotation.x=t*.02+mouse.y*.05;
        cam.position.y=-scrollY*.005;
        r.render(sc,cam);
    })();
})();

// Animated counters
(function(){
    function animCount(el){
        var tgt=parseInt(el.dataset.target,10);
        var start=performance.now();
        (function step(now){
            var p=Math.min((now-start)/1200,1);
            var e=1-Math.pow(1-p,3);
            el.textContent=String(Math.round(e*tgt)).padStart(2,'0');
            if(p<1)requestAnimationFrame(step);
        })(start);
    }
    var obs=new IntersectionObserver(function(en){
        en.forEach(function(e){
            if(e.isIntersecting){
                e.target.querySelectorAll('[data-count]').forEach(animCount);
                obs.unobserve(e.target);
            }
        });
    },{threshold:.3});
    var s=document.querySelector('.live-stats');
    if(s)obs.observe(s);
})();

// 3D tilt on cards
document.querySelectorAll('.mc').forEach(function(c){
    c.addEventListener('mousemove',function(e){
        var rc=c.getBoundingClientRect();
        var x=(e.clientX-rc.left)/rc.width-.5;
        var y=(e.clientY-rc.top)/rc.height-.5;
        c.style.transform='translateY(-6px) scale(1.01) rotateX('+(-y*8)+'deg) rotateY('+(x*8)+'deg)';
    });
    c.addEventListener('mouseleave',function(){c.style.transform='';});
});

// Glitch effect on hero title
(function(){
    var chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var orig='INTELIGENTE';
    var el=document.getElementById('glitch-text');
    if(!el)return;
    function glitch(){
        var round=0;
        var iv=setInterval(function(){
            el.textContent=orig.split('').map(function(c,i){
                return round>i?c:chars[Math.floor(Math.random()*chars.length)];
            }).join('');
            round++;
            if(round>orig.length){clearInterval(iv);el.textContent=orig;}
        },40);
    }
    setTimeout(glitch,2000);
    setInterval(glitch,5500);
})();
</script>
</asp:Content>
