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
	public partial class GradeAssignment : System.Web.UI.Page
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

		protected void HomePage(object sender, EventArgs e)
		{
			Response.Redirect("Instructor.aspx");
		}


		protected void GradeAssignmentToStudent(object sender, EventArgs e)
		{
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);


                int idIns = Int16.Parse(Session["user"].ToString());
                int idcourse = Int16.Parse(CourseIDtoGrade.Text);
                int assignmentNumber = Int16.Parse(AssignmentNumberToGrade.Text);

                int studentID = Int16.Parse(StudentIDtoGrade.Text);
                decimal gradeofStudent;
                if(!decimal.TryParse(gradeTostudent.Text,out gradeofStudent) || gradeofStudent < 0 || gradeofStudent > 100)
				{
                    error.Text="Invalid Grade , Grade has to be between 0 and 100";
                    return;
				}
                String typeOfAssign = "Assignment";
                if (typeAssignment.Text=="Quiz")
                {
                    typeOfAssign = "Quiz";
                }
                else if (typeAssignment.Text == "Exam")
                {
                    typeOfAssign = "Exam";
                }
                else if (typeAssignment.Text == "Project")
                {
                    typeOfAssign = "Project"; ;
                }
                else
                {
                    error.Text="Please Choose The Type";
                    return;
                }



                SqlCommand cmd = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@instrId", idIns));
                cmd.Parameters.Add(new SqlParameter("@cid", idcourse));
                cmd.Parameters.Add(new SqlParameter("@assignmentNumber", assignmentNumber));
                cmd.Parameters.Add(new SqlParameter("@sid", studentID));
                cmd.Parameters.Add(new SqlParameter("@grade", gradeofStudent));
                cmd.Parameters.Add(new SqlParameter("@type", typeOfAssign));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;




                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "0")
                {
                    error.ForeColor = System.Drawing.Color.Green;
                    error.Text="Assignment Graded Successfully";
                }
                else if (success.Value.ToString() == "1")
                {
                    error.Text="Course Is Not In GUCera";
                }
                else if (success.Value.ToString() == "2")
                {
                    error.Text="You do not teach this course";
                }
                else if (success.Value.ToString() == "3")
                {
                    error.Text="course have not accepted yet";
                }
                else if(success.Value.ToString() == "4")
                {
                    error.Text="This Assignment is not in the course";
                }
                else if(success.Value.ToString() == "5")
				{
                    error.Text="Student do not take this course";
                }
				else
				{
                    error.Text="Student do not submit this Assignment";
                }
            }
            catch 
            {
                error.Text="Invalid Data";
            }
        }
	}
}