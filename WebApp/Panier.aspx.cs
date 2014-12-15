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
       protected static DataTable table;
       //protected List<int> outils;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                table = GetTableVide();
                PopulerTable();
                grilleOutils.DataSource = table;
                grilleOutils.DataBind();
            } 
        }
        protected void PopulerTable() {
            List<int> outils = new List<int>();
            outils = (List<int>)Session["outils"];

            if (outils != null)
            {
                btnReservation.Visible = true;
                foreach (int idOutil in outils)
                {
                    LierLesDonnees(idOutil);
                }
            }
            else {
                lblMessage.Visible = true;
            }
        }
        protected void LierLesDonnees(int idOutil)
        {
            OleDbConnection conn = null;
            OleDbDataReader reader = null;
            DataRow nouvelleLigne;

            try
            {
                conn = new OleDbConnection("Provider=OraOLEDB.Oracle; Data Source=xe; User ID=test; Password=test; Unicode=True");
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("Select * FROM Outil WHERE idOutil ='" + idOutil + "'", conn);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    nouvelleLigne = table.NewRow();
                    nouvelleLigne[0] = reader.GetValue(0);
                    nouvelleLigne[1] = reader.GetValue(1);
                    nouvelleLigne[2] = reader.GetValue(2);
                    nouvelleLigne[3] = reader.GetValue(3);
                    nouvelleLigne[4] = reader.GetValue(4);
                    nouvelleLigne[5] = reader.GetValue(5);
                    nouvelleLigne[6] = reader.GetValue(6);
                    nouvelleLigne[7] = reader.GetValue(7);

                    table.Rows.Add(nouvelleLigne);

                    System.Diagnostics.Debug.WriteLine("Lignes dans la table : " + table.Rows.Count);
                }
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

        public static DataTable GetTableVide() // retourne seulement structure des colonnes
        {
            DataTable table = new DataTable();
            table.Columns.Add("IdOutil", typeof(int));
            table.Columns.Add("IdCategorie ", typeof(int));
            table.Columns.Add("Nom", typeof(string));
            table.Columns.Add("NumSerie", typeof(int));
            table.Columns.Add("DateAcquisition", typeof(string));
            table.Columns.Add("PrixLocation", typeof(double));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("Image", typeof(string));
            return table;
        }

        protected void retirerOutil_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Retirer")
            {
                List<int> liseOutils = (List<int>)Session["outils"];
                int idProduit = Convert.ToInt32(e.CommandArgument);
                System.Diagnostics.Debug.WriteLine("Retirer produit ID : " + idProduit);
                liseOutils.Remove(idProduit);
                System.Diagnostics.Debug.WriteLine("NOMBRE D'OUILS RESTANT : " + liseOutils.Count);
                Session["outils"] = liseOutils;
                Response.Redirect(Request.RawUrl);
            }

        }
        protected void btnReservation_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("#### btnReservation_Click ####");
            List<int> outils = new List<int>();
            outils = (List<int>)Session["outils"];
            int idClient = (int)Session["Id_Client"];

            if (outils != null)
            {
                foreach (int idOutil in outils)
                {
                    //placerReservation(idOutil, idClient,,);
                }
            }
            else
            {
                lblMessage.Visible = true;
            }
        }

        protected void placerReservation(int idclient, int idoutil, DateTime datereservation, DateTime datelimite)
        {
            OleDbConnection conn = null;

            try
            {
                conn = new OleDbConnection("Provider=OraOLEDB.Oracle; Data Source=xe; User ID=test; Password=test; Unicode=True");
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("INSERT INTO reservation VALUES ( seq_location_id.NEXTVAL," + idclient + "," + idoutil + "," + ConvertirEnTimestamp(datereservation) + "," + ConvertirEnTimestamp(datelimite) + ")", conn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
                Response.End();
            }
            finally
            {
                if (conn != null) conn.Close();
            }
        }

        protected long ConvertirEnTimestamp(DateTime valeur)
        {
            long dateEnTimestamp = (valeur.Ticks - 621355968000000000) / 10000000;
            return dateEnTimestamp;
        }
    }
}