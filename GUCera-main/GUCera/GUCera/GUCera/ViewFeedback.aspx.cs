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
	public partial class ViewFeedback : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["user"] == null || Session["type"] == null)
			{
				Response.Redirect("login.aspx");
				return;
			}
			error.ForeColor = System.Drawing.Color.Red;
			tobehidden2.Visible = false;
			
		}

		protected void viewFeed(object sender, EventArgs e)
		{
			
			try
			{
				string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

				//create a new connection
				SqlConnection conn = new SqlConnection(connStr);

				int idIns = Int16.Parse(Session["user"].ToString());
				int idcourse = Int16.Parse(CourseIDtoView.Text);

				SqlCommand cmd = new SqlCommand("ViewFeedbacksAddedByStudentsOnMyCourse", conn);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new SqlParameter("@instrId ", idIns));
				cmd.Parameters.Add(new SqlParameter("@cid", idcourse));
				SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
				success.Direction = ParameterDirection.Output;

				conn.Open();
				cmd.ExecuteNonQuery();
				DataTable dt = new DataTable();
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				da.Fill(dt);
				GridView1.DataSource = dt;
				GridView1.DataBind();

				conn.Close();

				if (success.Value.ToString() == "0")
				{

					tobehidden.Visible = false;
					tobehidden2.Visible = true;
					
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
					error.Text="course have not accepted yet";
				}
			}
			catch
			{
				error.Text="Invalid Data";
			}
		}

		protected void HomePage(object sender, EventArgs e)
		{
			Response.Redirect("Instructor.aspx");

		}
		protected void next(object sender, EventArgs e)
		{
		
			tobehidden.Visible = true;
			tobehidden2.Visible = false;
			CourseIDtoView.Text = "";
		}
		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.Header)
			{
				e.Row.Cells[0].Text = "Feedback Number";
				e.Row.Cells[1].Text = "The Comment";
				e.Row.Cells[2].Text = "Number of Likes";
			}
		}
	}
}