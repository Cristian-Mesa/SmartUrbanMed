<%@ Page Title="Calificar Servicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
  CodeBehind="CalificarServicio.aspx.cs" Inherits="SmartUrban.CalificarServicio" %>

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

      .rating-layout {
        display: grid;
        grid-template-columns: 1fr 1.2fr;
        gap: 1.5rem;
        margin-bottom: 2rem
      }

      .sol-preview {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden;
        margin-bottom: 1.25rem
      }

      .sol-prev-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        background: rgba(255, 255, 255, .02)
      }

      .sol-prev-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: .95rem;
        letter-spacing: .05em;
        color: var(--muted)
      }

      .sol-prev-body {
        padding: 1.25rem
      }

      .sol-prev-name {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.2rem;
        letter-spacing: .04em;
        color: #fff;
        margin-bottom: .5rem
      }

      .sol-prev-meta {
        display: flex;
        flex-direction: column;
        gap: .4rem
      }

      .sol-prev-item {
        font-size: .76rem;
        color: var(--muted);
        display: flex;
        align-items: center;
        gap: .4rem
      }

      .prov-preview {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden
      }

      .prov-prev-body {
        padding: 1.25rem;
        display: flex;
        align-items: center;
        gap: 1rem
      }

      .prov-prev-avatar {
        width: 52px;
        height: 52px;
        border-radius: .625rem;
        background: rgba(0, 255, 148, .1);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        flex-shrink: 0
      }

      .prov-prev-name {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1.1rem;
        letter-spacing: .04em;
        color: #fff
      }

      .prov-prev-tipo {
        font-size: .72rem;
        color: var(--muted);
        margin-top: .2rem
      }

      .prov-prev-rating {
        font-family: 'JetBrains Mono', monospace;
        font-size: .75rem;
        color: var(--oro);
        margin-top: .2rem
      }

      .rating-form {
        background: var(--panel);
        border: 1px solid var(--border);
        border-radius: .875rem;
        overflow: hidden
      }

      .rating-form-header {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid var(--border);
        background: rgba(255, 255, 255, .02);
        display: flex;
        align-items: center;
        gap: .5rem
      }

      .rating-form-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 1rem;
        letter-spacing: .06em;
        color: var(--oro)
      }

      .rating-form-body {
        padding: 1.75rem 1.5rem;
        display: flex;
        flex-direction: column;
        gap: 1.5rem
      }

      /* ESTRELLAS */
      .stars-wrap {
        text-align: center;
        padding: 1rem 0
      }

      .stars-label {
        font-size: .7rem;
        font-weight: 700;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .08em;
        margin-bottom: 1rem
      }

      .star-row {
        display: flex;
        flex-direction: row-reverse;
        justify-content: center;
        gap: .35rem
      }

      .star-row input[type=radio] {
        display: none
      }

      .star-row label {
        font-size: 2.5rem;
        cursor: pointer;
        transition: transform .15s, filter .15s;
        filter: grayscale(1) opacity(.3);
        line-height: 1
      }

      .star-row label:hover,
      .star-row label:hover~label,
      .star-row input:checked~label {
        filter: none;
        transform: scale(1.2)
      }

      .star-row input:checked~label {
        filter: drop-shadow(0 0 6px rgba(251, 191, 36, .5))
      }

      .rating-text {
        text-align: center;
        font-family: 'JetBrains Mono', monospace;
        font-size: .72rem;
        color: var(--oro);
        min-height: 1.2em;
        transition: all .2s
      }

      .criteria-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: .875rem
      }

      .crit-item {
        background: rgba(255, 255, 255, .03);
        border: 1px solid var(--border);
        border-radius: .6rem;
        padding: .875rem;
        display: flex;
        flex-direction: column;
        gap: .5rem
      }

      .crit-label {
        font-size: .68rem;
        font-weight: 700;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: .07em
      }

      .crit-stars {
        display: flex;
        gap: .2rem
      }

      .crit-star {
        font-size: 1rem;
        cursor: pointer;
        transition: transform .1s;
        opacity: .3;
        line-height: 1
      }

      .crit-star.on {
        opacity: 1;
        transform: scale(1.1)
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

      .field textarea {
        background: rgba(255, 255, 255, .04);
        border: 1px solid var(--border);
        border-radius: .5rem;
        padding: .65rem .875rem;
        color: var(--text);
        font-family: 'Space Grotesk', sans-serif;
        font-size: .82rem;
        outline: none;
        transition: border-color .2s;
        width: 100%;
        resize: vertical;
        min-height: 100px
      }

      .field textarea:focus {
        border-color: rgba(251, 191, 36, .35);
        box-shadow: 0 0 0 3px rgba(251, 191, 36, .07)
      }

      .field textarea::placeholder {
        color: var(--muted)
      }

      .checkbox-row {
        display: flex;
        align-items: center;
        gap: .625rem;
        cursor: pointer;
        padding: .5rem;
        border-radius: .4rem;
        transition: background .15s
      }

      .checkbox-row:hover {
        background: rgba(255, 255, 255, .03)
      }

      .checkbox-row input[type=checkbox] {
        accent-color: var(--oro);
        width: 14px;
        height: 14px
      }

      .checkbox-row span {
        font-size: .78rem;
        color: var(--text)
      }

      .form-actions {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: .875rem;
        padding: 1.25rem;
        background: rgba(255, 255, 255, .02);
        border-top: 1px solid var(--border)
      }

      .btn-submit {
        display: inline-flex;
        align-items: center;
        gap: .5rem;
        background: var(--oro);
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
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, .3), transparent);
        transform: translateX(-100%);
        transition: transform .4s
      }

      .btn-submit:hover::after {
        transform: translateX(100%)
      }

      .btn-submit:hover {
        background: #fde68a;
        box-shadow: 0 0 25px rgba(251, 191, 36, .3)
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

      .success-overlay {
        display: none;
        position: fixed;
        inset: 0;
        background: rgba(6, 10, 16, .85);
        z-index: 200;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        gap: 1.5rem
      }

      .success-overlay.show {
        display: flex
      }

      .success-card {
        background: var(--panel);
        border: 1px solid rgba(251, 191, 36, .25);
        border-radius: 1rem;
        padding: 3rem 2.5rem;
        text-align: center;
        max-width: 380px;
        animation: popIn .4s cubic-bezier(.34, 1.56, .64, 1)
      }

      @keyframes popIn {
        from {
          opacity: 0;
          transform: scale(.8)
        }

        to {
          opacity: 1;
          transform: scale(1)
        }
      }

      .success-stars {
        font-size: 2.5rem;
        letter-spacing: .2rem;
        margin-bottom: 1rem
      }

      .success-title {
        font-family: 'Bebas Neue', sans-serif;
        font-size: 2rem;
        letter-spacing: .05em;
        color: var(--oro);
        margin-bottom: .5rem
      }

      .success-sub {
        font-size: .82rem;
        color: var(--muted)
      }

      @media(max-width:768px) {
        .rating-layout {
          grid-template-columns: 1fr
        }

        .criteria-grid {
          grid-template-columns: 1fr
        }
      }
    </style>
  </asp:Content>

  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-hero animate-up">
      <div>
        <div class="breadcrumb">
          <a href="Default.aspx">Inicio</a><span>›</span>
          <a href="Solicitudes.aspx">Solicitudes</a><span>›</span>
          <span style="color:var(--text)">Calificar</span>
        </div>
        <div class="page-title">Calificar Servicio</div>
        <div class="page-sub">Tu opinión ayuda a mejorar la plataforma y a otros usuarios</div>
      </div>
    </div>

    <div class="rating-layout animate-up delay-1">

      <div>
        <div class="sol-preview">
          <div class="sol-prev-header">
            <div class="sol-prev-title">SOLICITUD A CALIFICAR</div>
          </div>
          <div class="sol-prev-body">
            <div class="sol-prev-name">Reparación de tuberías</div>
            <div class="sol-prev-meta">
              <div class="sol-prev-item">🔧 Plomería</div>
              <div class="sol-prev-item">📅 17 Mar 2025</div>
              <div class="sol-prev-item">📍 El Poblado, Medellín</div>
              <div class="sol-prev-item" style="font-family:'JetBrains Mono',monospace;font-size:.68rem">#SOL-001</div>
            </div>
          </div>
        </div>

        <div class="prov-preview">
          <div class="prov-prev-body">
            <div class="prov-prev-avatar">🔧</div>
            <div>
              <div class="prov-prev-name">Fix Home</div>
              <div class="prov-prev-tipo">Plomería · Carpintería</div>
              <div class="prov-prev-rating">⭐ 4.9 actual · 32 reseñas</div>
            </div>
          </div>
        </div>
      </div>

      <div class="rating-form">
        <div class="rating-form-header">
          <span>⭐</span>
          <span class="rating-form-title">TU CALIFICACIÓN</span>
        </div>
        <div class="rating-form-body">

          <div class="stars-wrap">
            <div class="stars-label">Calificación general</div>
            <div class="star-row">
              <input type="radio" name="stars" id="s5" value="5"><label for="s5">⭐</label>
              <input type="radio" name="stars" id="s4" value="4"><label for="s4">⭐</label>
              <input type="radio" name="stars" id="s3" value="3"><label for="s3">⭐</label>
              <input type="radio" name="stars" id="s2" value="2"><label for="s2">⭐</label>
              <input type="radio" name="stars" id="s1" value="1"><label for="s1">⭐</label>
            </div>
            <div class="rating-text" id="rating-text">Selecciona una calificación</div>
          </div>

          <div class="criteria-grid">
            <div class="crit-item">
              <div class="crit-label">Puntualidad</div>
              <div class="crit-stars" id="c1">
                <span class="crit-star" onclick="setCrit('c1',1)">⭐</span>
                <span class="crit-star" onclick="setCrit('c1',2)">⭐</span>
                <span class="crit-star" onclick="setCrit('c1',3)">⭐</span>
                <span class="crit-star" onclick="setCrit('c1',4)">⭐</span>
                <span class="crit-star" onclick="setCrit('c1',5)">⭐</span>
              </div>
            </div>
            <div class="crit-item">
              <div class="crit-label">Calidad</div>
              <div class="crit-stars" id="c2">
                <span class="crit-star" onclick="setCrit('c2',1)">⭐</span>
                <span class="crit-star" onclick="setCrit('c2',2)">⭐</span>
                <span class="crit-star" onclick="setCrit('c2',3)">⭐</span>
                <span class="crit-star" onclick="setCrit('c2',4)">⭐</span>
                <span class="crit-star" onclick="setCrit('c2',5)">⭐</span>
              </div>
            </div>
            <div class="crit-item">
              <div class="crit-label">Precio</div>
              <div class="crit-stars" id="c3">
                <span class="crit-star" onclick="setCrit('c3',1)">⭐</span>
                <span class="crit-star" onclick="setCrit('c3',2)">⭐</span>
                <span class="crit-star" onclick="setCrit('c3',3)">⭐</span>
                <span class="crit-star" onclick="setCrit('c3',4)">⭐</span>
                <span class="crit-star" onclick="setCrit('c3',5)">⭐</span>
              </div>
            </div>
            <div class="crit-item">
              <div class="crit-label">Amabilidad</div>
              <div class="crit-stars" id="c4">
                <span class="crit-star" onclick="setCrit('c4',1)">⭐</span>
                <span class="crit-star" onclick="setCrit('c4',2)">⭐</span>
                <span class="crit-star" onclick="setCrit('c4',3)">⭐</span>
                <span class="crit-star" onclick="setCrit('c4',4)">⭐</span>
                <span class="crit-star" onclick="setCrit('c4',5)">⭐</span>
              </div>
            </div>
          </div>

          <div class="field">
            <label>Comentario *</label>
            <textarea id="comentario" placeholder="Cuéntanos cómo fue tu experiencia con el proveedor..."></textarea>
          </div>

          <label class="checkbox-row">
            <input type="checkbox" id="recomendar" checked>
            <span>Recomendaría este proveedor a otros usuarios</span>
          </label>

          <div class="form-actions" style="margin:0 -1.5rem -1.5rem;padding:1.25rem 1.5rem">
            <a href="Solicitudes.aspx" class="btn-cancel">← Volver</a>
            <button class="btn-submit" onclick="enviarCalificacion()">⭐ ENVIAR CALIFICACIÓN</button>
          </div>
        </div>
      </div>

    </div>

    <div class="success-overlay" id="success-overlay">
      <div class="success-card">
        <div class="success-stars">⭐⭐⭐⭐⭐</div>
        <div class="success-title">¡GRACIAS!</div>
        <div class="success-sub">Tu calificación fue registrada exitosamente y ayudará a otros usuarios de SmartUrban.
        </div>
        <a href="Solicitudes.aspx"
          style="display:inline-flex;align-items:center;gap:.4rem;margin-top:1.5rem;background:var(--oro);color:#060A10;font-family:'Bebas Neue',sans-serif;font-size:.95rem;letter-spacing:.06em;padding:.6rem 1.5rem;border-radius:.5rem;text-decoration:none">←
          Ver Solicitudes</a>
      </div>
    </div>

  </asp:Content>

  <asp:Content ID="ScriptsContent" ContentPlaceHolderID="Scripts" runat="server">
    <script>
      var labels = ['', 'Muy malo 😞', 'Regular 😐', 'Bueno 🙂', 'Muy bueno 😊', 'Excelente 🤩'];
      document.querySelectorAll('.star-row input[type=radio]').forEach(function (r) {
        r.addEventListener('change', function () {
          document.getElementById('rating-text').textContent = labels[this.value];
        });
      });
      function setCrit(id, val) {
        var stars = document.getElementById(id).querySelectorAll('.crit-star');
        stars.forEach(function (s, i) { s.classList.toggle('on', i < val); });
      }
      function enviarCalificacion() {
        var rated = document.querySelector('.star-row input:checked');
        var com = document.getElementById('comentario').value;
        if (!rated) { alert('Por favor selecciona una calificación de estrellas'); return; }
        if (!com.trim()) { alert('Por favor escribe un comentario'); return; }
        document.getElementById('success-overlay').classList.add('show');
      }
    </script>
  </asp:Content>