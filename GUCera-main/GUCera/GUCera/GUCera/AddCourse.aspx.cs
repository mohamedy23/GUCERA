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
	public partial class AddCourse : System.Web.UI.Page
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

		protected void InstAddCourse(object sender, EventArgs e)
		{
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);


                string name = CourseName.Text;
                int id = Int16.Parse(Session["user"].ToString());
                int credit = Int16.Parse(CourseCreditHours.Text);
                decimal price;
                if (!decimal.TryParse(CoursePrice.Text,out price)|| price<0||price>=10000)
				{
                    error.Text="Invalid Price";
                    return;
				}
                

                SqlCommand cmd = new SqlCommand("InstAddCourse", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@creditHours", credit));
                cmd.Parameters.Add(new SqlParameter("@name",name));
                cmd.Parameters.Add(new SqlParameter("@price", price));
                cmd.Parameters.Add(new SqlParameter("@instructorId", id));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "0")
                {
                    error.ForeColor = System.Drawing.Color.Green;
                    error.Text="Course Added successfully";
                }
				else
				{
                    error.Text = "This Course is In GUCera Choose different Name";
                }
            }
            catch 
            {
              error.Text="Invalid Data ";
           }
        }



	
	}
}