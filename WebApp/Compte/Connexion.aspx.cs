using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.Compte
{
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConnexion_Click(object sender, EventArgs e)
        {
            OleDbConnection conn = null;
            OleDbDataReader dr = null;
            try
            {
                conn = new OleDbConnection("Provider=OraOLEDB.Oracle; Data Source=xe; User ID=test; Password=test; Unicode=True");
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("Select * FROM client where email='" + txtEmail.Text + "' and motDePasse='" + txtMotDePasse.Text + "'", conn);

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    System.Diagnostics.Debug.WriteLine("CLIENT : " + dr.GetValue(1));
                    Session["Nom_Usager"] = dr.GetValue(1);
                    Response.Redirect("~/Commun/Accueil.aspx");
                }
                else
                {
                    MessageDErreur.Text = "Oops ! Votre email ou votre mot de passe est invalide !";
                }

            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
                Response.End();
            }
            finally
            {
                if (conn != null) conn.Close();
            }
        }
    }
}