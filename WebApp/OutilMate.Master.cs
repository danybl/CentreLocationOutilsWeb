using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Outil : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Deconnexion.Visible = false;

            if (Session["Nom_Usager"] != null)
            {
                Deconnexion.Visible = true;
                string msg = "Bienvenue " + Session["Nom_Usager"].ToString() + " [";
                inviteSession.InnerHtml = msg; 
            }
        }

        protected void DeconnecterUtilisateur(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("~/Compte/Connexion.aspx");
        }
    }
}