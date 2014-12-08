<%@ Page Title="Connexion" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="WebApp.Compte.Connexion" %>
<asp:Content ID="contenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">

</asp:Content>
<asp:Content ID="contenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">

    <h2>Se connecter</h2>
    <p>
        Entrez un nom d'utilisateur et un mot de passe.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false" NavigateUrl="~/Compte/Enregistrer.aspx">S'inscrire</asp:HyperLink> si vous n'avez pas de compte.
    </p>
    <span class="notificationEchec">
                <asp:Literal ID="MessageDErreur" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="ResumeDeValidation" runat="server" CssClass="notificationEchec" 
                 ValidationGroup="GroupeDeValidationDeConnexion"/>

    <div class="infoConnexion" style="height: 400px;">
        <fieldset class="connexion">
            <legend>S'identifier</legend>
            <p>
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email :</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="entreeTexte"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequis" runat="server" ControlToValidate="txtEmail" 
                        CssClass="notificationEchec" ErrorMessage="Un email d'utilisateur est requis." ToolTip="Un email d'utilisateur est requis." 
                        ValidationGroup="GroupeDeValidationDeConnexion">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" 
                                     CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Email n'est pas valide !"
                                     ValidationGroup="GroupeDeValidationDeConnexion">*</asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="lblMotDePasse" runat="server" AssociatedControlID="txtMotDePasse">Mot de passe :</asp:Label>
                <asp:TextBox ID="txtMotDePasse" runat="server" CssClass="entreeMotDePasse" 
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="MotDePasseRequis" runat="server" ControlToValidate="txtMotDePasse" 
                        CssClass="notificationEchec" ErrorMessage="Un mot de passe est requis." ToolTip="Un mot de passe est requis." 
                        ValidationGroup="GroupeDeValidationDeConnexion">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:CheckBox ID="cbSeRappelerDeMoi" runat="server"/>
                <asp:Label ID="lblSeRappelerDeMoi" runat="server" 
                    AssociatedControlID="lblSeRappelerDeMoi" CssClass="inline">Se souvenir de moi</asp:Label>
            </p>
        </fieldset>
        <p class="btnConnexion">
            <asp:Button CssClass="btn" ID="btnConnexion" runat="server" 
                Text="Se connecter" ValidationGroup="GroupeDeValidationDeConnexion" OnClick="btnConnexion_Click"/>
        </p>
    </div>
</asp:Content>
