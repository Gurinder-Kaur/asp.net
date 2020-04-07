using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace RestaurantFinder
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool AuthenticateUser(string username, string password)
        {
            // ConfigurationManager class is in System.Configuration namespace
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            // SqlConnection is in System.Data.SqlClient namespace
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("AuthenticateAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // FormsAuthentication is in System.Web.Security
                
                // SqlParameter is in System.Data namespace
                SqlParameter paramUsername = new SqlParameter("@UserName", username);
                SqlParameter paramPassword = new SqlParameter("@pasword", password);

                cmd.Parameters.Add(paramUsername);
                cmd.Parameters.Add(paramPassword);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();
                return ReturnCode == 1;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(txtUserName.Text, txtPassword.Text))
            {
                Response.Redirect("WelcomeAdmin.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid User Name and/or Password";
            }
        } 
    }
}