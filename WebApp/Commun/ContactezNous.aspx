<%@ Page Title="Contactez-Nous" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" 
    CodeBehind="ContactezNous.aspx.cs" Inherits="WebApp.Commun.ContactezNous" %>
<asp:Content ID="ContenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">
</asp:Content>
<asp:Content ID="ContenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">
        <div id="ContactezNous" style="height: 400px;">
            <h2>
                Contactez-nous
            </h2>
            <asp:Image ID="imgOuvrier" CssClass="imgOuvrier" runat="server" ImageUrl="ouvrier.png" />
            <p style="margin-top: 6%; margin-right: 14%;">
                Si vous avez des questions ou des commentaires à nous transmettre, vous pouvez nous 
                écrire à l'adresse suivante serviceclientele@outilmate.com et nous nous ferons un plaisir 
                de vous répondre dans les plus brefs délais. Vous pouvez aussi nous joindre en tout 
                temps par téléphone au 1-800-666-9999.
            </p>
            <h3>
            Siége social
            </h3>
            <p>
                9155, rue Saint-Hubert,</br>
                Montréal (Québec) H2M 1Y8</br>
                514.389.5921 • 1 866.389.5921</br>
            </p>
        </div>
</asp:Content>
