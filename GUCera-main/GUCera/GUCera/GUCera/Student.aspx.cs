using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand profile = new SqlCommand("viewMyProfile", conn);
            profile.CommandType = System.Data.CommandType.StoredProcedure;
            profile.Parameters.Add(new SqlParameter("@id", Session["user"]));
            try
            {
                conn.Open();
                SqlDataReader rdr = profile.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    Label1.Text += rdr["firstName"].ToString().ToUpper();
                }
            }
            catch
            {

            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Assignments.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Submit_Assignments.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Assignments_Grades.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Feedback.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Certificates.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProfile.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("courses.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("enrollInCourse.aspx");
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCreditCard.aspx");
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("addTelephone.aspx");
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewPromoCode.aspx");
        }

        protected void logOut(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["type"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}