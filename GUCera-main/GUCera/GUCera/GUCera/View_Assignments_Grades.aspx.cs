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
    public partial class View_Assignments_Grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            //message.Visible = false;
            //backButton.Visible = false; 
        }

    
        protected void ViewGrade_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewGrade = new SqlCommand("viewAssignGrades", conn);
            viewGrade.CommandType = CommandType.StoredProcedure;

            viewGrade.Parameters.Add(new SqlParameter("@assignnumber", AssNumber.Text));
            viewGrade.Parameters.Add(new SqlParameter("@assignType", AssignType.SelectedValue));
            viewGrade.Parameters.Add(new SqlParameter("@cid", CourseID.Text));
            viewGrade.Parameters.Add(new SqlParameter("@sid", Session["user"]));

            SqlParameter grade = viewGrade.Parameters.Add("@assignGrade", SqlDbType.Int);
            grade.Direction = ParameterDirection.Output;

                conn.Open();
                viewGrade.ExecuteNonQuery();
                conn.Close();
                if (grade.Value.ToString() != "")
                {
                    msg.Text = "Your Grade is " + grade.Value.ToString();
                    msg.ForeColor = System.Drawing.Color.Green;  
                }
                else

                {
                    msg.Text = "You Are Not Enrolled In The Course OR The Assignment Has No Grade Yet !";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch
            {
                msg.Text="Invaild data";
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
    }
}