<%@ Page Title="Solicitudes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
  CodeBehind="Solicitudes.aspx.cs" Inherits="SmartUrban.Solicitudes" %>

  <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
      .page-hero {
        background: linear-gradient(90deg, rgba(251, 191, 36, .08), transparent);
        border: 1px solid rgba(251, 191, 36, .12);
        border-radius: .875rem;
        padding: 1.75rem 2rem;
        margin-bottom: 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 1rem;
        position: relative;
        overflow: hidden
      }

      .page-hero::before {
        content: '';
        position: absolute;
        right: -60px;
        top: -60px;
        width: 220px;
        height: 220px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(251, 191, 36, .07) 0%, transparent 70%);
        pointer-events: none
      }

      .breadcrumb {
        display: flex;
        align-items: center;
        gap: .5rem;
        font-size: .75rem;
        margin-bottom: .6rem
      }

      .breadcrumb a {
        color: var(--azul);
        text-decoration: none
      }

      .breadcrumb a:hover {
        color: var(--verde)
      }

      .breadcrumb span {
        color: var(--muted)
      }

      .page-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 2.2rem;
        letter-spacing: .05em;
        color: #fff;
        line-height: 1
      }

      .page-sub {
        font-size: .82rem;
        color: var(--muted);
        margin-top: .3rem
      }

      .stats-mini {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: .75rem;
        margin-bottom: 1.75rem
      }

      .sm-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .75rem;
        padding: 1rem;
        display: flex;
        align-items: center;
        gap: .875rem
      }

      .sm-icon {
        width: 38px;
        height: 38px;
        border-radius: .5rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.1rem;
        flex-shrink: 0
      }

      .sm-val {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.6rem;
        line-height: 1;
        color: #fff
      }

      .sm-lbl {
        font-size: .65rem;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .07em;
        margin-top: .15rem
      }

      .toolbar {
        display: flex;
        align-items: center;
        gap: .75rem;
        margin-bottom: 1.5rem;
        flex-wrap: wrap
      }

      .search-box {
        display: flex;
        align-items: center;
        gap: .5rem;
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        padding: .5rem 1rem;
        flex: 1;
        min-width: 200px;
        transition: border-color .2s
      }

      .search-box:focus-within {
        border-color: rgba(0, 255, 148, .3)
      }

      .search-box input {
        background: none;
        border: none;
        outline: none;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .82rem;
        width: 100%
      }

      .search-box input::placeholder {
        color: var(--muted)
      }

      .filter-select {
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        padding: .5rem .875rem;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .8rem;
        outline: none;
        cursor: pointer
      }

      .filter-select option {
        background: var(--panel)
      }

      .sol-list {
        display: flex;
        flex-direction: column;
        gap: .875rem;
        margin-bottom: 2rem
      }

      .sol-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        padding: 1.25rem;
        display: grid;
        grid-template-columns: auto 1fr auto;
        gap: 1.1rem;
        align-items: start;
        transition: all .25s;
        position: relative;
        overflow: hidden
      }

      .sol-card::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 3px;
        border-radius: 0;
        transition: background .2s
      }

      .sol-card.pendiente::before {
        background: var(--oro)
      }

      .sol-card.activa::before {
        background: var(--verde)
      }

      .sol-card.completada::before {
        background: var(--azul)
      }

      .sol-card:hover {
        border-color: rgba(255, 255, 255, .12);
        transform: translateX(3px)
      }

      .sol-id {
        font-family: 'JetBrains Mono', monospace;
        font-size: .65rem;
        color: var(--muted);
        background: rgba(255, 255, 255, .05);
        border: 1px solid var(--border);
        border-radius: .35rem;
        padding: .3rem .65rem;
        white-space: nowrap;
        align-self: center
      }

      .sol-info {
        min-width: 0
      }

      .sol-titulo {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.05rem;
        letter-spacing: .04em;
        color: #fff;
        margin-bottom: .3rem
      }

      .sol-meta {
        display: flex;
        align-items: center;
        gap: 1rem;
        flex-wrap: wrap;
        margin-bottom: .5rem
      }

      .sol-meta-item {
        font-size: .72rem;
        color: var(--muted);
        display: flex;
        align-items: center;
        gap: .3rem
      }

      .sol-desc {
        font-size: .76rem;
        color: var(--muted);
        line-height: 1.5
      }

      .sol-actions {
        display: flex;
        flex-direction: column;
        gap: .4rem;
        align-items: flex-end
      }

      .badge {
        display: inline-flex;
        align-items: center;
        padding: .18rem .6rem;
        border-radius: .3rem;
        font-size: .62rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: .05em;
        font-family: 'JetBrains Mono', monospace
      }

      .badge-verde {
        background: rgba(0, 255, 148, .1);
        color: var(--verde);
        border: 1px solid rgba(0, 255, 148, .2)
      }

      .badge-azul {
        background: rgba(59, 130, 246, .1);
        color: var(--azul);
        border: 1px solid rgba(59, 130, 246, .2)
      }

      .badge-oro {
        background: rgba(251, 191, 36, .1);
        color: var(--oro);
        border: 1px solid rgba(251, 191, 36, .2)
      }

      .badge-rojo {
        background: rgba(248, 113, 113, .1);
        color: var(--rojo);
        border: 1px solid rgba(248, 113, 113, .2)
      }

      .btn-xs {
        padding: .3rem .75rem;
        border-radius: .35rem;
        font-family: 'Bebas Neue', sans-serif;
        font-size: .78rem;
        letter-spacing: .05em;
        cursor: pointer;
        border: none;
        transition: all .2s;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        white-space: nowrap
      }

      .btn-xs-verde {
        background: rgba(0, 255, 148, .1);
        color: var(--verde);
        border: 1px solid rgba(0, 255, 148, .2)
      }

      .btn-xs-verde:hover {
        background: var(--verde);
        color: #060A10
      }

      .btn-xs-azul {
        background: rgba(59, 130, 246, .1);
        color: var(--azul);
        border: 1px solid rgba(59, 130, 246, .2)
      }

      .btn-xs-azul:hover {
        background: var(--azul);
        color: #fff
      }

      .btn-xs-ghost {
        background: transparent;
        color: var(--muted);
        border: 1px solid var(--border)
      }

      .btn-xs-ghost:hover {
        color: #fff;
        border-color: rgba(255, 255, 255, .2)
      }

      .empty-state {
        text-align: center;
        padding: 4rem 2rem;
        color: var(--muted)
      }

      .empty-state .e-icon {
        font-size: 3rem;
        margin-bottom: 1rem;
        opacity: .4
      }

      .empty-state h3 {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.5rem;
        letter-spacing: .05em;
        color: rgba(255, 255, 255, .3);
        margin-bottom: .5rem
      }
    </style>
  </asp:Content>

  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-hero animate-up">
      <div>
        <div class="breadcrumb">
          <a href="Default.aspx">Inicio</a><span>›</span>
          <span style="color:var(--text)">Solicitudes</span>
        </div>
        <div class="page-title">Solicitudes</div>
        <div class="page-sub">Historial y seguimiento de todas las solicitudes de servicio</div>
      </div>
      <a href="SolicitarServicio.aspx"
        style="display:inline-flex;align-items:center;gap:.4rem;background:var(--oro);color:#060A10;font-family:'Bebas Neue',sans-serif;font-size:1rem;letter-spacing:.06em;padding:.6rem 1.5rem;border-radius:.5rem;text-decoration:none;transition:all .2s">📋
        Nueva Solicitud</a>
    </div>

    <div class="stats-mini animate-up delay-1">
      <div class="sm-card">
        <div class="sm-icon" style="background:rgba(251,191,36,.1)">⏳</div>
        <div>
          <div class="sm-val" style="color:var(--oro)">2</div>
          <div class="sm-lbl">Pendientes</div>
        </div>
      </div>
      <div class="sm-card">
        <div class="sm-icon" style="background:rgba(0,255,148,.1)">🔄</div>
        <div>
          <div class="sm-val" style="color:var(--verde)">1</div>
          <div class="sm-lbl">En proceso</div>
        </div>
      </div>
      <div class="sm-card">
        <div class="sm-icon" style="background:rgba(59,130,246,.1)">✅</div>
        <div>
          <div class="sm-val" style="color:var(--azul)">5</div>
          <div class="sm-lbl">Completadas</div>
        </div>
      </div>
      <div class="sm-card">
        <div class="sm-icon" style="background:rgba(248,113,113,.1)">❌</div>
        <div>
          <div class="sm-val" style="color:var(--rojo)">0</div>
          <div class="sm-lbl">Canceladas</div>
        </div>
      </div>
    </div>

    <div class="toolbar animate-up delay-1">
      <div class="search-box">
        <span style="color:var(--muted);font-size:.85rem">🔍</span>
        <input type="text" placeholder="Buscar solicitud...">
      </div>
      <select class="filter-select">
        <option>Todos los estados</option>
        <option>Pendiente</option>
        <option>En proceso</option>
        <option>Completada</option>
      </select>
      <select class="filter-select">
        <option>Todos los servicios</option>
        <option>Plomería</option>
        <option>Electricidad</option>
        <option>Carpintería</option>
      </select>
    </div>

    <div class="sol-list animate-up delay-2">

      <div class="sol-card activa">
        <div class="sol-id">#SOL-001</div>
        <div class="sol-info">
          <div class="sol-titulo">Reparación de fuga en baño principal</div>
          <div class="sol-meta">
            <span class="sol-meta-item">🔧 Plomería</span>
            <span class="sol-meta-item">🏪 Fix Home</span>
            <span class="sol-meta-item">📅 17 Mar 2025</span>
            <span class="sol-meta-item">📍 El Poblado</span>
          </div>
          <div class="sol-desc">Hay una fuga de agua en la tubería detrás del sanitario. El agua está saliendo por la
            pared y mojando el piso del pasillo.</div>
        </div>
        <div class="sol-actions">
          <span class="badge badge-verde">En proceso</span>
          <a href="CalificarServicio.aspx" class="btn-xs btn-xs-azul">⭐ Calificar</a>
          <span class="btn-xs btn-xs-ghost">Ver detalle</span>
        </div>
      </div>

      <div class="sol-card pendiente">
        <div class="sol-id">#SOL-002</div>
        <div class="sol-info">
          <div class="sol-titulo">Instalación de puntos eléctricos cocina</div>
          <div class="sol-meta">
            <span class="sol-meta-item">⚡ Electricidad</span>
            <span class="sol-meta-item">🏪 Electro MED</span>
            <span class="sol-meta-item">📅 15 Mar 2025</span>
            <span class="sol-meta-item">📍 Laureles</span>
          </div>
          <div class="sol-desc">Necesito instalar 4 tomas adicionales en la cocina para electrodomésticos nuevos.
            Requiere trabajo con el tablero principal.</div>
        </div>
        <div class="sol-actions">
          <span class="badge badge-oro">Pendiente</span>
          <span class="btn-xs btn-xs-ghost">Ver detalle</span>
        </div>
      </div>

      <div class="sol-card pendiente">
        <div class="sol-id">#SOL-003</div>
        <div class="sol-info">
          <div class="sol-titulo">Closet empotrado para habitación</div>
          <div class="sol-meta">
            <span class="sol-meta-item">🪵 Carpintería</span>
            <span class="sol-meta-item">🏪 Carpintería Ríos</span>
            <span class="sol-meta-item">📅 14 Mar 2025</span>
            <span class="sol-meta-item">📍 Envigado</span>
          </div>
          <div class="sol-desc">Closet de 3 metros de ancho x 2.5 de alto. Con cajones, zapatera y espacio para colgar.
            Material MDF blanco.</div>
        </div>
        <div class="sol-actions">
          <span class="badge badge-oro">Pendiente</span>
          <span class="btn-xs btn-xs-ghost">Ver detalle</span>
        </div>
      </div>

      <div class="sol-card completada">
        <div class="sol-id">#SOL-004</div>
        <div class="sol-info">
          <div class="sol-titulo">Pintura sala y comedor</div>
          <div class="sol-meta">
            <span class="sol-meta-item">🎨 Pintura</span>
            <span class="sol-meta-item">🏪 PintaMed</span>
            <span class="sol-meta-item">📅 10 Mar 2025</span>
            <span class="sol-meta-item">📍 Belén</span>
          </div>
          <div class="sol-desc">Pintura completa de sala y comedor. Dos manos de pintura blanca hueso en paredes,
            esmalte gris en rodapiés.</div>
        </div>
        <div class="sol-actions">
          <span class="badge badge-azul">Completada</span>
          <a href="CalificarServicio.aspx" class="btn-xs btn-xs-verde">⭐ Calificar</a>
          <span class="btn-xs btn-xs-ghost">Ver detalle</span>
        </div>
      </div>

    </div>
  </asp:Content>

  <asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
    <script>
      document.querySelectorAll('.sol-card').forEach(function (c) {
        c.addEventListener('mouseenter', function () { c.style.boxShadow = '0 8px 30px rgba(0,0,0,.35)'; });
        c.addEventListener('mouseleave', function () { c.style.boxShadow = ''; });
      });
    </script>
  </asp:Content>