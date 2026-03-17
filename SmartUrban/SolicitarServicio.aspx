<%@ Page Title="Solicitar Servicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
  CodeBehind="SolicitarServicio.aspx.cs" Inherits="SmartUrban.SolicitarServicio" %>

  <asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
      #page-canvas {
        position: fixed;
        inset: 0;
        pointer-events: none;
        z-index: 0;
        opacity: .35
      }

      /* HERO */
      .page-hero {
        position: relative;
        overflow: hidden;
        background: linear-gradient(135deg, #060A10 0%, #0B1220 45%, #0A1830 100%);
        border: 1px solid rgba(59, 130, 246, .12);
        border-radius: 1rem;
        padding: clamp(2rem, 4vw, 3rem) clamp(1.5rem, 4vw, 3rem);
        margin-bottom: 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 2rem;
        min-height: 280px;
        z-index: 1
      }

      .page-hero::before {
        content: '';
        position: absolute;
        inset: 0;
        background-image: linear-gradient(rgba(59, 130, 246, .022) 1px, transparent 1px), linear-gradient(90deg, rgba(59, 130, 246, .022) 1px, transparent 1px);
        background-size: 36px 36px;
        pointer-events: none
      }

      .hero-scan {
        position: absolute;
        left: 0;
        right: 0;
        height: 1px;
        background: linear-gradient(90deg, transparent, rgba(59, 130, 246, .3), transparent);
        animation: hscan 5s linear infinite;
        top: -1px;
        z-index: 1
      }

      @keyframes hscan {
        0% {
          top: -1px
        }

        100% {
          top: 100%
        }
      }

      .hero-left {
        position: relative;
        z-index: 2;
        flex: 1;
        max-width: 560px
      }

      .hero-svg-wrap {
        position: relative;
        z-index: 2;
        flex-shrink: 0;
        width: clamp(200px, 28vw, 320px)
      }

      .hero-svg-wrap svg {
        width: 100%;
        height: auto;
        display: block
      }

      .breadcrumb {
        display: flex;
        align-items: center;
        gap: .5rem;
        font-size: .75rem;
        margin-bottom: .5rem
      }

      .breadcrumb a {
        color: var(--azul);
        text-decoration: none;
        transition: color .2s
      }

      .breadcrumb a:hover {
        color: var(--verde)
      }

      .breadcrumb span {
        color: var(--muted)
      }

      .deco-tag {
        display: inline-flex;
        align-items: center;
        gap: .4rem;
        font-family: 'JetBrains Mono', monospace;
        font-size: .6rem;
        font-weight: 700;
        letter-spacing: .12em;
        text-transform: uppercase;
        color: var(--azul);
        margin-bottom: .5rem;
        opacity: .85
      }

      .deco-tag::before {
        content: '';
        display: inline-block;
        width: 16px;
        height: 1px;
        background: var(--azul)
      }

      .page-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: clamp(3rem, 5.5vw, 5rem);
        letter-spacing: .04em;
        color: #fff;
        line-height: .92;
        margin-bottom: .875rem
      }

      .page-title .accent {
        color: var(--azul);
        text-shadow: 0 0 30px rgba(59, 130, 246, .4)
      }

      .page-sub {
        font-size: .875rem;
        color: var(--muted);
        line-height: 1.65;
        max-width: 440px
      }

      .chip {
        display: inline-flex;
        align-items: center;
        gap: .35rem;
        background: rgba(59, 130, 246, .1);
        border: 1px solid rgba(59, 130, 246, .2);
        border-radius: 2rem;
        padding: .22rem .75rem;
        font-size: .65rem;
        font-family: 'JetBrains Mono', monospace;
        color: var(--azul)
      }

      /* LAYOUT */
      .form-layout {
        display: grid;
        grid-template-columns: 1fr 1.4fr;
        gap: 1.5rem;
        margin-bottom: 2rem;
        position: relative;
        z-index: 1
      }

      /* CARDS */
      .form-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        position: relative;
        transition: border-color .3s
      }

      .form-card:hover {
        border-color: rgba(59, 130, 246, .18)
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

      /* FIELDS */
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
        transition: border-color .2s, box-shadow .2s, background .2s;
        width: 100%
      }

      .field input:focus,
      .field select:focus,
      .field textarea:focus {
        border-color: rgba(59, 130, 246, .4);
        box-shadow: 0 0 0 3px rgba(59, 130, 246, .07);
        background: rgba(59, 130, 246, .03)
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
        min-height: 100px
      }

      /* MAPA */
      .map-col {
        display: flex;
        flex-direction: column;
        gap: 0
      }

      .map-card {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        transition: border-color .3s
      }

      .map-card:hover {
        border-color: rgba(59, 130, 246, .2)
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
        color: var(--azul)
      }

      .map-hint {
        font-size: .68rem;
        color: var(--muted);
        font-family: 'JetBrains Mono', monospace
      }

      #mapa-solicitud {
        width: 100%;
        height: 340px;
        display: block
      }

      /* DIRECCIÓN — solo debajo del mapa */
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
        border-color: rgba(59, 130, 246, .4);
        box-shadow: 0 0 0 3px rgba(59, 130, 246, .07)
      }

      .addr-input-row input::placeholder {
        color: var(--muted)
      }

      .btn-buscar {
        display: inline-flex;
        align-items: center;
        gap: .35rem;
        background: var(--azul2);
        color: #fff;
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
        background: var(--azul);
        box-shadow: 0 0 20px rgba(59, 130, 246, .3)
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
        border: 1px solid rgba(59, 130, 246, .3);
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
        background: rgba(59, 130, 246, .1)
      }

      .suggestion-icon {
        color: var(--azul);
        flex-shrink: 0;
        margin-top: .1rem;
        font-size: .85rem
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
        background: rgba(59, 130, 246, .07);
        border: 1px solid rgba(59, 130, 246, .2);
        color: var(--azul);
        display: flex
      }

      .coords-display {
        padding: .75rem 1.25rem;
        border-top: 1px solid var(--border);
        display: flex;
        align-items: center;
        gap: 1.25rem;
        background: rgba(59, 130, 246, .03)
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
        color: var(--azul)
      }

      /* SELECTOR PROVEEDOR */
      .prov-selector {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        transition: border-color .3s
      }

      .prov-selector:hover {
        border-color: rgba(59, 130, 246, .18)
      }

      .prov-selector-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        background: rgba(255, 255, 255, .02);
        display: flex;
        align-items: center;
        justify-content: space-between
      }

      .prov-selector-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1rem;
        letter-spacing: .06em;
        color: var(--text)
      }

      .prov-count {
        font-family: 'JetBrains Mono', monospace;
        font-size: .62rem;
        color: var(--muted)
      }

      .prov-option {
        display: flex;
        align-items: center;
        gap: .75rem;
        padding: .8rem 1.25rem;
        border-bottom: 1px solid rgba(255, 255, 255, .04);
        cursor: pointer;
        transition: all .2s;
        position: relative
      }

      .prov-option:hover {
        background: rgba(255, 255, 255, .025)
      }

      .prov-option.selected {
        background: rgba(59, 130, 246, .08);
        border-left: 3px solid var(--azul)
      }

      .prov-option input[type=radio] {
        accent-color: var(--azul);
        flex-shrink: 0
      }

      .pov-icon {
        width: 34px;
        height: 34px;
        border-radius: .45rem;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: .95rem;
        flex-shrink: 0;
        transition: transform .2s
      }

      .prov-option:hover .pov-icon {
        transform: scale(1.1) rotate(-4deg)
      }

      .pov-name {
        font-size: .8rem;
        font-weight: 600;
        color: var(--text)
      }

      .pov-tipo {
        font-size: .68rem;
        color: var(--muted)
      }

      .pov-rating {
        font-family: 'JetBrains Mono', monospace;
        font-size: .65rem;
        color: var(--oro);
        margin-left: auto;
        flex-shrink: 0
      }

      .prov-empty {
        padding: 1.5rem;
        text-align: center;
        font-size: .78rem;
        color: var(--muted);
        font-style: italic
      }

      /* ACCIONES */
      .form-actions {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: .875rem;
        padding: 1.25rem;
        background: rgba(255, 255, 255, .02);
        border: 1px solid var(--border);
        border-radius: .875rem;
        position: relative;
        z-index: 1
      }

      .btn-submit {
        display: inline-flex;
        align-items: center;
        gap: .5rem;
        background: var(--azul2);
        color: #fff;
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
        background: var(--azul);
        box-shadow: 0 0 28px rgba(59, 130, 246, .4);
        transform: translateY(-2px)
      }

      .btn-cancel {
        display: inline-flex;
        align-items: center;
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
        background: rgba(59, 130, 246, .15);
        border: 1px solid rgba(59, 130, 246, .35);
        border-radius: .75rem;
        padding: 1rem 1.5rem;
        font-size: .82rem;
        color: var(--azul);
        z-index: 999;
        animation: slideUp .3s ease;
        font-family: 'Space Grotesk', sans-serif;
        backdrop-filter: blur(12px)
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

      /* SVG animations */
      @keyframes svgFloat {

        0%,
        100% {
          transform: translateY(0)
        }

        50% {
          transform: translateY(-6px)
        }
      }

      @keyframes svgPulse {

        0%,
        100% {
          opacity: .7
        }

        50% {
          opacity: 1
        }
      }

      @keyframes svgSpin {
        from {
          transform: rotate(0deg)
        }

        to {
          transform: rotate(360deg)
        }
      }

      @keyframes svgBlink {

        0%,
        100% {
          opacity: 1
        }

        50% {
          opacity: .3
        }
      }

      @media(max-width:900px) {
        .form-layout {
          grid-template-columns: 1fr
        }

        .hero-svg-wrap {
          display: none
        }
      }

      @media(max-width:640px) {
        .page-hero {
          flex-direction: column;
          min-height: unset
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

      .leaflet-control-attribution a {
        color: #3B82F6 !important
      }

      .leaflet-popup-content-wrapper {
        background: #141B2D !important;
        border: 1px solid rgba(255, 255, 255, .1) !important;
        border-radius: .5rem !important;
        box-shadow: 0 8px 32px rgba(0, 0, 0, .5) !important;
        color: #e2e8f0 !important
      }

      .leaflet-popup-tip {
        background: #141B2D !important
      }
    </style>
  </asp:Content>

  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <canvas id="page-canvas"></canvas>

    <!-- HERO -->
    <div class="page-hero animate-up">
      <div class="hero-scan"></div>
      <div class="hero-left">
        <div class="breadcrumb">
          <a href="Default.aspx">Inicio</a><span>&rsaquo;</span>
          <a href="Solicitudes.aspx">Solicitudes</a><span>&rsaquo;</span>
          <span style="color:var(--text)">Nueva Solicitud</span>
        </div>
        <div class="deco-tag">m&oacute;dulo 05</div>
        <div class="page-title">SOLICITAR<br><span class="accent">SERVICIO.</span></div>
        <p class="page-sub">Conectamos ciudadanos con proveedores verificados.<br>Describe tu necesidad y te encontramos
          el mejor.</p>
        <div style="display:flex;gap:.5rem;flex-wrap:wrap;margin-top:1.25rem">
          <span class="chip">&#128296; Plo&shy;mer&iacute;a</span>
          <span class="chip">&#9889; Electricidad</span>
          <span class="chip">&#127807; Jardiner&iacute;a</span>
          <span class="chip">&#127912; Pintura</span>
          <span class="chip">&#129683; Carpinter&iacute;a</span>
        </div>
      </div>
      <!-- ILUSTRACIÓN SVG ciudad + servicios -->
      <div class="hero-svg-wrap">
        <svg viewBox="0 0 320 240" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <radialGradient id="gB" cx="50%" cy="50%" r="50%">
              <stop offset="0%" stop-color="#3B82F6" stop-opacity=".18" />
              <stop offset="100%" stop-color="#3B82F6" stop-opacity="0" />
            </radialGradient>
            <radialGradient id="gG" cx="50%" cy="50%" r="50%">
              <stop offset="0%" stop-color="#00FF94" stop-opacity=".15" />
              <stop offset="100%" stop-color="#00FF94" stop-opacity="0" />
            </radialGradient>
            <filter id="glow">
              <feGaussianBlur stdDeviation="2.5" result="blur" />
              <feMerge>
                <feMergeNode in="blur" />
                <feMergeNode in="SourceGraphic" />
              </feMerge>
            </filter>
          </defs>

          <!-- Fondo glow ambiental -->
          <ellipse cx="200" cy="180" rx="120" ry="80" fill="url(#gB)" />
          <ellipse cx="80" cy="160" rx="80" ry="60" fill="url(#gG)" />

          <!-- SUELO / CALLE -->
          <rect x="0" y="200" width="320" height="40" fill="#0B1220" rx="0" />
          <line x1="0" y1="200" x2="320" y2="200" stroke="#1e3a5f" stroke-width="1" />
          <!-- línea central calle -->
          <line x1="0" y1="216" x2="60" y2="216" stroke="#1D4ED8" stroke-width="1.5" stroke-dasharray="12,8"
            opacity=".5" />
          <line x1="100" y1="216" x2="180" y2="216" stroke="#1D4ED8" stroke-width="1.5" stroke-dasharray="12,8"
            opacity=".5" />
          <line x1="220" y1="216" x2="320" y2="216" stroke="#1D4ED8" stroke-width="1.5" stroke-dasharray="12,8"
            opacity=".5" />

          <!-- EDIFICIO 1 — izquierda, alto -->
          <rect x="18" y="100" width="48" height="100" fill="#0D1829" rx="2" />
          <rect x="18" y="100" width="48" height="100" fill="none" stroke="#1e3a5f" stroke-width="1" rx="2" />
          <!-- ventanas edificio 1 -->
          <rect x="24" y="108" width="10" height="8" fill="#1D4ED8" opacity=".6" rx="1" />
          <rect x="38" y="108" width="10" height="8" fill="#3B82F6" opacity=".4" rx="1" />
          <rect x="52" y="108" width="8" height="8" fill="#1D4ED8" opacity=".5" rx="1" />
          <rect x="24" y="122" width="10" height="8" fill="#3B82F6" opacity=".3" rx="1" />
          <rect x="38" y="122" width="10" height="8" fill="#1D4ED8" opacity=".7" rx="1" />
          <rect x="52" y="122" width="8" height="8" fill="#3B82F6" opacity=".4" rx="1" />
          <rect x="24" y="136" width="10" height="8" fill="#1D4ED8" opacity=".5" rx="1" />
          <rect x="38" y="136" width="10" height="8" fill="#3B82F6" opacity=".3" rx="1" />
          <rect x="24" y="150" width="10" height="8" fill="#3B82F6" opacity=".6" rx="1" />
          <rect x="38" y="150" width="10" height="8" fill="#1D4ED8" opacity=".4" rx="1" />
          <rect x="52" y="150" width="8" height="8" fill="#3B82F6" opacity=".5" rx="1" />
          <!-- antena -->
          <line x1="42" y1="100" x2="42" y2="88" stroke="#3B82F6" stroke-width="1.5" opacity=".7" />
          <circle cx="42" cy="87" r="2" fill="#3B82F6" opacity=".9"
            style="animation:svgBlink 2s ease-in-out infinite" />

          <!-- EDIFICIO 2 — centro, mediano -->
          <rect x="88" y="130" width="56" height="70" fill="#0D1829" rx="2" />
          <rect x="88" y="130" width="56" height="70" fill="none" stroke="#1e3a5f" stroke-width="1" rx="2" />
          <rect x="94" y="138" width="12" height="9" fill="#00C47A" opacity=".5" rx="1" />
          <rect x="110" y="138" width="12" height="9" fill="#00FF94" opacity=".3" rx="1" />
          <rect x="126" y="138" width="10" height="9" fill="#00C47A" opacity=".4" rx="1" />
          <rect x="94" y="153" width="12" height="9" fill="#00FF94" opacity=".4" rx="1" />
          <rect x="110" y="153" width="12" height="9" fill="#00C47A" opacity=".6" rx="1" />
          <rect x="126" y="153" width="10" height="9" fill="#00FF94" opacity=".3" rx="1" />
          <rect x="94" y="168" width="12" height="9" fill="#00C47A" opacity=".5" rx="1" />
          <rect x="110" y="168" width="12" height="9" fill="#00FF94" opacity=".4" rx="1" />
          <!-- entrada -->
          <rect x="106" y="182" width="20" height="18" fill="#0A1525" rx="2" />
          <line x1="116" y1="182" x2="116" y2="200" stroke="#1e3a5f" stroke-width="1" />

          <!-- EDIFICIO 3 — derecha, alto y estrecho -->
          <rect x="210" y="90" width="38" height="110" fill="#0D1829" rx="2" />
          <rect x="210" y="90" width="38" height="110" fill="none" stroke="#1e3a5f" stroke-width="1" rx="2" />
          <rect x="215" y="98" width="8" height="7" fill="#3B82F6" opacity=".5" rx="1" />
          <rect x="227" y="98" width="8" height="7" fill="#1D4ED8" opacity=".7" rx="1" />
          <rect x="215" y="111" width="8" height="7" fill="#1D4ED8" opacity=".4" rx="1" />
          <rect x="227" y="111" width="8" height="7" fill="#3B82F6" opacity=".6" rx="1" />
          <rect x="215" y="124" width="8" height="7" fill="#3B82F6" opacity=".5" rx="1" />
          <rect x="227" y="124" width="8" height="7" fill="#1D4ED8" opacity=".4" rx="1" />
          <rect x="215" y="137" width="8" height="7" fill="#1D4ED8" opacity=".6" rx="1" />
          <rect x="227" y="137" width="8" height="7" fill="#3B82F6" opacity=".3" rx="1" />
          <rect x="215" y="150" width="8" height="7" fill="#3B82F6" opacity=".5" rx="1" />
          <rect x="227" y="150" width="8" height="7" fill="#1D4ED8" opacity=".7" rx="1" />
          <rect x="215" y="163" width="8" height="7" fill="#1D4ED8" opacity=".4" rx="1" />
          <rect x="227" y="163" width="8" height="7" fill="#3B82F6" opacity=".5" rx="1" />
          <!-- techo especial -->
          <polygon points="210,90 229,74 248,90" fill="#0A1830" stroke="#1D4ED8" stroke-width="1" />
          <line x1="229" y1="74" x2="229" y2="64" stroke="#00FF94" stroke-width="1.5" opacity=".8" />
          <circle cx="229" cy="63" r="2.5" fill="#00FF94" filter="url(#glow)"
            style="animation:svgBlink 1.5s ease-in-out infinite" />

          <!-- EDIFICIO 4 — derecha pequeño -->
          <rect x="266" y="155" width="42" height="45" fill="#0D1829" rx="2" />
          <rect x="266" y="155" width="42" height="45" fill="none" stroke="#1e3a5f" stroke-width="1" rx="2" />
          <rect x="272" y="162" width="10" height="8" fill="#FBBF24" opacity=".4" rx="1" />
          <rect x="286" y="162" width="10" height="8" fill="#FBBF24" opacity=".3" rx="1" />
          <rect x="272" y="175" width="10" height="8" fill="#FBBF24" opacity=".5" rx="1" />
          <rect x="286" y="175" width="10" height="8" fill="#FBBF24" opacity=".3" rx="1" />

          <!-- ICONO PLOMERÍA flotando — llave inglesa -->
          <g filter="url(#glow)" style="animation:svgFloat 3s ease-in-out infinite">
            <circle cx="60" cy="68" r="16" fill="#0D1829" stroke="#00FF94" stroke-width="1.2" opacity=".9" />
            <text x="60" y="73" text-anchor="middle" font-size="14" fill="#00FF94">&#128296;</text>
          </g>

          <!-- ICONO ELECTRICIDAD flotando -->
          <g filter="url(#glow)" style="animation:svgFloat 3.5s ease-in-out infinite;animation-delay:.8s">
            <circle cx="268" cy="55" r="16" fill="#0D1829" stroke="#3B82F6" stroke-width="1.2" opacity=".9" />
            <text x="268" y="60" text-anchor="middle" font-size="14" fill="#3B82F6">&#9889;</text>
          </g>

          <!-- ICONO PINTURA flotando -->
          <g filter="url(#glow)" style="animation:svgFloat 4s ease-in-out infinite;animation-delay:1.4s">
            <circle cx="160" cy="44" r="16" fill="#0D1829" stroke="#a78bfa" stroke-width="1.2" opacity=".9" />
            <text x="160" y="49" text-anchor="middle" font-size="14" fill="#a78bfa">&#127912;</text>
          </g>

          <!-- ICONO JARDINERÍA flotando -->
          <g filter="url(#glow)" style="animation:svgFloat 3.2s ease-in-out infinite;animation-delay:2s">
            <circle cx="300" cy="120" r="14" fill="#0D1829" stroke="#4ade80" stroke-width="1.2" opacity=".9" />
            <text x="300" y="125" text-anchor="middle" font-size="12" fill="#4ade80">&#127807;</text>
          </g>

          <!-- PIN de ubicación animado sobre edificio 2 -->
          <g style="animation:svgFloat 2.5s ease-in-out infinite">
            <line x1="116" y1="118" x2="116" y2="130" stroke="#00FF94" stroke-width="1.5" stroke-dasharray="3,2"
              opacity=".6" />
            <circle cx="116" cy="112" r="8" fill="#00FF94" opacity=".15" filter="url(#glow)" />
            <circle cx="116" cy="112" r="5" fill="#00FF94" opacity=".9" filter="url(#glow)" />
            <circle cx="116" cy="112" r="2" fill="#fff" />
          </g>

          <!-- Líneas de conexión entre iconos y edificios -->
          <line x1="60" y1="84" x2="42" y2="100" stroke="#00FF94" stroke-width=".8" stroke-dasharray="4,3"
            opacity=".25" />
          <line x1="268" y1="71" x2="248" y2="90" stroke="#3B82F6" stroke-width=".8" stroke-dasharray="4,3"
            opacity=".25" />
          <line x1="160" y1="60" x2="116" y2="130" stroke="#a78bfa" stroke-width=".8" stroke-dasharray="4,3"
            opacity=".2" />

          <!-- Puntos de red en el suelo -->
          <circle cx="80" cy="208" r="2" fill="#1D4ED8" opacity=".6" />
          <circle cx="160" cy="208" r="2" fill="#00FF94" opacity=".5" />
          <circle cx="240" cy="208" r="2" fill="#1D4ED8" opacity=".6" />
        </svg>
      </div>
    </div>

    <div class="form-layout animate-up delay-1">

      <!-- COLUMNA IZQUIERDA -->
      <div style="display:flex;flex-direction:column;gap:1.25rem">

        <div class="form-card">
          <div class="form-card-header">
            <span style="color:var(--azul)">&#128203;</span>
            <span class="form-card-title" style="color:var(--azul)">Detalle de la Solicitud</span>
          </div>
          <div class="form-card-body">
            <div class="field">
              <label>Tipo de servicio *</label>
              <select id="tipo">
                <option value="">Selecciona...</option>
                <option>Plo&shy;mer&iacute;a</option>
                <option>Electricidad</option>
                <option>Carpinter&iacute;a</option>
                <option>Pintura</option>
                <option>Jardiner&iacute;a</option>
                <option>Otro</option>
              </select>
            </div>
            <div class="field">
              <label>Descripci&oacute;n del problema *</label>
              <textarea id="descripcion" placeholder="Describe detalladamente qu&eacute; necesitas..."></textarea>
            </div>
            <div class="field">
              <label>Fecha deseada</label>
              <input type="date" id="fecha" />
            </div>
            <div class="field">
              <label>Tu nombre</label>
              <input type="text" id="usuario" placeholder="Nombre o ID de usuario" />
            </div>
          </div>
        </div>

        <div class="prov-selector">
          <div class="prov-selector-header">
            <div class="prov-selector-title">Seleccionar Proveedor</div>
            <span class="prov-count" id="prov-hint">Selecciona un servicio primero</span>
          </div>
          <div id="prov-list">
            <div class="prov-option" data-servicios="plomeria,carpinteria">
              <input type="radio" name="proveedor" value="Fix Home">
              <div class="pov-icon" style="background:rgba(0,255,148,.1)">&#128296;</div>
              <div>
                <div class="pov-name">Fix Home</div>
                <div class="pov-tipo">Plomer&iacute;a &middot; Carpinter&iacute;a</div>
              </div>
              <span class="pov-rating">&#11088; 4.9</span>
            </div>
            <div class="prov-option" data-servicios="electricidad">
              <input type="radio" name="proveedor" value="Electro MED">
              <div class="pov-icon" style="background:rgba(59,130,246,.1)">&#9889;</div>
              <div>
                <div class="pov-name">Electro MED</div>
                <div class="pov-tipo">Electricidad</div>
              </div>
              <span class="pov-rating">&#11088; 4.7</span>
            </div>
            <div class="prov-option" data-servicios="carpinteria">
              <input type="radio" name="proveedor" value="Carpinter&iacute;a R&iacute;os">
              <div class="pov-icon" style="background:rgba(251,191,36,.1)">&#129683;</div>
              <div>
                <div class="pov-name">Carpinter&iacute;a R&iacute;os</div>
                <div class="pov-tipo">Carpinter&iacute;a</div>
              </div>
              <span class="pov-rating">&#11088; 4.8</span>
            </div>
            <div class="prov-option" data-servicios="pintura">
              <input type="radio" name="proveedor" value="PintaMed">
              <div class="pov-icon" style="background:rgba(167,139,250,.1)">&#127912;</div>
              <div>
                <div class="pov-name">PintaMed</div>
                <div class="pov-tipo">Pintura &middot; Acabados</div>
              </div>
              <span class="pov-rating">&#11088; 4.6</span>
            </div>
            <div class="prov-option" data-servicios="jardineria">
              <input type="radio" name="proveedor" value="Verde Urbano">
              <div class="pov-icon" style="background:rgba(74,222,128,.1)">&#127807;</div>
              <div>
                <div class="pov-name">Verde Urbano</div>
                <div class="pov-tipo">Jardiner&iacute;a &middot; Paisajismo</div>
              </div>
              <span class="pov-rating">&#11088; 5.0</span>
            </div>
            <div class="prov-empty" id="prov-empty" style="display:none">
              No hay proveedores disponibles para este servicio a&uacute;n.
            </div>
          </div>
        </div>

      </div>

      <!-- COLUMNA DERECHA: mapa + dirección abajo -->
      <div class="map-col">
        <div class="map-card">
          <div class="map-card-header">
            <span class="map-card-title">&#128506;&#65039; MAPA</span>
            <span class="map-hint" id="map-hint">Escribe tu direcci&oacute;n abajo</span>
          </div>
          <div id="mapa-solicitud" style="width:100%;height:340px;display:block;"></div>
          <!-- DIRECCIÓN — debajo del mapa -->
          <div class="addr-below">
            <div class="addr-wrap">
              <div class="addr-input-row">
                <input type="text" id="addr-input" placeholder="Ej: Calle 10 # 43-12, El Poblado, Medell&iacute;n"
                  oninput="onAddrInput()" onkeydown="if(event.key==='Enter'){buscarDireccion();return false;}"
                  autocomplete="off" />
                <button type="button" class="btn-buscar" id="btn-buscar" onclick="buscarDireccion();return false;">
                  &#128269; Buscar
                </button>
              </div>
              <div class="suggestions" id="suggestions"></div>
              <div class="addr-status" id="addr-status"></div>
            </div>
          </div>
          <div class="coords-display">
            <div style="display:flex;align-items:center;gap:.5rem">
              <span class="coord-label">Lat</span>
              <span class="coord-val" id="lat-d">&mdash;</span>
              <input type="hidden" id="lat-v">
            </div>
            <div style="display:flex;align-items:center;gap:.5rem">
              <span class="coord-label">Lng</span>
              <span class="coord-val" id="lng-d">&mdash;</span>
              <input type="hidden" id="lng-v">
            </div>
            <div style="flex:1"></div>
            <span style="font-size:.7rem;color:var(--muted);font-family:'JetBrains Mono',monospace">Medell&iacute;n,
              COL</span>
          </div>
        </div>
      </div>

    </div>

    <div class="form-actions animate-up delay-2">
      <a href="Solicitudes.aspx" class="btn-cancel">&larr; Cancelar</a>
      <button type="button" class="btn-submit" onclick="enviarSolicitud();return false;">&#128228; ENVIAR
        SOLICITUD</button>
    </div>

    <div class="success-toast" id="toast">&#128228; Solicitud enviada correctamente. Redirigiendo...</div>

  </asp:Content>

  <asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        /* ═══ PARTÍCULAS 3D ═══ */
        (function () {
            var c = document.getElementById('page-canvas'), ctx = c.getContext('2d'), W, H, pts = [];
            function resize() { W = c.width = window.innerWidth; H = c.height = Math.max(window.innerHeight, document.body.scrollHeight || 1800) }
            resize(); window.addEventListener('resize', resize);
            var cols = [[59, 130, 246], [0, 255, 148], [167, 139, 250], [29, 78, 216]];
            for (var i = 0; i < 80; i++) { var col = cols[Math.floor(Math.random() * cols.length)]; pts.push({ x: Math.random() * 1920, y: Math.random() * 1800, z: Math.random() * 700 + 80, vx: (Math.random() - .5) * .4, vy: (Math.random() - .5) * .35, vz: (Math.random() - .5) * 1, r: Math.random() * 1.8 + .3, a: Math.random() * Math.PI * 2, va: Math.random() * .007 + .002, col: col }); }
            function draw() {
                ctx.clearRect(0, 0, W, H);
                pts.sort(function (a, b) { return b.z - a.z });
                pts.forEach(function (p) {
                    p.x += p.vx; p.y += p.vy; p.z += p.vz;
                    if (p.x < 0) p.x = W; if (p.x > W) p.x = 0; if (p.y < 0) p.y = H; if (p.y > H) p.y = 0;
                    if (p.z < 80 || p.z > 780) p.vz *= -1;
                    p.a += p.va;
                    var sc = 700 / p.z, r = p.r * sc, al = (.12 + .45 * (1 - p.z / 780)) * (0.5 + 0.5 * Math.sin(p.a));
                    ctx.beginPath(); ctx.arc(p.x, p.y, Math.max(r, .25), 0, Math.PI * 2);
                    ctx.fillStyle = 'rgba(' + p.col[0] + ',' + p.col[1] + ',' + p.col[2] + ',' + al + ')'; ctx.fill();
                    if (p.z < 260 && r > 1) { ctx.beginPath(); ctx.arc(p.x, p.y, r * 2.5, 0, Math.PI * 2); ctx.fillStyle = 'rgba(' + p.col[0] + ',' + p.col[1] + ',' + p.col[2] + ',' + (al * .08) + ')'; ctx.fill(); }
                });
                for (var i = 0; i < pts.length; i++)for (var j = i + 1; j < pts.length; j++) {
                    var dx = pts[i].x - pts[j].x, dy = pts[i].y - pts[j].y, d = Math.sqrt(dx * dx + dy * dy), dz = Math.abs(pts[i].z - pts[j].z);
                    if (d < 110 && dz < 180) { var az = (pts[i].z + pts[j].z) / 2, la = .06 * (1 - d / 110) * (1 - az / 780); ctx.beginPath(); ctx.moveTo(pts[i].x, pts[i].y); ctx.lineTo(pts[j].x, pts[j].y); ctx.strokeStyle = 'rgba(' + pts[i].col[0] + ',' + pts[i].col[1] + ',' + pts[i].col[2] + ',' + la + ')'; ctx.lineWidth = Math.max(.25, (700 / az) * .3); ctx.stroke(); }
                }
                requestAnimationFrame(draw);
            }
            draw();
        })();

        /* ═══ LEAFLET MAP ═══ */
        var mapa = null, markerActual = null, debounceTimer = null;

        function _initMapa() {
            var el = document.getElementById('mapa-solicitud');
            if (!el || mapa) return;
            mapa = L.map('mapa-solicitud', { center: [6.2442, -75.5812], zoom: 12 });
            L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
                attribution: '&copy; OSM &copy; CARTO',
                maxZoom: 19, subdomains: 'abcd'
            }).addTo(mapa);
            mapa.invalidateSize();
        }
        /* Llamar directo — Leaflet ya está en Site.Master head */
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', _initMapa);
        } else {
            _initMapa();
        }

        /* ═══ GEOCODIFICACIÓN con Nominatim ═══ */
        function onAddrInput() {
            clearTimeout(debounceTimer);
            var q = document.getElementById('addr-input').value.trim();
            if (q.length < 4) { hideSuggestions(); return; }
            debounceTimer = setTimeout(function () { fetchSuggestions(q); }, 500);
        }

        function fetchSuggestions(q) {
            var url = 'https://nominatim.openstreetmap.org/search?format=json&q='
                + encodeURIComponent(q + ', Medellín, Colombia')
                + '&limit=5&addressdetails=1&accept-language=es';
            fetch(url, { headers: { 'Accept-Language': 'es' } })
                .then(function (r) { return r.json(); })
                .then(function (data) { renderSuggestions(data); })
                .catch(function () { hideSuggestions(); });
        }

        function renderSuggestions(items) {
            var box = document.getElementById('suggestions');
            if (!items || !items.length) { hideSuggestions(); return; }
            box.innerHTML = items.map(function (item) {
                var parts = item.display_name.split(',');
                var main = parts[0].trim();
                var sub = parts.slice(1, 3).join(',').trim();
                return '<div class="suggestion-item" onclick="seleccionarSugerencia(''
                    + escStr(item.display_name) + '', '
                    + parseFloat(item.lat) + ',' + parseFloat(item.lon) + ')">'
                    + '<span class="suggestion-icon">&#128205;</span>'
                    + '<div><div class="suggestion-main">' + esc(main) + '</div>'
                    + (sub ? '<div class="suggestion-sub">' + esc(sub) + '</div>' : '')
                    + '</div></div>';
            }).join('');
            box.classList.add('show');
        }

        function seleccionarSugerencia(nombre, lat, lng) {
            document.getElementById('addr-input').value = nombre.split(',').slice(0, 2).join(',').trim();
            hideSuggestions();
            moverPin(lat, lng, nombre);
            setStatus('ok', '&#10003; Ubicación confirmada');
        }

        function buscarDireccion() {
            var q = document.getElementById('addr-input').value.trim();
            if (!q) return;
            hideSuggestions();
            setStatus('searching', '&#8635; Buscando dirección...');
            document.getElementById('btn-buscar').classList.add('loading');

            var url = 'https://nominatim.openstreetmap.org/search?format=json&q='
                + encodeURIComponent(q + ', Medellín, Colombia')
                + '&limit=1&accept-language=es';

            fetch(url, { headers: { 'Accept-Language': 'es' } })
                .then(function (r) { return r.json(); })
                .then(function (data) {
                    document.getElementById('btn-buscar').classList.remove('loading');
                    if (data && data.length) {
                        var item = data[0];
                        moverPin(parseFloat(item.lat), parseFloat(item.lon), item.display_name);
                        setStatus('ok', '&#10003; ' + item.display_name.split(',').slice(0, 2).join(','));
                    } else {
                        setStatus('err', '&#10007; No se encontró esa dirección. Intenta ser más específico.');
                    }
                })
                .catch(function () {
                    document.getElementById('btn-buscar').classList.remove('loading');
                    setStatus('err', '&#10007; Error de conexión. Intenta de nuevo.');
                });
        }

        function moverPin(lat, lng, titulo) {
            if (!mapa) return;
            if (markerActual) mapa.removeLayer(markerActual);

            var icono = L.divIcon({
                className: '',
                html: '<div style="width:14px;height:14px;border-radius:50%;background:#3B82F6;border:2.5px solid #fff;box-shadow:0 0 14px #3B82F6,0 0 28px rgba(59,130,246,.5);"></div>',
                iconSize: [14, 14],
                iconAnchor: [7, 7],  /* centro exacto — no se mueve al hacer zoom */
                popupAnchor: [0, -10]
            });

            markerActual = L.marker([lat, lng], { icon: icono })
                .addTo(mapa)
                .bindPopup('<div style="font-family:Space Grotesk,sans-serif;font-size:12px;color:#e2e8f0;max-width:200px">' + esc(titulo.split(',').slice(0, 2).join(',')) + '</div>');

            mapa.flyTo([lat, lng], 16, { duration: 1.2 });

            document.getElementById('lat-d').textContent = lat.toFixed(6);
            document.getElementById('lng-d').textContent = lng.toFixed(6);
            document.getElementById('lat-v').value = lat;
            document.getElementById('lng-v').value = lng;
            document.getElementById('map-hint').textContent = 'Pin colocado correctamente';

            /* Clic para ajuste manual */
            mapa.once('click', function (e) {
                moverPin(e.latlng.lat, e.latlng.lng, document.getElementById('addr-input').value);
                setStatus('ok', '&#10003; Ubicación ajustada manualmente');
            });
        }

        function setStatus(tipo, msg) {
            var el = document.getElementById('addr-status');
            el.className = 'addr-status ' + tipo;
            el.innerHTML = msg;
        }
        function hideSuggestions() { document.getElementById('suggestions').classList.remove('show'); }
        function esc(s) { return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'); }
        function escStr(s) { return String(s).replace(/'/g, "\'"); }
        document.addEventListener('click', function (e) { if (!e.target.closest('.addr-wrap')) hideSuggestions(); });

        /* ═══ FILTRO PROVEEDORES ═══ */
        var mapaServicios = { 'Plomería': 'plomeria', 'Electricidad': 'electricidad', 'Carpintería': 'carpinteria', 'Pintura': 'pintura', 'Jardinería': 'jardineria', 'Otro': 'otro' };
        document.getElementById('tipo').addEventListener('change', function () { filtrarProveedores(this.value); });

        function filtrarProveedores(tipo) {
            var clave = mapaServicios[tipo] || '';
            var opciones = document.querySelectorAll('.prov-option');
            var visibles = 0;
            opciones.forEach(function (o) {
                var servicios = o.dataset.servicios || '';
                var mostrar = (clave === '' || clave === 'otro' || servicios.split(',').indexOf(clave) > -1);
                if (mostrar) { o.removeAttribute('data-hidden'); o.style.display = ''; }
                else { o.setAttribute('data-hidden', '1'); o.style.display = 'none'; }
                o.classList.remove('selected');
                o.querySelector('input[type=radio]').checked = false;
                if (mostrar) visibles++;
            });
            var primero = null;
            opciones.forEach(function (o) { if (!primero && !o.getAttribute('data-hidden')) primero = o; });
            if (primero) { primero.classList.add('selected'); primero.querySelector('input[type=radio]').checked = true; }
            document.getElementById('prov-empty').style.display = visibles === 0 ? '' : 'none';
            document.getElementById('prov-hint').textContent = visibles > 0
                ? visibles + ' proveedor' + (visibles > 1 ? 'es' : '') + ' disponible' + (visibles > 1 ? 's' : '')
                : 'Sin proveedores para este servicio';
        }

        document.querySelectorAll('.prov-option').forEach(function (o) {
            o.addEventListener('click', function () {
                if (o.getAttribute('data-hidden')) return;
                document.querySelectorAll('.prov-option').forEach(function (x) { x.classList.remove('selected'); });
                o.classList.add('selected');
                o.querySelector('input[type=radio]').checked = true;
            });
        });

        /* ═══ ENVIAR ═══ */
        function enviarSolicitud() {
            if (!document.getElementById('tipo').value) { alert('Selecciona el tipo de servicio'); return; }
            if (!document.getElementById('descripcion').value.trim()) { alert('Describe el problema'); return; }
            if (!document.getElementById('lat-v').value) { alert('Busca y confirma tu dirección en el mapa'); return; }
            var t = document.getElementById('toast');
            t.style.display = 'block';
            setTimeout(function () { window.location.href = 'Solicitudes.aspx'; }, 2000);
        }
    </script>
  </asp:Content>