<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartUrban._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO -->
    <section class="hero-section animate-up">
        <div class="hero-grid"></div>
        <div class="hero-orb1"></div>
        <div class="hero-orb2"></div>
        <div class="hero-content">
            <div class="section-label">
                <span style="width:8px;height:8px;border-radius:50%;background:var(--verde);display:inline-block;animation:pulse 2s infinite;"></span>
                Servicios activos en Medellín
            </div>
            <h1 class="hero-title">
                TU CIUDAD<br>
                <span class="verde">CONECTADA.</span>
            </h1>
            <p class="hero-subtitle">
                Plomeros, electricistas, carpinteros y más — cerca de ti, verificados, listos para ayudarte en cualquier zona de Medellín.
            </p>
            <div class="hero-buttons">
                <a href="Servicios.aspx" class="btn-verde">Ver Servicios →</a>
                <a href="RegistrarProveedor.aspx" class="btn-ghost">Ofrecer un servicio</a>
            </div>
        </div>
        <div class="hero-terminal">
            <span style="opacity:.5;">$ </span>status: <span style="color:#fff;">ONLINE</span>
        </div>
    </section>

    <!-- STATS -->
    <div class="g4 mb8 animate-up delay-1">
        <a href="Proveedores.aspx" class="stat-card">
            <span style="font-size:1.5rem;margin-bottom:.5rem;">🏪</span>
            <span class="stat-value">2</span>
            <span class="stat-label">Proveedores</span>
        </a>
        <a href="Servicios.aspx" class="stat-card">
            <span style="font-size:1.5rem;margin-bottom:.5rem;">🛠️</span>
            <span class="stat-value">6</span>
            <span class="stat-label">Servicios</span>
        </a>
        <a href="Solicitudes.aspx" class="stat-card">
            <span style="font-size:1.5rem;margin-bottom:.5rem;">📋</span>
            <span class="stat-value">3</span>
            <span class="stat-label">Solicitudes</span>
        </a>
        <div class="stat-card">
            <span style="font-size:1.5rem;margin-bottom:.5rem;">⭐</span>
            <span class="stat-value">4.8</span>
            <span class="stat-label">Calificación</span>
        </div>
    </div>

    <!-- MÓDULOS -->
    <div class="animate-up delay-2" style="text-align:center;margin-bottom:2rem;">
        <div class="section-label" style="justify-content:center;">Sistema de Gestión Urbana</div>
        <h2 class="page-title" style="font-size:clamp(2rem,5vw,3.5rem);">¿QUÉ NECESITAS HOY?</h2>
        <p class="page-subtitle">Selecciona un módulo para continuar</p>
    </div>

    <div class="g3 animate-up delay-3">
        <a href="Proveedores.aspx" class="menu-card">
            <span class="menu-card-emoji">🏪</span>
            <h3 class="menu-card-title">Proveedores</h3>
            <p class="menu-card-desc">Ver y gestionar proveedores de servicio registrados</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
        <a href="Servicios.aspx" class="menu-card">
            <span class="menu-card-emoji">🛠️</span>
            <h3 class="menu-card-title">Servicios</h3>
            <p class="menu-card-desc">Catálogo de servicios disponibles en la plataforma</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
        <a href="Solicitudes.aspx" class="menu-card">
            <span class="menu-card-emoji">📋</span>
            <h3 class="menu-card-title">Solicitudes</h3>
            <p class="menu-card-desc">Historial y seguimiento de solicitudes activas</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
        <a href="RegistrarProveedor.aspx" class="menu-card">
            <span class="menu-card-emoji">➕</span>
            <h3 class="menu-card-title">Registrar Proveedor</h3>
            <p class="menu-card-desc">Agregar nuevo proveedor con ubicación en el mapa</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
        <a href="SolicitarServicio.aspx" class="menu-card">
            <span class="menu-card-emoji">📤</span>
            <h3 class="menu-card-title">Solicitar Servicio</h3>
            <p class="menu-card-desc">Crear nueva solicitud con ubicación exacta</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
        <a href="CalificarServicio.aspx" class="menu-card">
            <span class="menu-card-emoji">⭐</span>
            <h3 class="menu-card-title">Calificar Servicio</h3>
            <p class="menu-card-desc">Evalúa la calidad del servicio recibido</p>
            <span class="menu-card-arrow">ABRIR →</span>
        </a>
    </div>

</asp:Content>