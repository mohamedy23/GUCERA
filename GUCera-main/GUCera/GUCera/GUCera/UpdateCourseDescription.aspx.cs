using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
	public partial class UpdateCourseDescription : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            error.ForeColor = System.Drawing.Color.Red;
        }
        protected void goHomePage(object sender, EventArgs e)
        {
            Response.Redirect("Instructor.aspx");
        }

        protected void updateDescription(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);


                int id = Int16.Parse(Session["user"].ToString());
                int cId = Int16.Parse(CourseIDtoUpdate2.Text);
                String Description = CourseDescription.Text;



                SqlCommand cmd = new SqlCommand("UpdateCourseDescription", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@instrId", id));
                cmd.Parameters.Add(new SqlParameter("@courseId", cId));
                cmd.Parameters.Add(new SqlParameter("@courseDescription", Description));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "0")
                {
                    error.ForeColor = System.Drawing.Color.Green;
                    error.Text="Description Updated Successfully";
                }
                else if (success.Value.ToString() == "1")
                {
                    error.Text="Course Is Not In GUCera";
                }
                else if (success.Value.ToString() == "2")
                {
                    error.Text="You do not teach this course";
                }
                else
                {
                    error.Text=("course has not accepted yet");
                }
            }
            catch 
            {
                error.Text="Invalid Data";
                ;
            }

        }
    }
}