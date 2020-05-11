using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication5
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("upload.aspx");
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (user.Text == "" && pass.Text == "")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                try
                {

                    SqlConnection scon = new SqlConnection("Server=tcp:anoop.database.windows.net,1433;Initial Catalog=Library;Persist Security Info=False;User ID=db_admin;Password=Anoop@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    scon.Open();
                    SqlCommand cmd = new SqlCommand("select * from users where username='" + user.Text + "'", scon);
                    SqlDataReader dr = cmd.ExecuteReader();

                    /* SqlDataAdapter da = new SqlDataAdapter(cmd);
                     DataTable dt = new DataTable();
                     da.Fill(dt);*/
                    while (dr.Read())
                    {
                        if (user.Text == dr["username"].ToString().Trim() && pass.Text == dr["pass"].ToString().Trim())
                        {
                            Session["user"] = "login";
                            Response.Redirect("upload.aspx");
                        }
                        else
                            Response.Redirect("login.aspx");
                    }

                    scon.Close();
                }

                catch (Exception ex)
                {
                    throw (ex);
                }

            }
        }
    }
}