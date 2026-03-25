<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SmartUrban.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h1 class="text-3xl font-bold mb-6">
Proveedores
</h1>

<div class="bg-[#151C2F] p-6 rounded-xl">

<table class="w-full">

<thead class="border-b border-white/10 text-gray-400">

<tr>

<th>ID</th>
<th>Proveedor</th>
<th>Servicio</th>

</tr>

</thead>

<tbody>

<tr class="border-b border-white/10 hover:bg-[#1B2335]">

<td>1</td>
<td>Empresa XYZ</td>
<td>Limpieza urbana</td>

</tr>

</tbody>

</table>

</div>

</asp:Content>