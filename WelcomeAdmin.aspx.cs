using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.IO;

namespace RestaurantFinder
{
    public partial class WelcomeAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            message.Visible = false;
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        private void InsertData()
        {
            HttpPostedFile postedFile = FileUpload.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);


            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                 || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("UploadData", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramName = new SqlParameter()
                    {
                        ParameterName = "@name",
                        Value = txtRestaurantName.Text
                    };
                    cmd.Parameters.Add(paramName);

                    SqlParameter paramlocation = new SqlParameter()
                    {
                        ParameterName = "@location",
                        Value = txtLocation.Text
                    };
                    cmd.Parameters.Add(paramlocation);

                    SqlParameter paramImageData = new SqlParameter()
                    {
                        ParameterName = "@logo",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramImageData);


                    SqlParameter paramdiscription = new SqlParameter()
                    {
                        ParameterName = "@discription",
                        Value = discription.Text
                    };
                    cmd.Parameters.Add(paramdiscription);
                    SqlParameter paramNewId = new SqlParameter()
                    {
                        ParameterName = "@id",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(paramNewId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    message.Visible = true;
                    message.ForeColor = System.Drawing.Color.Green;
                    message.Text = "Upload Successful. Your ID is" + cmd.Parameters["@id"].Value.ToString();
                }
            }
            else
            {
                message.Visible = true;
                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";

            }
        }
        private void DeleteEntry()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from restaurant_info where id = @id", con);
                cmd.Parameters.AddWithValue("@id",Convert.ToInt32(delId.Text));
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView2.DataSource = rdr;
                GridView2.DataBind();
            }
        }
        private void LoadData()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select * from restaurant_info", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView2.DataSource = rdr;
                GridView2.DataBind();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            LoadData();

            }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }
        private void redirect()
        {
            Response.Redirect("WelcomeAdmin.aspx");
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DeleteEntry();
            redirect();
        }

        protected void Button9_Click(object sender, EventArgs e)

        {

            InsertData();
        }
    }
}