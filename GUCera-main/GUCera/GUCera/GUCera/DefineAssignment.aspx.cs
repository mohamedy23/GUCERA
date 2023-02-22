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
	public partial class DefineAssignment : System.Web.UI.Page
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

		protected void HomePageDefine(object sender, EventArgs e)
		{
            Response.Redirect("Instructor.aspx");
		}

		protected void DefineTheAssignment(object sender, EventArgs e)
		{
           try
            {
                string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);


                int idIns = Int16.Parse(Session["user"].ToString());
                int idcourse = Int16.Parse(CourseIDtoDefine.Text);
                int assignmentNumber = Int16.Parse(AssignmentNumberToDefine.Text);
        
                int AssignemtFullGrade = Int16.Parse(AssignmentfullGradeToDefine.Text);
                decimal AssignmentWeight ;
                if(!decimal.TryParse(AssignmentWeightToDefine.Text,out AssignmentWeight) || AssignmentWeight < 0 || AssignmentWeight > 100)
				{
                    error.Text="Invalid Weight for Assignment , Weight has to be between 0-100";
                    return;
				}
                string AssignmentContent = AssignmentContentToDefine.Text;
                DateTime AssignmentDeadline ;
                if(!DateTime.TryParse(AssignmentDeadlineToDefine.Text,out AssignmentDeadline) || AssignmentDeadline.AddDays(1) < DateTime.Now)
				{
                    error.Text="Deadline has to be not befor today";
                    return;
				}
                String typeOfAssign = "quiz";
				if (typeAssignment.SelectedValue=="Quiz")
				{
                    typeOfAssign = "quiz";
                }
                else if (typeAssignment.SelectedValue=="Project")
                {
                   typeOfAssign="Project";
                }
                else if (typeAssignment.SelectedValue=="Exam")
                {
                    typeOfAssign = "Exam"; ;
                }
                else
                {
                    error.Text="Please Choose The Type";
                    return;
                }


                SqlCommand cmd = new SqlCommand("DefineAssignmentOfCourseOfCertianType", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@instId", idIns));
                cmd.Parameters.Add(new SqlParameter("@cid", idcourse));
                cmd.Parameters.Add(new SqlParameter("@number", assignmentNumber));
                cmd.Parameters.Add(new SqlParameter("@content", AssignmentContent));
                cmd.Parameters.Add(new SqlParameter("@fullGrade", AssignemtFullGrade));
                cmd.Parameters.Add(new SqlParameter("@weight", AssignmentWeight));
                cmd.Parameters.Add(new SqlParameter("@deadline", AssignmentDeadline));
                cmd.Parameters.Add(new SqlParameter("@type", typeOfAssign));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;



                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "0")
                {
                    error.ForeColor = System.Drawing.Color.Green;
                    error.Text="Assignment Added Successfully";
                }
                else if (success.Value.ToString() == "1")
                {
                    error.Text="Course Is Not In GUCera";
                }
                else if (success.Value.ToString() == "2")
                {
                    error.Text="You do not teach this course";
                }
                else if(success.Value.ToString() == "3")
                {
                    error.Text="course have not accepted yet";
                }
				else
				{
                   error.Text="This Assignment is aleady in the Course";
                }
            }
            catch 
           {
                error.Text="Invalid Data";
            }
        }
	}
}