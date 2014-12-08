using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using System.Data.Common;

namespace WebApp
{
    public partial class Panier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idOutil = Convert.ToInt32(Session["idOutil"]);
            LierLesDonnees(idOutil);
        }

        public void LierLesDonnees(int idOutil)
        {
            OleDbConnection conn = null;
            OleDbDataReader reader = null;
            try
            {
                conn = new OleDbConnection("Provider=OraOLEDB.Oracle; Data Source=xe; User ID=test; Password=test; Unicode=True");
                conn.Open();

                OleDbCommand cmd =
                    new OleDbCommand("Select * FROM Outil WHERE idOutil ='" + idOutil + "'", conn);
                reader = cmd.ExecuteReader();

                grilleOutils.DataSource = reader;
                grilleOutils.DataBind();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                Response.End();
            }
            finally
            {
                if (reader != null) reader.Close();
                if (conn != null) conn.Close();
            }
        }

        protected void retirerOutil_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Retirer")
            {
                int indiceDeLigne = Convert.ToInt32(e.CommandArgument);

                LierLesDonnees(indiceDeLigne);

                System.Diagnostics.Debug.WriteLine("Retirer produit ID : " + indiceDeLigne);
            }

        }
        protected void btnReservation_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("#### btnReservation_Click ####");
        }

        protected long ConvertirEnTimestamp(DateTime valeur)
        {
            long dateEnTimestamp = (valeur.Ticks - 621355968000000000) / 10000000;
            return dateEnTimestamp;
        }
    }
}