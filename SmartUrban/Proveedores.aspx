<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
  CodeBehind="Proveedores.aspx.cs" Inherits="SmartUrban.Proveedores" %>

  <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
      .page-hero {
        background: linear-gradient(90deg, rgba(0, 196, 122, .08), transparent);
        border: 1px solid rgba(0, 255, 148, .1);
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
        background: radial-gradient(circle, rgba(0, 255, 148, .07) 0%, transparent 70%);
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
        cursor: pointer;
        transition: border-color .2s
      }

      .filter-select:focus {
        border-color: rgba(0, 255, 148, .3)
      }

      .filter-select option {
        background: var(--panel)
      }

      .view-toggle {
        display: flex;
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        overflow: hidden
      }

      .vt-btn {
        padding: .5rem .75rem;
        cursor: pointer;
        color: var(--muted);
        font-size: .8rem;
        border: none;
        background: none;
        transition: all .2s
      }

      .vt-btn.active {
        background: rgba(0, 255, 148, .1);
        color: var(--verde)
      }

      /* GRID VIEW */
      .prov-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 1.1rem;
        margin-bottom: 2rem
      }

      .prov-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        transition: all .35s cubic-bezier(.34, 1.56, .64, 1);
        cursor: pointer;
        position: relative
      }

      .prov-card:hover {
        border-color: rgba(0, 255, 148, .25);
        transform: translateY(-5px);
        box-shadow: 0 18px 50px rgba(0, 0, 0, .45)
      }

      .prov-card-header {
        padding: 1.25rem 1.25rem .875rem;
        display: flex;
        align-items: flex-start;
        gap: .875rem
      }

      .prov-avatar {
        width: 46px;
        height: 46px;
        border-radius: .6rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.3rem;
        flex-shrink: 0
      }

      .prov-info {
        flex: 1;
        min-width: 0
      }

      .prov-name {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.1rem;
        letter-spacing: .04em;
        color: #fff;
        margin-bottom: .2rem
      }

      .prov-tipo {
        font-size: .7rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .08em;
        color: var(--muted)
      }

      .prov-rating {
        display: flex;
        align-items: center;
        gap: .3rem;
        font-family: 'JetBrains Mono', monospace;
        font-size: .72rem;
        color: var(--oro)
      }

      .prov-body {
        padding: 0 1.25rem .875rem
      }

      .prov-tel {
        font-size: .76rem;
        color: var(--muted);
        display: flex;
        align-items: center;
        gap: .4rem;
        margin-bottom: .5rem
      }

      .prov-footer {
        padding: .875rem 1.25rem;
        border-top: 1px solid var(--border);
        display: flex;
        align-items: center;
        justify-content: space-between
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

      .prov-action {
        display: flex;
        gap: .5rem
      }

      .btn-xs {
        padding: .3rem .75rem;
        border-radius: .35rem;
        font-family: 'Bebas Neue', sans-serif;
        font-size: .8rem;
        letter-spacing: .05em;
        cursor: pointer;
        border: none;
        transition: all .2s;
        text-decoration: none;
        display: inline-flex;
        align-items: center
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

      .btn-xs-ghost {
        background: transparent;
        color: var(--muted);
        border: 1px solid var(--border)
      }

      .btn-xs-ghost:hover {
        color: #fff;
        border-color: rgba(255, 255, 255, .2)
      }

      /* TABLE VIEW */
      .table-wrap {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        margin-bottom: 2rem
      }

      .data-table {
        width: 100%;
        border-collapse: collapse
      }

      .data-table thead {
        background: rgba(255, 255, 255, .03)
      }

      .data-table thead th {
        padding: .75rem 1rem;
        text-align: left;
        font-size: .68rem;
        font-weight: 700;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .07em;
        border-bottom: 1px solid var(--border);
        font-family: 'Space Grotesk', sans-serif
      }

      .data-table tbody tr {
        border-bottom: 1px solid rgba(255, 255, 255, .04);
        transition: background .15s
      }

      .data-table tbody tr:hover {
        background: rgba(255, 255, 255, .03)
      }

      .data-table td {
        padding: .875rem 1rem;
        font-size: .82rem;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif
      }

      .td-avatar {
        display: flex;
        align-items: center;
        gap: .625rem
      }

      .td-av {
        width: 32px;
        height: 32px;
        border-radius: .4rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: .9rem;
        flex-shrink: 0
      }

      /* MAPA */
      .map-section {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        margin-bottom: 2rem
      }

      .map-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        display: flex;
        align-items: center;
        justify-content: space-between
      }

      .map-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1rem;
        letter-spacing: .06em;
        color: var(--verde)
      }

      #mapa-proveedores {
        width: 100%;
        height: 420px
      }

      .hidden {
        display: none !important
      }

      @media(max-width:640px) {
        .toolbar {
          flex-direction: column;
          align-items: stretch
        }

        .search-box {
          min-width: unset
        }
      }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.min.css" />
    <style>
      .leaflet-container {
        background: #0B1220 !important
      }

      .leaflet-tile {
        filter: none !important
      }

      .leaflet-control-attribution {
        background: rgba(6, 10, 16, .8) !important;
        color: #64748B !important;
        font-size: .6rem !important
      }

      .leaflet-popup-content-wrapper {
        background: #141B2D !important;
        border: 1px solid rgba(255, 255, 255, .1) !important;
        border-radius: .5rem !important;
        color: #e2e8f0 !important
      }

      .leaflet-popup-tip {
        background: #141B2D !important
      }
    </style>
  </asp:Content>

  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-hero animate-up">
      <div>
        <div class="breadcrumb">
          <a href="Default.aspx">Inicio</a>
          <span>›</span>
          <span style="color:var(--text)">Proveedores</span>
        </div>
        <div class="page-title">Proveedores</div>
        <div class="page-sub">Gestiona todos los proveedores de servicio registrados en la plataforma</div>
      </div>
      <a href="RegistrarProveedor.aspx" class="btn-verde"
        style="font-family:'Bebas Neue',sans-serif;font-size:1rem;letter-spacing:.06em;padding:.6rem 1.5rem;border-radius:.5rem;background:var(--verde);color:#060A10;text-decoration:none;display:inline-flex;align-items:center;gap:.4rem;transition:all .2s">➕
        Nuevo Proveedor</a>
    </div>

    <div class="toolbar animate-up delay-1">
      <div class="search-box">
        <span style="color:var(--muted);font-size:.85rem">🔍</span>
        <input type="text" placeholder="Buscar proveedor..." id="search-input" oninput="filtrar()">
      </div>
      <select class="filter-select" id="filter-tipo" onchange="filtrar()">
        <option value="">Todos los tipos</option>
        <option>Plomería</option>
        <option>Electricidad</option>
        <option>Carpintería</option>
        <option>Pintura</option>
        <option>Jardinería</option>
      </select>
      <div class="view-toggle">
        <button class="vt-btn active" id="btn-grid" onclick="setView('grid')">▦ Grid</button>
        <button class="vt-btn" id="btn-table" onclick="setView('table')">☰ Tabla</button>
        <button class="vt-btn" id="btn-mapa" onclick="setView('mapa')">📍 Mapa</button>
      </div>
    </div>

    <!-- GRID -->
    <div class="prov-grid animate-up delay-2" id="view-grid">
      <div class="prov-card" data-nombre="Fix Home" data-tipo="Plomería">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(0,255,148,.1)">🔧</div>
          <div class="prov-info">
            <div class="prov-name">Fix Home</div>
            <div class="prov-tipo">Plomería · Carpintería</div>
            <div class="prov-rating">⭐ 4.9 <span style="color:var(--muted)">(32 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 310 234 5678</div>
          <div class="prov-tel">📍 El Poblado, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-verde">Activo</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
      <div class="prov-card" data-nombre="Electro MED" data-tipo="Electricidad">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(59,130,246,.1)">⚡</div>
          <div class="prov-info">
            <div class="prov-name">Electro MED</div>
            <div class="prov-tipo">Electricidad</div>
            <div class="prov-rating">⭐ 4.7 <span style="color:var(--muted)">(18 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 320 876 5432</div>
          <div class="prov-tel">📍 Laureles, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-verde">Activo</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
      <div class="prov-card" data-nombre="Carpintería Ríos" data-tipo="Carpintería">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(251,191,36,.1)">🪵</div>
          <div class="prov-info">
            <div class="prov-name">Carpintería Ríos</div>
            <div class="prov-tipo">Carpintería · Remodelación</div>
            <div class="prov-rating">⭐ 4.8 <span style="color:var(--muted)">(27 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 315 432 1098</div>
          <div class="prov-tel">📍 Envigado, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-oro">Ocupado</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
      <div class="prov-card" data-nombre="PintaMed" data-tipo="Pintura">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(167,139,250,.1)">🎨</div>
          <div class="prov-info">
            <div class="prov-name">PintaMed</div>
            <div class="prov-tipo">Pintura · Acabados</div>
            <div class="prov-rating">⭐ 4.6 <span style="color:var(--muted)">(14 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 301 567 8901</div>
          <div class="prov-tel">📍 Belén, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-verde">Activo</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
      <div class="prov-card" data-nombre="Verde Urbano" data-tipo="Jardinería">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(74,222,128,.1)">🌿</div>
          <div class="prov-info">
            <div class="prov-name">Verde Urbano</div>
            <div class="prov-tipo">Jardinería · Paisajismo</div>
            <div class="prov-rating">⭐ 5.0 <span style="color:var(--muted)">(9 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 312 890 1234</div>
          <div class="prov-tel">📍 Sabaneta, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-verde">Activo</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
      <div class="prov-card" data-nombre="TechFix" data-tipo="Electricidad">
        <div class="prov-card-header">
          <div class="prov-avatar" style="background:rgba(248,113,113,.1)">🔌</div>
          <div class="prov-info">
            <div class="prov-name">TechFix</div>
            <div class="prov-tipo">Electricidad · Redes</div>
            <div class="prov-rating">⭐ 4.5 <span style="color:var(--muted)">(22 reseñas)</span></div>
          </div>
        </div>
        <div class="prov-body">
          <div class="prov-tel">📞 +57 318 234 5670</div>
          <div class="prov-tel">📍 Itagüí, Medellín</div>
        </div>
        <div class="prov-footer">
          <span class="badge badge-rojo">Inactivo</span>
          <div class="prov-action">
            <a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a>
            <span class="btn-xs btn-xs-ghost">Ver más</span>
          </div>
        </div>
      </div>
    </div>

    <!-- TABLA -->
    <div class="table-wrap hidden animate-up delay-2" id="view-table">
      <table class="data-table">
        <thead>
          <tr>
            <th>Proveedor</th>
            <th>Tipo</th>
            <th>Teléfono</th>
            <th>Ubicación</th>
            <th>Rating</th>
            <th>Estado</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(0,255,148,.1)">🔧</div>Fix Home
              </div>
            </td>
            <td>Plomería</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 310 234 5678</td>
            <td>El Poblado</td>
            <td style="color:var(--oro)">⭐ 4.9</td>
            <td><span class="badge badge-verde">Activo</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(59,130,246,.1)">⚡</div>Electro MED
              </div>
            </td>
            <td>Electricidad</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 320 876 5432</td>
            <td>Laureles</td>
            <td style="color:var(--oro)">⭐ 4.7</td>
            <td><span class="badge badge-verde">Activo</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(251,191,36,.1)">🪵</div>Carpintería Ríos
              </div>
            </td>
            <td>Carpintería</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 315 432 1098</td>
            <td>Envigado</td>
            <td style="color:var(--oro)">⭐ 4.8</td>
            <td><span class="badge badge-oro">Ocupado</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(167,139,250,.1)">🎨</div>PintaMed
              </div>
            </td>
            <td>Pintura</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 301 567 8901</td>
            <td>Belén</td>
            <td style="color:var(--oro)">⭐ 4.6</td>
            <td><span class="badge badge-verde">Activo</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(74,222,128,.1)">🌿</div>Verde Urbano
              </div>
            </td>
            <td>Jardinería</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 312 890 1234</td>
            <td>Sabaneta</td>
            <td style="color:var(--oro)">⭐ 5.0</td>
            <td><span class="badge badge-verde">Activo</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
          <tr>
            <td>
              <div class="td-avatar">
                <div class="td-av" style="background:rgba(248,113,113,.1)">🔌</div>TechFix
              </div>
            </td>
            <td>Electricidad</td>
            <td style="font-family:'JetBrains Mono',monospace;font-size:.75rem">+57 318 234 5670</td>
            <td>Itagüí</td>
            <td style="color:var(--oro)">⭐ 4.5</td>
            <td><span class="badge badge-rojo">Inactivo</span></td>
            <td><a href="SolicitarServicio.aspx" class="btn-xs btn-xs-verde">Solicitar</a></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- MAPA -->
    <div class="map-section hidden animate-up delay-2" id="view-mapa">
      <div class="map-header">
        <span class="map-title">📍 UBICACIÓN DE PROVEEDORES</span>
        <span style="font-size:.72rem;color:var(--muted);font-family:'JetBrains Mono',monospace">6 proveedores
          activos</span>
      </div>
      <div id="mapa-proveedores" style="width:100%;height:440px;display:block;"></div>
      <script>
          (function () {
              function tryInit() {
                  if (typeof L === 'undefined') { setTimeout(tryInit, 100); return; }
                  var el = document.getElementById('mapa-proveedores');
                  if (!el || window._mapaProveedores) return;
                  var m = L.map('mapa-proveedores', { center: [6.2442, -75.5812], zoom: 12 });
                  L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
                      attribution: '&copy; OSM &copy; CARTO', maxZoom: 19, subdomains: 'abcd'
                  }).addTo(m);
                  window._mapaProveedores = m;
                  var provs = [
                      { lat: 6.2088, lng: -75.5680, nombre: 'Fix Home', color: '#00FF94' },
                      { lat: 6.2518, lng: -75.5736, nombre: 'Electro MED', color: '#3B82F6' },
                      { lat: 6.1693, lng: -75.5866, nombre: 'Carpintería Ríos', color: '#FBBF24' },
                      { lat: 6.2317, lng: -75.6040, nombre: 'PintaMed', color: '#a78bfa' },
                      { lat: 6.1457, lng: -75.6143, nombre: 'Verde Urbano', color: '#4ade80' },
                      { lat: 6.1847, lng: -75.5997, nombre: 'TechFix', color: '#F87171' }
                  ];
                  provs.forEach(function (p) {
                      var ico = L.divIcon({ className: '', html: '<div style="width:12px;height:12px;border-radius:50%;background:' + p.color + ';border:2px solid #fff;box-shadow:0 0 10px ' + p.color + ';"></div>', iconSize: [12, 12], iconAnchor: [6, 6], popupAnchor: [0, -8] });
                      L.marker([p.lat, p.lng], { icon: ico }).addTo(m).bindPopup('<div style="font-family:Space Grotesk,sans-serif;font-size:12px;color:#e2e8f0">' + p.nombre + '</div>');
                  });
                  setTimeout(function () { m.invalidateSize(); }, 300);
              }
              // Wait for the div to be visible (user clicks Mapa tab)
              window._initMapaProveedores = tryInit;
          })();
      </script>
    </div>

  </asp:Content>

  <asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        var mapaIniciado = false;
        function setView(v) {
            document.getElementById('view-grid').classList.add('hidden');
            document.getElementById('view-table').classList.add('hidden');
            document.getElementById('view-mapa').classList.add('hidden');
            document.getElementById('view-' + v).classList.remove('hidden');
            ['grid', 'table', 'mapa'].forEach(function (x) { document.getElementById('btn-' + x).classList.remove('active'); });
            document.getElementById('btn-' + v).classList.add('active');
            if (v === 'mapa' && !mapaIniciado) { mapaIniciado = true; if (window._initMapaProveedores) window._initMapaProveedores(); }
        }
        function filtrar() {
            var q = document.getElementById('search-input').value.toLowerCase();
            var t = document.getElementById('filter-tipo').value.toLowerCase();
            document.querySelectorAll('.prov-card').forEach(function (c) {
                var n = c.dataset.nombre.toLowerCase(), ti = c.dataset.tipo.toLowerCase();
                c.style.display = (n.includes(q) || (t === '' || ti.includes(t))) ? '' : 'none';
            });
        }
        function initMapa() {
            if (typeof L === 'undefined') { setTimeout(initMapa, 200); return; }
            var el = document.getElementById('mapa-proveedores');
            if (!el) return;
            var m = L.map('mapa-proveedores', { center: [6.2442, -75.5812], zoom: 12 });
            L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
                attribution: '&copy; OSM &copy; CARTO', maxZoom: 19, subdomains: 'abcd'
            }).addTo(m);
            m.invalidateSize();
            var provs = [
                { lat: 6.2088, lng: -75.5680, nombre: 'Fix Home', color: '#00FF94' },
                { lat: 6.2518, lng: -75.5736, nombre: 'Electro MED', color: '#3B82F6' },
                { lat: 6.1693, lng: -75.5866, nombre: 'Carpintería Ríos', color: '#FBBF24' },
                { lat: 6.2317, lng: -75.6040, nombre: 'PintaMed', color: '#a78bfa' },
                { lat: 6.1457, lng: -75.6143, nombre: 'Verde Urbano', color: '#4ade80' },
                { lat: 6.1847, lng: -75.5997, nombre: 'TechFix', color: '#F87171' },
            ];
            provs.forEach(function (p) {
                var icono = L.divIcon({
                    className: '',
                    html: '<div style="width:12px;height:12px;border-radius:50%;background:' + p.color + ';border:2px solid #fff;box-shadow:0 0 10px ' + p.color + ';"></div>',
                    iconSize: [12, 12], iconAnchor: [6, 6], popupAnchor: [0, -8]
                });
                L.marker([p.lat, p.lng], { icon: icono }).addTo(m)
                    .bindPopup('<div style="font-family:Space Grotesk,sans-serif;font-size:12px;color:#e2e8f0">' + p.nombre + '</div>');
            });
        }
        document.querySelectorAll('.prov-card').forEach(function (c) {
            c.addEventListener('mousemove', function (e) {
                var r = c.getBoundingClientRect(), rx = ((e.clientY - r.top) / r.height - .5) * -8, ry = ((e.clientX - r.left) / r.width - .5) * 8;
                c.style.transform = 'translateY(-5px) rotateX(' + rx + 'deg) rotateY(' + ry + 'deg)';
            });
            c.addEventListener('mouseleave', function () { c.style.transform = ''; });
        });
    </script>
  </asp:Content>