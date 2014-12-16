<%@ Page Title="Enregistrer" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" CodeBehind="Enregistrer.aspx.cs" Inherits="WebApp.Compte.Enregistrer" %>
<asp:Content ID="contenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">
</asp:Content>
<asp:Content ID="contenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">

        <h2>Créer un nouveau compte</h2>
        <span class="notificationEchec">
        <asp:Literal ID="MessageDErreur" runat="server"></asp:Literal>
        </span>
        <asp:ValidationSummary ID="ResumeValidation" runat="server" 
        CssClass="notificationEchec" ValidationGroup="GroupeValidationEnregistrement"/>
       
        <div class="enregistrement" style="height: 850px;">
            <fieldset class="infoEnregistrement">
                <legend>Enregistrez-vous !</legend>
                    <p>
                        <asp:Label ID="lblPrenom" runat="server" AssociatedControlID="txtPrenom">Prénom :</asp:Label>
                        <asp:TextBox ID="txtPrenom" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server"  ControlToValidate="txtPrenom" 
                                     CssClass="notificationEchec" ErrorMessage="Un prénom d'utilisateur est requis." ToolTip="Un prénom d'utilisateur est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[A-Za-z\s\-]+$" ControlToValidate="txtPrenom" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
 
                    <p>
                        <asp:Label ID="lblNom" runat="server" AssociatedControlID="txtNom">Nom :</asp:Label>
                        <asp:TextBox ID="txtNom" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNom" 
                                     CssClass="notificationEchec" ErrorMessage="Un nom d'utilisateur est requis." ToolTip="Un nom d'utilisateur est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[A-Za-z\s\-]+$" ControlToValidate="txtNom" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>

                    <p>
                        <asp:Label ID="lblMotDePasse" runat="server" AssociatedControlID="txtMotDePasse">Mot de passe :</asp:Label>
                        <asp:TextBox ID="txtMotDePasse" runat="server" CssClass="entreeMotDePasse" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMotDePasse"
                                     CssClass="notificationEchec" ErrorMessage="Un mot de passe d'utilisateur est requis." ToolTip="Un mot de passe d'utilisateur est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                    </p>

                    <p>
                        <asp:Label ID="lblConfirmationMotDePasse" runat="server" AssociatedControlID="txtConfirmationMotDePasse">Confirmez le mot de passe :</asp:Label>
                        <asp:TextBox ID="txtConfirmationMotDePasse" runat="server" CssClass="entreeMotDePasse" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmationMotDePasse"
                                     CssClass="notificationEchec" ErrorMessage="La confirmation d'un mot de passe d'utilisateur est requis." ToolTip="La confirmation d'un mot de passe d'utilisateur est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="confirmationPasse" runat="server" ControlToCompare="txtMotDePasse" ControlToValidate="txtConfirmationMotDePasse" 
                                     CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Les mots de passe ne correspondent pas."
                                     ToolTip="Les mots de passe ne correspondent pas."
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:CompareValidator>
                    </p>

                    <p>
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email :</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                     CssClass="notificationEchec" ErrorMessage="Un Email d'utilisateur est requis." ToolTip="Un Email d'utilisateur est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" 
                                     CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Email n'est pas valide !"
                                     ToolTip="Email n'est pas valide !"
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                                 
                    </p>
                    <p>
                        <asp:Label ID="lblNumeroRue" runat="server" AssociatedControlID="txtNumeroRue">Numéro de rue :</asp:Label>
                        <asp:TextBox ID="txtNumeroRue" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumeroRue" 
                                     CssClass="notificationEchec" ErrorMessage="Le numéro de la rue est requis." ToolTip="Le numéro de la rue est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^\d+$" ControlToValidate="txtNumeroRue" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les valeurs numériques sont autorisées!"
                                    ToolTip="Seules les valeurs numériques sont autorisées!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblRue" runat="server" AssociatedControlID="txtRue">Adresse (la rue) :</asp:Label>
                        <asp:TextBox ID="txtRue" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRue" 
                                     CssClass="notificationEchec" ErrorMessage="Le nom de rue est requis." ToolTip="Le nom de rue est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\w\s\-]+$" ControlToValidate="txtRue" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces, les valeurs numériques et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces, les valeurs numériques et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblAppartement" runat="server" AssociatedControlID="txtAppartement">Appartement :</asp:Label>
                        <asp:TextBox ID="txtAppartement" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\w\s\-]+$" ControlToValidate="txtAppartement" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces, les valeurs numériques et les tirets sont autorisées!"
                                    ToolTip="Seules les lettres, les espaces, les valeurs numériques et les tirets sont autorisées!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblCodePostal" runat="server" AssociatedControlID="txtCodePostal">Code Postal :</asp:Label>
                        <asp:TextBox ID="txtCodePostal" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCodePostal" 
                                     CssClass="notificationEchec" ErrorMessage="Le code postal est requis." ToolTip="Le code postal est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[\w\s]+$" ControlToValidate="txtCodePostal" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les valeurs numériques sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les valeurs numériques sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblVille" runat="server" AssociatedControlID="txtVille">Ville :</asp:Label>
                        <asp:TextBox ID="txtVille" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtVille" 
                                     CssClass="notificationEchec" ErrorMessage="Le nom de la ville est requis." ToolTip="Le nom de la ville est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[A-Za-z\s\-]+$" ControlToValidate="txtVille" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblProvince" runat="server" AssociatedControlID="txtProvince">Province :</asp:Label>
                        <asp:TextBox ID="txtProvince" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProvince" 
                                     CssClass="notificationEchec" ErrorMessage="Le nom de la province est requis." ToolTip="Le nom de la province est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[A-Za-z\s\-]+$" ControlToValidate="txtProvince" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblPays" runat="server" AssociatedControlID="txtPays">Pays :</asp:Label>
                        <asp:TextBox ID="txtPays" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPays" 
                                     CssClass="notificationEchec" ErrorMessage="Un nom du pays est requis." ToolTip="Un nom du pays est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^[A-Za-z\s\-]+$" ControlToValidate="txtPays" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ToolTip="Seules les lettres, les espaces et les tirets sont autorisés!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="lblTelephone" runat="server" AssociatedControlID="txtNumeroRue">Numéro de téléphone :</asp:Label>
                        <asp:TextBox ID="txtTelephone" runat="server" CssClass="entreeTexte"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelephone" 
                                     CssClass="notificationEchec" ErrorMessage="Le numéro de téléphone est requis." ToolTip="Le numéro de téléphone est requis." 
                                     ValidationGroup="GroupeValidationEnregistrement">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ValidationExpression="^\d+$" ControlToValidate="txtTelephone" 
                                    CssClass="notificationEchec" Display="Dynamic" ErrorMessage="Seules les valeurs numérique sont autorisées!"
                                    ToolTip="Seules les valeurs numérique sont autorisées!"
                                    ValidationGroup="GroupeValidationEnregistrement">*</asp:RegularExpressionValidator>
                    </p>


                    <p>
                        <asp:Label ID="lblResultat" runat="server" Visible="False"></asp:Label>
                    </p>
            </fieldset>
            <asp:Button CssClass="btn" ID="BtnSubmit" runat="server" Text="Sousmettre"  ValidationGroup="GroupeValidationEnregistrement"/>
        </div>
</asp:Content>
