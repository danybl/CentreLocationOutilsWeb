<%@ Page Title="" Language="C#" MasterPageFile="~/OutilMate.Master" AutoEventWireup="true" 
    CodeBehind="Panier.aspx.cs" Inherits="WebApp.Panier"  EnableEventValidation="false" %>
<asp:Content ID="ContenuEntete" ContentPlaceHolderID="contenuEntete" runat="server">

</asp:Content>
<asp:Content ID="ContenuPrincipal" ContentPlaceHolderID="contenuPrincipal" runat="server">
    <p> 
        <asp:Label ID="lblMessage" runat="server" Visible="false" Text="Vous n'avez pas d'articles dans votre panier pour le moment."></asp:Label>
     <asp:GridView runat="server" id="grilleOutils" CellPadding="4" OnRowCommand="retirerOutil_RowCommand" AutoGenerateColumns="False" width="100%" > 
       <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image runat="server" ID="imgProduit" ImageUrl='<%# Eval("image") %>' CssClass="img" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:TemplateField>
            <asp:BoundField DataField="nom" HeaderText="Nom"> 
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:BoundField> 
            <asp:BoundField DataField="prixlocation"  HeaderText="Prix par Jour" DataFormatString="{0:C}" > 
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:BoundField>
            <asp:TemplateField HeaderText="Date  de réservation">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblDate" Text='<%# DateTime.Now %>'  />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="Date  de réservation">
                <ItemTemplate>
                    <asp:TextBox ID="txtDate" runat="server" ReadOnly = "true"></asp:TextBox>
                    <img src="Calender.png" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Retirer du panier">
                <ItemTemplate>
                    <asp:Button ID="btnRetirer" CssClass="btn" runat="server" CausesValidation="false" CommandName="Retirer"
                        Text="Retirer" CommandArgument='<%# Eval("idOutil") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
            </asp:TemplateField>
       </Columns> 
        <HeaderStyle HorizontalAlign="Center" BackColor="#C0C0C0" Font-Bold="True" ForeColor="#000000" /> 
        <FooterStyle HorizontalAlign="Center" BackColor="#C0C0C0" Font-Bold="True" ForeColor="#000000" />
     </asp:GridView> 
        
   </p>
   <p class="btnReservation">
     <asp:Button CssClass="btn" ID="btnReservation" runat="server" Visible="false" CommandName="Reserver" 
           Text="Réserver" OnClick="btnReservation_Click" />
   </p>
</asp:Content>
