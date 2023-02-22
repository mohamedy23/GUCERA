using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void List_Courses(object sender, EventArgs e)
        {
            Response.Redirect("All Courses.aspx");
        }

        protected void List_Not_Accepted_Courses(object sender, EventArgs e)
        {
            Response.Redirect("Not Accepted Courses.aspx");
        }

        protected void List_Requested_Courses(object sender, EventArgs e)
        {
            Response.Redirect("AcceptReject Courses.aspx");
        }

        protected void Create_Promo_Code(object sender, EventArgs e)
        {
            Response.Redirect("Create Promo Code.aspx");
        }

        protected void Issue_Promo_Code(object sender, EventArgs e)
        {
            Response.Redirect("Issue Promo Code.aspx");
        }

		protected void addMob(object sender, EventArgs e)
		{
            Response.Redirect("addTelephone.aspx");
		}

        protected void logout(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["type"] = null;
            Response.Redirect("login.aspx");
        }
    }
}