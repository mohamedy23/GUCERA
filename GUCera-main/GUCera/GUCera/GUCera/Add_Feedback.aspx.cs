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
    public partial class Add_Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            //  message.Visible = false;
            // BackButton.Visible = false; 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand addFeedback = new SqlCommand("addFeedback", conn);
            addFeedback.CommandType = CommandType.StoredProcedure;

            addFeedback.Parameters.Add(new SqlParameter("@comment", Feedback.Text));
            addFeedback.Parameters.Add(new SqlParameter("@cid", CourseID.Text));
            addFeedback.Parameters.Add(new SqlParameter("@sid", Session["user"]));

            SqlParameter success = addFeedback.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


                conn.Open();
                addFeedback.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "1")
                {
                    msg.Text = "Your feedback has been submitted successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    msg.Text = "You are not enrolled in this course";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                Button1.Visible = false;
            }
            catch
            {
                msg.Text = "Invalid data";
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void backbtn(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
    }
}