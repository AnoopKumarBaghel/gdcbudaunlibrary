using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

namespace WebApplication5
{
    public partial class Gr : System.Web.UI.Page
    {
        SqlConnection scon = new SqlConnection("Server=tcp:anoop.database.windows.net,1433;Initial Catalog=Library;Persist Security Info=False;User ID=db_admin;Password=Anoop@123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                Grpp();
            }
            else
            {
                if (dd.SelectedValue == "g")
                {
                    FileUpload1.Visible = false;
                    TextBox4.Visible = true;
                }
                else
                {
                    TextBox4.Visible = false;

                    FileUpload1.Visible = true;
                }
            }





        }

        private void Grpp()
        {
            scon.Open();
            SqlCommand cmd = new SqlCommand("select * from booklist  order by dt desc", scon);
            SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sqlda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            scon.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            scon.Open();
            String sql = " select * from booklist where title='" + GridView1.SelectedRow.Cells[0].Text.Trim() + "' order by dt desc";
            SqlCommand cmd2 = new SqlCommand(sql, scon);
            SqlDataReader dataReader = cmd2.ExecuteReader();
            dataReader.Read();
            TextBox1.Text = dataReader.GetValue(0).ToString();
            TextBox2.Text = dataReader.GetValue(1).ToString();
            TextBox3.Text = dataReader.GetValue(2).ToString();
            TextBox4.Text = dataReader.GetValue(3).ToString();
            cmd2.Dispose();
            scon.Close();
            Grpp();
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            string ss = "";
            if (dd.SelectedValue == "0" || TextBox1.Text == "" || TextBox2.Text=="" || TextBox3.Text == "" )
            {
                Response.Redirect("upload.aspx");
               
            }
            if (FileUpload1.HasFile && dd.SelectedValue=="m")
                ss = up_Click();
            else
                ss = "link";

            if (ss == "file" || ss=="link")
            {
                string ff,ll;
                if (ss == "file")
                    { 
                     ff= FileUpload1.FileName.Trim();
                    ll = "file";
                }
                else
                {
                    ff = "link";
                    ll = TextBox4.Text.Trim();
                }
                scon.Open();
                try { 
                String sql = "insert into booklist values('" + TextBox1.Text.Trim() + "' , '" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + ll+ "','" + ff + "',Default);";
                SqlCommand cmd2 = new SqlCommand(sql, scon);
                SqlDataAdapter sad = new SqlDataAdapter();
                sad.InsertCommand = new SqlCommand(sql, scon);
                sad.InsertCommand.ExecuteNonQuery();
                cmd2.Dispose();
                scon.Close();
                Label4.Text = "Uploaded Successfully";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                } catch(Exception xe)
                {
                    string connstring = CloudConfigurationManager.GetSetting("StorageConnectionString");
                    CloudStorageAccount sa = CloudStorageAccount.Parse(connstring);
                    CloudBlobClient cloudBlobClient = sa.CreateCloudBlobClient();
                    CloudBlobContainer Container = cloudBlobClient.GetContainerReference("files");
                    Container.CreateIfNotExists();
                    CloudBlockBlob b = Container.GetBlockBlobReference(FileUpload1.FileName);
                    b.DeleteIfExists();
                }
                }
            else
                Label4.Text = "Uploaded Failed";
            Grpp();
        }

        protected string up_Click()
        {
            try
            {

                var _task = Task.Run(() => this.UploadFile());
                _task.Wait();
                string fileUrl = _task.Result;
                return fileUrl;
            }
            catch (Exception ex)
            {
                throw (ex);
            }

        }

        private async Task<string> UploadFile()
        {
            try
            {
                string connstring = CloudConfigurationManager.GetSetting("StorageConnectionString");
                CloudStorageAccount sa = CloudStorageAccount.Parse(connstring);
                CloudBlobClient cloudBlobClient = sa.CreateCloudBlobClient();
                CloudBlobContainer Container = cloudBlobClient.GetContainerReference("files");
                Container.CreateIfNotExists();
                CloudBlockBlob b = Container.GetBlockBlobReference(FileUpload1.FileName);
               
                using (FileUpload1.PostedFile.InputStream)
                {
                    b.UploadFromStream(FileUpload1.PostedFile.InputStream);
                }
                return "file";
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            scon.Open();
            String sql1 = " select * from booklist where title='" + TextBox1.Text.Trim() + "' order by dt desc";
            SqlCommand cmd2 = new SqlCommand(sql1, scon);
            SqlDataReader dataReader = cmd2.ExecuteReader();
            dataReader.Read();
            string link = dataReader.GetValue(3).ToString();
           string filename = dataReader.GetValue(4).ToString();
            dataReader.Close();
            cmd2.Dispose();
            if (link=="file")
            {
                string connstring = CloudConfigurationManager.GetSetting("StorageConnectionString");
                CloudStorageAccount sa = CloudStorageAccount.Parse(connstring);
                CloudBlobClient cloudBlobClient = sa.CreateCloudBlobClient();
                CloudBlobContainer Container = cloudBlobClient.GetContainerReference("files");
                Container.CreateIfNotExists();
                CloudBlockBlob b = Container.GetBlockBlobReference(filename);
                b.DeleteIfExists();

            }
            String sql = "DELETE FROM booklist WHERE title='" + TextBox1.Text.Trim() + "'";
            SqlCommand cmd3 = new SqlCommand(sql, scon);
            cmd3.ExecuteNonQuery();
            TextBox1.Text ="";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Label4.Text = "Deleted Successfully.";
            cmd3.Dispose();
            scon.Close();
            Grpp();


        }

        protected void dd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dd.SelectedValue == "g")
            {
                FileUpload1.Visible = false;
                TextBox4.Visible = true;
            }
            else
                FileUpload1.Visible = true;
            TextBox4.Visible = false;
            Page_Load( sender,e);
        }

           }
}