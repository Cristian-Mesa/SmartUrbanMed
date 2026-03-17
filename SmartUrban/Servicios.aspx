<%@ Page Title="Servicios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="SmartUrban.Servicios" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.page-hero{background:linear-gradient(90deg,rgba(59,130,246,.08),transparent);border:1px solid rgba(59,130,246,.12);border-radius:.875rem;padding:1.75rem 2rem;margin-bottom:2rem;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:1rem;position:relative;overflow:hidden}
.page-hero::before{content:'';position:absolute;right:-60px;top:-60px;width:220px;height:220px;border-radius:50%;background:radial-gradient(circle,rgba(59,130,246,.07) 0%,transparent 70%);pointer-events:none}
.breadcrumb{display:flex;align-items:center;gap:.5rem;font-size:.75rem;margin-bottom:.6rem}
.breadcrumb a{color:var(--azul);text-decoration:none}.breadcrumb a:hover{color:var(--verde)}
.breadcrumb span{color:var(--muted)}
.page-title{font-family:'Bebas Neue',sans-serif;font-size:2.2rem;letter-spacing:.05em;color:#fff;line-height:1}
.page-sub{font-size:.82rem;color:var(--muted);margin-top:.3rem}

.cat-tabs{display:flex;gap:.5rem;margin-bottom:1.75rem;flex-wrap:wrap}
.cat-tab{padding:.4rem 1.1rem;border-radius:2rem;font-size:.78rem;font-weight:500;cursor:pointer;border:1px solid var(--border);background:transparent;color:var(--muted);transition:all .2s;font-family:'Space Grotesk',sans-serif}
.cat-tab.active,.cat-tab:hover{background:rgba(59,130,246,.1);border-color:rgba(59,130,246,.3);color:var(--azul)}
.cat-tab.active{font-weight:700}

.serv-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:1.1rem;margin-bottom:2rem}
.serv-card{background:var(--panel);border:1px solid var(--border);border-radius:.875rem;overflow:hidden;transition:all .35s cubic-bezier(.34,1.56,.64,1);cursor:pointer;position:relative}
.serv-card:hover{transform:translateY(-5px);box-shadow:0 18px 50px rgba(0,0,0,.45)}
.serv-band{height:4px;width:100%}
.serv-body{padding:1.25rem}
.serv-cat-label{font-size:.62rem;font-weight:700;text-transform:uppercase;letter-spacing:.1em;margin-bottom:.75rem;display:flex;align-items:center;gap:.4rem}
.serv-name{font-family:'Bebas Neue',sans-serif;font-size:1.3rem;letter-spacing:.04em;color:#fff;margin-bottom:.5rem}
.serv-desc{font-size:.78rem;color:var(--muted);line-height:1.55;margin-bottom:1rem}
.serv-footer{display:flex;align-items:center;justify-content:space-between;padding-top:.875rem;border-top:1px solid var(--border)}
.serv-proveedor{font-size:.72rem;color:var(--muted);display:flex;align-items:center;gap:.35rem}
.serv-precio{font-family:'JetBrains Mono',monospace;font-size:.8rem;font-weight:700}

.badge{display:inline-flex;align-items:center;padding:.18rem .6rem;border-radius:.3rem;font-size:.62rem;font-weight:700;text-transform:uppercase;letter-spacing:.05em;font-family:'JetBrains Mono',monospace}
.badge-verde{background:rgba(0,255,148,.1);color:var(--verde);border:1px solid rgba(0,255,148,.2)}
.badge-azul{background:rgba(59,130,246,.1);color:var(--azul);border:1px solid rgba(59,130,246,.2)}
.badge-oro{background:rgba(251,191,36,.1);color:var(--oro);border:1px solid rgba(251,191,36,.2)}
.badge-purple{background:rgba(167,139,250,.1);color:#a78bfa;border:1px solid rgba(167,139,250,.2)}
.badge-leaf{background:rgba(74,222,128,.1);color:#4ade80;border:1px solid rgba(74,222,128,.2)}

.btn-solicitar{display:inline-flex;align-items:center;gap:.3rem;background:var(--azul2);color:#fff;font-family:'Bebas Neue',sans-serif;font-size:.85rem;letter-spacing:.05em;padding:.4rem 1rem;border-radius:.4rem;border:none;cursor:pointer;text-decoration:none;transition:all .2s}
.btn-solicitar:hover{background:var(--azul);transform:translateY(-1px)}

.hidden{display:none!important}
</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="page-hero animate-up">
  <div>
    <div class="breadcrumb">
      <a href="Default.aspx">Inicio</a><span>›</span>
      <span style="color:var(--text)">Servicios</span>
    </div>
    <div class="page-title">Catálogo de Servicios</div>
    <div class="page-sub">Explora todos los servicios disponibles en la plataforma</div>
  </div>
  <div style="text-align:right">
    <div style="font-family:'Bebas Neue',sans-serif;font-size:2rem;color:var(--azul)">6</div>
    <div style="font-size:.72rem;color:var(--muted);text-transform:uppercase;letter-spacing:.08em">Servicios activos</div>
  </div>
</div>

<div class="cat-tabs animate-up delay-1">
  <button class="cat-tab active" onclick="filtrarCat('')">Todos</button>
  <button class="cat-tab" onclick="filtrarCat('plomeria')">🔧 Plomería</button>
  <button class="cat-tab" onclick="filtrarCat('electricidad')">⚡ Electricidad</button>
  <button class="cat-tab" onclick="filtrarCat('carpinteria')">🪵 Carpintería</button>
  <button class="cat-tab" onclick="filtrarCat('pintura')">🎨 Pintura</button>
  <button class="cat-tab" onclick="filtrarCat('jardineria')">🌿 Jardinería</button>
</div>

<div class="serv-grid animate-up delay-2">

  <div class="serv-card" data-cat="plomeria">
    <div class="serv-band" style="background:linear-gradient(90deg,#00C47A,#00FF94)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:var(--verde)">🔧 Plomería</div>
      <div class="serv-name">Reparación de Tuberías</div>
      <div class="serv-desc">Detección y reparación de fugas, cambio de tuberías, instalación de llaves y grifos en cualquier zona de Medellín.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 Fix Home <span class="badge badge-verde" style="margin-left:.35rem">Disponible</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

  <div class="serv-card" data-cat="electricidad">
    <div class="serv-band" style="background:linear-gradient(90deg,#1D4ED8,#3B82F6)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:var(--azul)">⚡ Electricidad</div>
      <div class="serv-name">Instalación Eléctrica</div>
      <div class="serv-desc">Instalación de tomas, switchs, paneles eléctricos, iluminación LED y revisión de redes eléctricas completas.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 Electro MED <span class="badge badge-verde" style="margin-left:.35rem">Disponible</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

  <div class="serv-card" data-cat="carpinteria">
    <div class="serv-band" style="background:linear-gradient(90deg,#b45309,#FBBF24)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:var(--oro)">🪵 Carpintería</div>
      <div class="serv-name">Muebles a la Medida</div>
      <div class="serv-desc">Diseño y fabricación de cocinas integrales, closets, bibliotecas y todo tipo de muebles en madera y MDF.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 Carpintería Ríos <span class="badge badge-oro" style="margin-left:.35rem">Ocupado</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

  <div class="serv-card" data-cat="pintura">
    <div class="serv-band" style="background:linear-gradient(90deg,#6d28d9,#a78bfa)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:#a78bfa">🎨 Pintura</div>
      <div class="serv-name">Pintura de Interiores</div>
      <div class="serv-desc">Pintura de paredes, techos y fachadas. Acabados decorativos, texturas y aplicación de pintura anticorrosiva.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 PintaMed <span class="badge badge-purple" style="margin-left:.35rem">Disponible</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

  <div class="serv-card" data-cat="jardineria">
    <div class="serv-band" style="background:linear-gradient(90deg,#065f46,#4ade80)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:#4ade80">🌿 Jardinería</div>
      <div class="serv-name">Diseño de Jardines</div>
      <div class="serv-desc">Diseño paisajístico, siembra de plantas, poda, mantenimiento de jardines y terrazas verdes en altura.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 Verde Urbano <span class="badge badge-leaf" style="margin-left:.35rem">Disponible</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

  <div class="serv-card" data-cat="electricidad">
    <div class="serv-band" style="background:linear-gradient(90deg,#991b1b,#F87171)"></div>
    <div class="serv-body">
      <div class="serv-cat-label" style="color:var(--rojo)">🔌 Electricidad</div>
      <div class="serv-name">Redes de Datos y CCTV</div>
      <div class="serv-desc">Instalación de cableado estructurado, cámaras de seguridad, puntos de red y sistemas de domótica básica.</div>
      <div class="serv-footer">
        <div class="serv-proveedor">🏪 TechFix <span class="badge badge-rojo" style="margin-left:.35rem">Inactivo</span></div>
        <a href="SolicitarServicio.aspx" class="btn-solicitar">Solicitar →</a>
      </div>
    </div>
  </div>

</div>
</asp:Content>

<asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
<script>
function filtrarCat(cat){
  document.querySelectorAll('.cat-tab').forEach(function(t){t.classList.remove('active')});
  event.target.classList.add('active');
  document.querySelectorAll('.serv-card').forEach(function(c){
    c.style.display=(cat===''||c.dataset.cat===cat)?'':'none';
  });
}
document.querySelectorAll('.serv-card').forEach(function(c){
  c.addEventListener('mousemove',function(e){
    var r=c.getBoundingClientRect(),rx=((e.clientY-r.top)/r.height-.5)*-7,ry=((e.clientX-r.left)/r.width-.5)*7;
    c.style.transform='translateY(-5px) rotateX('+rx+'deg) rotateY('+ry+'deg)';
  });
  c.addEventListener('mouseleave',function(){c.style.transform='';});
});
</script>
</asp:Content>
