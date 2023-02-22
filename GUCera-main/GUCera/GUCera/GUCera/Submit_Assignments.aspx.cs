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
    public partial class Submit_Assignments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //  msg.Visible = false;
            // BackButton.Visible = false; 
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand submitAss = new SqlCommand("submitAssign", conn);
            submitAss.CommandType = CommandType.StoredProcedure;

            submitAss.Parameters.Add(new SqlParameter("@assignType", AssignType.SelectedValue));
            submitAss.Parameters.Add(new SqlParameter("@assignnumber", AssNumber.Text));
            submitAss.Parameters.Add(new SqlParameter("@sid", Session["user"]));
            submitAss.Parameters.Add(new SqlParameter("@cid", CourseID.Text));


            SqlParameter Success = submitAss.Parameters.Add("@success", SqlDbType.Int);
            Success.Direction = ParameterDirection.Output;

                conn.Open();
                submitAss.ExecuteNonQuery();
                conn.Close();
                if (Success.Value.ToString() == "1")
                {
                    msg.Text = "Assignmet has been submitted successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                    
                    
                }
                else
                {
                    msg.Text = "You are not enrolled in the course" ;
                    msg.ForeColor = System.Drawing.Color.Red;
                    
                 }
                 
            }
            catch
            {

                msg.Text = "Invalid data";
                msg.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
    }
}