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
    public partial class future : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
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
    }
}