<%@ Page Title="" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" 
    CodeBehind="Outils.aspx.cs" Inherits="WebApp.Outils" %>
<asp:Content ID="ContenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">
</asp:Content>
<asp:Content ID="ContenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">
   <p> 
     <asp:GridView runat="server" id="grilleOutils" CellPadding="4" OnRowCommand="grilleOutils_RowCommand" AutoGenerateColumns="False" width="100%"> 
       <Columns>
           <asp:TemplateField HeaderText="Image">
               <itemtemplate>
              <asp:Image runat="server" ID="imgProduit" ImageUrl='<%# Eval("image") %>' CssClass="img" />
             </itemtemplate>
               <itemstyle horizontalalign="Center" />
           </asp:TemplateField>
             <asp:BoundField DataField="nom" HeaderText="Nom"> 
               <ItemStyle HorizontalAlign="Center" /> 
             </asp:BoundField> 
             <asp:BoundField DataField="description"  HeaderText="Description" /> 
             <asp:BoundField DataField="prixlocation"  HeaderText="Prix par Jour" DataFormatString="{0:C}" > 
               <ItemStyle HorizontalAlign="Center" /> 
             </asp:BoundField> 
           <asp:TemplateField HeaderText="Ajouter au panier">
             <ItemTemplate>
             <asp:Button ID="btnAjouter" CssClass="btn" runat="server" CausesValidation="false" CommandName="Ajouter"
                    Text="Ajouter" CommandArgument='<%# Eval("idOutil") %>' />
             </ItemTemplate>
             <ItemStyle HorizontalAlign="Center" /> 
           </asp:TemplateField>
       </Columns> 
        <HeaderStyle HorizontalAlign="Center" BackColor="#C0C0C0" Font-Bold="True" ForeColor="#000000" /> 
        <FooterStyle HorizontalAlign="Center" BackColor="#C0C0C0" Font-Bold="True" ForeColor="#000000" />
     </asp:GridView> 
   </p>
</asp:Content>
