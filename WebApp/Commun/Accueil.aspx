<%@ Page Title="Accueil" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" CodeBehind="Accueil.aspx.cs" Inherits="WebApp.Commun.Accueil" %>
<asp:Content ID="ContenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">
</asp:Content>
<asp:Content ID="ContenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">
            <div id="Accueil" style="height: 600px;">
                <h2>
                    Accueil
                </h2>
                <p>
                    <asp:Image ID="Image1" runat="server" ImageUrl="message.png"  Width="100%"/>
                    <asp:Image ID="imgPersonnes" CssClass="imgPersonnes" runat="server" ImageUrl="personnes.png" />
                </p>
            </div>
</asp:Content>
