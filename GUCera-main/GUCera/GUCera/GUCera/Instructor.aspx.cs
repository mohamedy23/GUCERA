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
	public partial class Instructor : System.Web.UI.Page
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

			SqlCommand profile = new SqlCommand("ViewInstructorProfile", conn);
			profile.CommandType = System.Data.CommandType.StoredProcedure;
			profile.Parameters.Add(new SqlParameter("@instrId", Session["user"]));
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

		protected void InsAddCourse(object sender, EventArgs e)
		{
			Response.Redirect("AddCourse.aspx");
		}

		protected void InsDefineAssignments(object sender, EventArgs e)
		{
			Response.Redirect("DefineAssignment.aspx");
		}

		protected void InsViewAssignments(object sender, EventArgs e)
		{
			Response.Redirect("ViewAssignment.aspx");
		}

		protected void InsGradeAssignments(object sender, EventArgs e)
		{
			Response.Redirect("GradeAssignment.aspx");
		}

		protected void InsViewfeedback(object sender, EventArgs e)
		{
			Response.Redirect("ViewFeedback.aspx");
		}

		protected void InsIssueCertificate(object sender, EventArgs e)
		{
			Response.Redirect("IssueCertificate.aspx");
		}
		protected void updatecontent(object sender, EventArgs e)
		{
			Response.Redirect("UpdateCourseContent.aspx");
		}
		protected void updatedescription(object sender, EventArgs e)
		{
			Response.Redirect("UpdateCourseDescription.aspx");
		}

		protected void viewProfile(object sender, EventArgs e)
		{
			Response.Redirect("InstructorProfile.aspx");
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