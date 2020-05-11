using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class products : System.Web.UI.Page
    {
        SqlConnection scon = new SqlConnection("Server=tcp:anoop.database.windows.net,1433;Initial Catalog=Library;Persist Security Info=False;User ID=db_admin;Password=Anoop@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grpp();
            }

        }

        private void grpp()
        {
            scon.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from booklist where title='" + + "' order by dt desc";
            cmd.Connection = scon;
             SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
            ds = new DataSet();
            sqlda.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            scon.Close();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
                scon.Open();
            String sql = " select * from booklist where title='" + GridView2.SelectedRow.Cells[0].Text.Trim() + "' order by dt desc";
            SqlCommand cmd2 = new SqlCommand(sql, scon);
            SqlDataReader dataReader = cmd2.ExecuteReader();
            dataReader.Read();
           
            string gd = dataReader.GetValue(3).ToString().Trim();
            string az = dataReader.GetValue(4).ToString().Trim();
            if (az == "link")
            { Page.ClientScript.RegisterStartupScript(
  this.GetType(), "OpenWindow", "window.open('"+ gd +"','_newtab');", true);
              //  Response.Redirect(gd);
            }
          
            else
            {
                  string storageConnection = CloudConfigurationManager.GetSetting("StorageConnectionString"); 
                CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(storageConnection); 
                CloudBlobClient blobClient = cloudStorageAccount.CreateCloudBlobClient();
                CloudBlobContainer cloudBlobContainer = blobClient.GetContainerReference("files"); 
                CloudBlockBlob blockBlob = cloudBlobContainer.GetBlockBlobReference(az);

                MemoryStream memStream = new MemoryStream();

                blockBlob.DownloadToStream(memStream);
                //blockBlob.DownloadRangeToStream(memStream);
                
                HttpContext.Current.Response.ContentType = blockBlob.Properties.ContentType.ToString(); 
                HttpContext.Current.Response.AddHeader("Content-Disposition", "Attachment; filename=" + az.ToString());
                HttpContext.Current.Response.AddHeader("Content-Length", blockBlob.Properties.Length.ToString());
                HttpContext.Current.Response.BinaryWrite(memStream.ToArray()); 
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.Close();
            

            }


        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.grpp();

        }

        protected void cncl_Click(object sender, EventArgs e)
        {

        }

        protected void srch_Click(object sender, EventArgs e)
        {

        }
    }
}