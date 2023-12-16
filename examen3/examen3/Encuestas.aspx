<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Encuestas.aspx.cs" Inherits="examen3.Encuestas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="text-center">
     <h1> Encuestas </h1>
 </div>

     <div>
     <br />
     <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
         CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
         RowStyle-CssClass="rows" AllowPaging="True"    />
    <br />
</div>
    <div class="container text-center">
        
        Nombre:
         <asp:TextBox ID="Tnombre" CssClass="form-control" runat="server"></asp:TextBox>
        Edad:
        <asp:TextBox ID="Tedad" CssClass="form-control" runat="server"></asp:TextBox>
        Correo:
        <asp:TextBox ID="Tcorreo" CssClass="form-control" runat="server"></asp:TextBox>
        Partido Politico:
        <asp:TextBox ID="Tpartido" CssClass="form-control" runat="server"></asp:TextBox>
       

    </div>

<div class="container text-center">
    <asp:Button ID="Button1" runat="server"  class="btn btn-outline-primary" Text="Agregar" OnClick="Button1_Click"  />
    <asp:Button ID="Button2" runat="server"  class="btn btn-outline-primary" Text="Consultar" OnClick="Button2_Click"  />
   
</div>
</asp:Content>
