﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantFinder
{
    public partial class Welcome1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NearbyPlaces.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("googlemap.aspx");
        }
    }
}