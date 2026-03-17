<%@ Page Title="Registrar Proveedor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
  CodeBehind="RegistrarProveedor.aspx.cs" Inherits="SmartUrban.RegistrarProveedor" %>

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
        gap: 1rem
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

      .form-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.5rem;
        margin-bottom: 2rem
      }

      .form-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden
      }

      .form-card-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        background: rgba(255, 255, 255, .02);
        display: flex;
        align-items: center;
        gap: .5rem
      }

      .form-card-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1rem;
        letter-spacing: .06em
      }

      .form-card-body {
        padding: 1.5rem 1.25rem;
        display: flex;
        flex-direction: column;
        gap: 1.1rem
      }

      .field {
        display: flex;
        flex-direction: column;
        gap: .4rem
      }

      .field label {
        font-size: .7rem;
        font-weight: 700;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .08em
      }

      .field input,
      .field select,
      .field textarea {
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        padding: .65rem .875rem;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .82rem;
        outline: none;
        transition: border-color .2s, box-shadow .2s;
        width: 100%
      }

      .field input:focus,
      .field select:focus,
      .field textarea:focus {
        border-color: rgba(0, 255, 148, .35);
        box-shadow: 0 0 0 3px rgba(0, 255, 148, .07)
      }

      .field input::placeholder,
      .field textarea::placeholder {
        color: var(--muted)
      }

      .field select option {
        background: var(--panel)
      }

      .field textarea {
        resize: vertical;
        min-height: 90px
      }

      .field-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: .875rem
      }

      .map-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        margin-bottom: 1.5rem
      }

      .map-card-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        background: rgba(255, 255, 255, .02);
        display: flex;
        align-items: center;
        justify-content: space-between
      }

      .map-card-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1rem;
        letter-spacing: .06em;
        color: var(--verde)
      }

      .map-hint {
        font-size: .72rem;
        color: var(--muted);
        font-family: 'JetBrains Mono', monospace
      }

      #mapa-registro {
        width: 100%;
        height: 380px
      }

      .coords-display {
        padding: .875rem 1.25rem;
        border-top: 1px solid var(--border);
        display: flex;
        align-items: center;
        gap: 1.25rem;
        background: rgba(0, 255, 148, .03)
      }

      .addr-below {
        padding: .875rem 1.25rem;
        border-top: 1px solid var(--border);
        background: rgba(255, 255, 255, .02)
      }

      .addr-input-row {
        display: flex;
        gap: .5rem
      }

      .addr-input-row input {
        flex: 1;
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        padding: .6rem .875rem;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .82rem;
        outline: none;
        transition: border-color .2s, box-shadow .2s;
        width: 100%
      }

      .addr-input-row input:focus {
        border-color: rgba(0, 255, 148, .4);
        box-shadow: 0 0 0 3px rgba(0, 255, 148, .07)
      }

      .addr-input-row input::placeholder {
        color: var(--muted)
      }

      .btn-buscar {
        display: inline-flex;
        align-items: center;
        gap: .35rem;
        background: var(--verde2);
        color: #060A10;
        font-family: 'Bebas Neue', sans-serif;
        font-size: .85rem;
        letter-spacing: .05em;
        padding: .6rem 1.1rem;
        border-radius: .5rem;
        border: none;
        cursor: pointer;
        white-space: nowrap;
        transition: all .2s;
        flex-shrink: 0;
        position: relative;
        overflow: hidden
      }

      .btn-buscar::after {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, .2), transparent);
        transform: translateX(-100%);
        transition: transform .4s
      }

      .btn-buscar:hover::after {
        transform: translateX(100%)
      }

      .btn-buscar:hover {
        background: var(--verde);
        box-shadow: 0 0 20px rgba(0, 255, 148, .3)
      }

      .btn-buscar.loading {
        opacity: .6;
        pointer-events: none
      }

      .addr-wrap {
        position: relative
      }

      .suggestions {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: #0E1625;
        border: 1px solid rgba(0, 255, 148, .25);
        border-radius: .5rem;
        margin-top: .3rem;
        z-index: 50;
        overflow: hidden;
        display: none;
        box-shadow: 0 12px 40px rgba(0, 0, 0, .6)
      }

      .suggestions.show {
        display: block
      }

      .suggestion-item {
        padding: .7rem 1rem;
        font-size: .78rem;
        color: var(--text);
        cursor: pointer;
        border-bottom: 1px solid rgba(255, 255, 255, .04);
        transition: background .15s;
        display: flex;
        align-items: flex-start;
        gap: .6rem
      }

      .suggestion-item:last-child {
        border-bottom: none
      }

      .suggestion-item:hover {
        background: rgba(0, 255, 148, .07)
      }

      .suggestion-main {
        font-weight: 600;
        color: #fff;
        font-size: .8rem
      }

      .suggestion-sub {
        font-size: .68rem;
        color: var(--muted);
        margin-top: .1rem
      }

      .addr-status {
        align-items: center;
        gap: .5rem;
        padding: .5rem .75rem;
        border-radius: .4rem;
        font-size: .72rem;
        margin-top: .4rem;
        font-family: 'JetBrains Mono', monospace;
        display: none
      }

      .addr-status.ok {
        background: rgba(0, 255, 148, .07);
        border: 1px solid rgba(0, 255, 148, .2);
        color: var(--verde);
        display: flex
      }

      .addr-status.err {
        background: rgba(248, 113, 113, .07);
        border: 1px solid rgba(248, 113, 113, .2);
        color: var(--rojo);
        display: flex
      }

      .addr-status.searching {
        background: rgba(0, 255, 148, .07);
        border: 1px solid rgba(0, 255, 148, .2);
        color: var(--verde);
        display: flex
      }

      .coord-item {
        display: flex;
        align-items: center;
        gap: .5rem
      }

      .coord-label {
        font-size: .65rem;
        font-weight: 700;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .08em
      }

      .coord-val {
        font-family: 'JetBrains Mono', monospace;
        font-size: .75rem;
        color: var(--verde)
      }

      .form-actions {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: .875rem;
        padding: 1.25rem;
        background: rgba(255, 255, 255, .02);
        border-top: 1px solid var(--border);
        border-radius: 0 0 .875rem .875rem
      }

      .btn-submit {
        display: inline-flex;
        align-items: center;
        gap: .5rem;
        background: var(--verde);
        color: #060A10;
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.05rem;
        letter-spacing: .07em;
        padding: .65rem 2rem;
        border-radius: .5rem;
        border: none;
        cursor: pointer;
        transition: all .25s;
        position: relative;
        overflow: hidden
      }

      .btn-submit::after {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, .2), transparent);
        transform: translateX(-100%);
        transition: transform .4s
      }

      .btn-submit:hover::after {
        transform: translateX(100%)
      }

      .btn-submit:hover {
        background: #fff;
        box-shadow: 0 0 30px rgba(0, 255, 148, .3)
      }

      .btn-cancel {
        display: inline-flex;
        align-items: center;
        gap: .5rem;
        background: transparent;
        color: var(--muted);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .85rem;
        font-weight: 500;
        padding: .65rem 1.25rem;
        border-radius: .5rem;
        border: 1px solid var(--border);
        cursor: pointer;
        text-decoration: none;
        transition: all .2s
      }

      .btn-cancel:hover {
        color: #fff;
        border-color: rgba(255, 255, 255, .2)
      }

      .success-toast {
        display: none;
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        background: rgba(0, 255, 148, .15);
        border: 1px solid rgba(0, 255, 148, .3);
        border-radius: .75rem;
        padding: 1rem 1.5rem;
        font-family: 'Space Grotesk', sans-serif;
        font-size: .82rem;
        color: var(--verde);
        z-index: 999;
        animation: slideUp .3s ease
      }

      @keyframes slideUp {
        from {
          opacity: 0;
          transform: translateY(20px)
        }

        to {
          opacity: 1;
          transform: translateY(0)
        }
      }

      @media(max-width:768px) {
        .form-layout {
          grid-template-columns: 1fr
        }

        .field-row {
          grid-template-columns: 1fr
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
          <a href="Default.aspx">Inicio</a><span>›</span>
          <a href="Proveedores.aspx">Proveedores</a><span>›</span>
          <span style="color:var(--text)">Registrar</span>
        </div>
        <div class="page-title">Registrar Proveedor</div>
        <div class="page-sub">Completa el formulario y selecciona la ubicación en el mapa</div>
      </div>
    </div>

    <div class="form-layout animate-up delay-1">
      <div class="form-card">
        <div class="form-card-header">
          <span style="color:var(--verde)">👤</span>
          <span class="form-card-title" style="color:var(--verde)">Información Personal</span>
        </div>
        <div class="form-card-body">
          <div class="field">
            <label>Nombre del proveedor *</label>
            <input type="text" id="nombre" placeholder="Ej: Fix Home Services" />
          </div>
          <div class="field-row">
            <div class="field">
              <label>Teléfono *</label>
              <input type="tel" id="telefono" placeholder="+57 300 000 0000" />
            </div>
            <div class="field">
              <label>Correo electrónico</label>
              <input type="email" id="correo" placeholder="proveedor@email.com" />
            </div>
          </div>
          <div class="field">
            <label>Dirección</label>
            <input type="text" id="direccion" placeholder="Calle 10 # 43-12, El Poblado" />
          </div>
        </div>
      </div>

      <div class="form-card">
        <div class="form-card-header">
          <span style="color:var(--azul)">🛠️</span>
          <span class="form-card-title" style="color:var(--azul)">Información del Servicio</span>
        </div>
        <div class="form-card-body">
          <div class="field">
            <label>Tipo de servicio *</label>
            <select id="tipo-servicio">
              <option value="">Selecciona un tipo...</option>
              <option>Plomería</option>
              <option>Electricidad</option>
              <option>Carpintería</option>
              <option>Pintura</option>
              <option>Jardinería</option>
              <option>Domótica</option>
              <option>Otro</option>
            </select>
          </div>
          <div class="field">
            <label>Descripción del servicio *</label>
            <textarea id="descripcion"
              placeholder="Describe los servicios que ofreces, experiencia, especialidades..."></textarea>
          </div>
          <div class="field-row">
            <div class="field">
              <label>Años de experiencia</label>
              <input type="number" id="experiencia" placeholder="5" min="0" max="50" />
            </div>
            <div class="field">
              <label>Tipo de usuario</label>
              <select id="tipo-usuario">
                <option>Proveedor individual</option>
                <option>Empresa</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="map-card animate-up delay-2">
      <div class="map-card-header">
        <span class="map-card-title">📍 UBICACIÓN DEL PROVEEDOR</span>
        <span class="map-hint" id="map-hint-reg">Escribe la dirección abajo o haz clic en el mapa</span>
      </div>
      <div id="mapa-registro" style="width:100%;height:360px;display:block;"></div>
      <!-- Buscador de dirección debajo del mapa -->
      <div class="addr-below">
        <div class="addr-wrap">
          <div class="addr-input-row">
            <input type="text" id="addr-reg" placeholder="Ej: Calle 50 # 43-12, Laureles, Medellín"
              oninput="onAddrInputReg()" onkeydown="if(event.key==='Enter'){buscarDireccionReg();return false;}"
              autocomplete="off" />
            <button type="button" class="btn-buscar" id="btn-buscar-reg" onclick="buscarDireccionReg();return false;">
              🔍 Buscar
            </button>
          </div>
          <div class="suggestions" id="suggestions-reg"></div>
          <div class="addr-status" id="addr-status-reg"></div>
        </div>
      </div>
      <div class="coords-display">
        <div class="coord-item">
          <span class="coord-label">Latitud</span>
          <span class="coord-val" id="lat-display">—</span>
          <input type="hidden" id="lat-val" />
        </div>
        <div class="coord-item">
          <span class="coord-label">Longitud</span>
          <span class="coord-val" id="lng-display">—</span>
          <input type="hidden" id="lng-val" />
        </div>
        <div style="flex:1"></div>
        <span style="font-size:.7rem;color:var(--muted);font-family:'JetBrains Mono',monospace">Medellín, COL</span>
      </div>
    </div>

    <div class="form-card animate-up delay-3">
      <div class="form-actions">
        <a href="Proveedores.aspx" class="btn-cancel">← Cancelar</a>
        <button class="btn-submit" onclick="registrar()">✅ REGISTRAR PROVEEDOR</button>
      </div>
    </div>

    <div class="success-toast" id="toast">✅ Proveedor registrado exitosamente. Redirigiendo...</div>

  </asp:Content>

  <asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        var mapaReg = null, markerReg = null, debounceReg = null;

        function initRegistroMap() {
            var el = document.getElementById('mapa-registro');
            if (!el || mapaReg) return;
            mapaReg = L.map('mapa-registro', { center: [6.2442, -75.5812], zoom: 12 });
            L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
                attribution: '&copy; OSM &copy; CARTO', maxZoom: 19, subdomains: 'abcd'
            }).addTo(mapaReg);
            mapaReg.invalidateSize();
            /* Clic manual para ajustar pin */
            mapaReg.on('click', function (e) {
                colocarPin(e.latlng.lat, e.latlng.lng, 'Ubicación seleccionada');
                setStatusReg('ok', '✓ Ubicación fijada manualmente');
            });
        }
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initRegistroMap);
        } else {
            initRegistroMap();
        }

        /* ── GEOCODIFICACIÓN ── */
        function onAddrInputReg() {
            clearTimeout(debounceReg);
            var q = document.getElementById('addr-reg').value.trim();
            if (q.length < 4) { hideSuggestionsReg(); return; }
            debounceReg = setTimeout(function () { fetchSuggestionsReg(q); }, 500);
        }
        function fetchSuggestionsReg(q) {
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q='
                + encodeURIComponent(q + ', Medellín, Colombia') + '&limit=5&accept-language=es';
            fetch(url, { headers: { 'Accept-Language': 'es' } })
                .then(function (r) { return r.json(); })
                .then(function (d) { renderSuggestionsReg(d); })
                .catch(function () { hideSuggestionsReg(); });
        }
        function renderSuggestionsReg(items) {
            var box = document.getElementById('suggestions-reg');
            if (!items || !items.length) { hideSuggestionsReg(); return; }
            box.innerHTML = items.map(function (item) {
                var parts = item.display_name.split(',');
                var main = parts[0].trim(), sub = parts.slice(1, 3).join(',').trim();
                return '<div class="suggestion-item" onclick="seleccionarReg(''+escStr(item.display_name)+'','
                    + parseFloat(item.lat) + ',' + parseFloat(item.lon) + ')">'
                    + '<span style="color:var(--verde);flex-shrink:0">📍</span>'
                    + '<div><div class="suggestion-main">' + esc(main) + '</div>'
                    + (sub ? '<div class="suggestion-sub">' + esc(sub) + '</div>' : '')
                    + '</div></div>';
            }).join('');
            box.classList.add('show');
        }
        function seleccionarReg(nombre, lat, lng) {
            document.getElementById('addr-reg').value = nombre.split(',').slice(0, 2).join(',').trim();
            hideSuggestionsReg();
            colocarPin(lat, lng, nombre);
            setStatusReg('ok', '✓ Ubicación confirmada');
        }
        function buscarDireccionReg() {
            var q = document.getElementById('addr-reg').value.trim();
            if (!q) return;
            hideSuggestionsReg();
            setStatusReg('searching', '⟳ Buscando dirección...');
            document.getElementById('btn-buscar-reg').classList.add('loading');
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q='
                + encodeURIComponent(q + ', Medellín, Colombia') + '&limit=1&accept-language=es';
            fetch(url, { headers: { 'Accept-Language': 'es' } })
                .then(function (r) { return r.json(); })
                .then(function (data) {
                    document.getElementById('btn-buscar-reg').classList.remove('loading');
                    if (data && data.length) {
                        colocarPin(parseFloat(data[0].lat), parseFloat(data[0].lon), data[0].display_name);
                        setStatusReg('ok', '✓ ' + data[0].display_name.split(',').slice(0, 2).join(','));
                    } else {
                        setStatusReg('err', '✗ No se encontró esa dirección.');
                    }
                })
                .catch(function () {
                    document.getElementById('btn-buscar-reg').classList.remove('loading');
                    setStatusReg('err', '✗ Error de conexión.');
                });
        }
        function colocarPin(lat, lng, titulo) {
            if (!mapaReg) return;
            if (markerReg) mapaReg.removeLayer(markerReg);
            var icono = L.divIcon({
                className: '',
                html: '<div style="width:14px;height:14px;border-radius:50%;background:#00FF94;border:2.5px solid #fff;box-shadow:0 0 14px #00FF94,0 0 28px rgba(0,255,148,.5);"></div>',
                iconSize: [14, 14], iconAnchor: [7, 7], popupAnchor: [0, -10]
            });
            markerReg = L.marker([lat, lng], { icon: icono }).addTo(mapaReg)
                .bindPopup('<div style="font-family:Space Grotesk,sans-serif;font-size:12px;color:#e2e8f0">' + esc(titulo.split(',').slice(0, 2).join(',')) + '</div>');
            mapaReg.flyTo([lat, lng], 16, { duration: 1.2 });
            document.getElementById('lat-display').textContent = lat.toFixed(6);
            document.getElementById('lng-display').textContent = lng.toFixed(6);
            document.getElementById('lat-val').value = lat;
            document.getElementById('lng-val').value = lng;
            document.getElementById('map-hint-reg').textContent = 'Pin colocado — haz clic para ajustar';
        }
        function setStatusReg(tipo, msg) { var el = document.getElementById('addr-status-reg'); el.className = 'addr-status ' + tipo; el.innerHTML = msg; }
        function hideSuggestionsReg() { document.getElementById('suggestions-reg').classList.remove('show'); }
        function esc(s) { return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'); }
        function escStr(s) { return String(s).replace(/'/g, "\'"); }
        document.addEventListener('click', function (e) { if (!e.target.closest('.addr-wrap')) hideSuggestionsReg(); });

        function registrar() {
            var nombre = document.getElementById('nombre').value;
            var tel = document.getElementById('telefono').value;
            var tipo = document.getElementById('tipo-servicio').value;
            if (!nombre || !tel || !tipo) { alert('Por favor completa los campos obligatorios (*)'); return; }
            if (!document.getElementById('lat-val').value) { alert('Selecciona la ubicación en el mapa'); return; }
            var toast = document.getElementById('toast');
            toast.style.display = 'block';
            setTimeout(function () { window.location.href = 'Proveedores.aspx'; }, 2000);
        }
    </script>
  </asp:Content>