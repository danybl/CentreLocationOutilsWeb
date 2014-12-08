using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace WebApp
{
    public partial class Outils : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LierLesDonnees();
            }
        }

        public void LierLesDonnees()
        {
            OleDbConnection conn = null;
            OleDbDataReader reader = null;
            try
            {
                conn = new OleDbConnection("Provider=OraOLEDB.Oracle; Data Source=xe; User ID=test; Password=test; Unicode=True");
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("Select * FROM Outil", conn);
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

        protected void grilleOutils_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ajouter")
            {
                int indiceDeLigne = Convert.ToInt32(e.CommandArgument);

                Session["idOutil"] = e.CommandArgument;

                System.Diagnostics.Debug.WriteLine("Ajouter produit ID : " + indiceDeLigne);
            }

        }
 
    }
}