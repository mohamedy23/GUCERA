using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = System.Drawing.Image;

namespace GUCera
{
	public partial class IssueCertificate : System.Web.UI.Page
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

		protected void issueCer(object sender, EventArgs e)
		{
           /// try
            {
                string connStr = ConfigurationManager.ConnectionStrings["GUCera"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);


                int idIns = Int16.Parse(Session["user"].ToString());
                int idcourse = Int16.Parse(CourseIDtoIssue.Text);
                int studentID = Int16.Parse(StudentIDtoIssue.Text);
                DateTime issueDateCer ;
                if(!DateTime.TryParse(IssueDate.Text,out issueDateCer) || issueDateCer.AddDays(1) < DateTime.Now)
				{
                    error.Text=" Issue Date has to be  not befor today";
                    return;
				}
                string tempdate=issueDateCer.Day.ToString()+"-"+issueDateCer.Month.ToString()+"-" +issueDateCer.Year.ToString();
              



                SqlCommand cmd = new SqlCommand("InstructorIssueCertificateToStudent", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@insId", idIns));
                cmd.Parameters.Add(new SqlParameter("@cid", idcourse));
                cmd.Parameters.Add(new SqlParameter("@sid", studentID));
                cmd.Parameters.Add(new SqlParameter("@issueDate", issueDateCer));

                SqlCommand cmdTemp = new SqlCommand("calculateFinalGrade", conn);
                cmdTemp.CommandType = CommandType.StoredProcedure;

                cmdTemp.Parameters.Add(new SqlParameter("@insId", idIns));
                cmdTemp.Parameters.Add(new SqlParameter("@cid", idcourse));
                cmdTemp.Parameters.Add(new SqlParameter("@sid", studentID));
                SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn.Open();
                cmdTemp.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
                
                conn.Close();
                if (success.Value.ToString() == "0")
                {
                    error.ForeColor = System.Drawing.Color.Green;
                    error.Text="Certificate Issued Successfully to The student";
                    
                    dataToPrint(studentID, idcourse, tempdate);
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
                else if (success.Value.ToString() == "4")
                {
                    error.Text="Student do not take this course";
                }
                else if(success.Value.ToString() == "5")
                {
                    error.Text="Student do not pass this course";
                }
				else
				{
                    error.Text = "Student already has this Certificate";
                }
            }
            //catch
           // {
            ///   error.Text="Invalid Data";
          //  }
        }

		protected void HomePage(object sender, EventArgs e)
		{
            Response.Redirect("Instructor.aspx");
		}
        private void dataToPrint(int sid,int cid , string date)
		{
            string name="";
            string ins="";
            string courseName="";
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand profile = new SqlCommand("viewMyProfile", conn);
            profile.CommandType = System.Data.CommandType.StoredProcedure;
            profile.Parameters.Add(new SqlParameter("@id", sid));
                conn.Open();
                SqlDataReader rdr = profile.ExecuteReader();
                while (rdr.Read())
                {
                   name= rdr["firstName"].ToString() + " " + rdr["lastName"].ToString();
                }
            conn.Close();
            conn.Open();
            SqlCommand insPro = new SqlCommand("ViewInstructorProfile", conn);
            insPro.CommandType = System.Data.CommandType.StoredProcedure;
            insPro.Parameters.Add(new SqlParameter("@instrId", Session["user"]));
            SqlDataReader rdr2 = insPro.ExecuteReader();
            while (rdr2.Read())
            {
                ins = rdr2["firstName"].ToString();
            }
            conn.Close();
            conn.Open();

            SqlCommand cname = new SqlCommand("AdminViewCourseDetails", conn);
            cname.CommandType = System.Data.CommandType.StoredProcedure;
            cname.Parameters.Add(new SqlParameter("@courseId", cid));

            SqlDataReader rdr3 = cname.ExecuteReader();
            while (rdr3.Read())
            {
                courseName = rdr3["name"].ToString();
            }
            conn.Close();
            Response.Write(date);

            print(name,date, ins, courseName, sid, cid);



        }


        private void print(String name,string date,string ins, string course ,int sid,int cid)
		{
            using (Image b = (System.Drawing.Image)Bitmap.FromFile(Server.MapPath("Stock/Guceracertificate.jpg")))
            {
                using (Graphics g = Graphics.FromImage(b))
                {
                    StringFormat stringformat = new StringFormat();
                    stringformat.Alignment = StringAlignment.Center;
                    stringformat.LineAlignment = StringAlignment.Center;



                    Color StringColor = System.Drawing.ColorTranslator.FromHtml("#000000");//direct color adding    

                    string Str_TextOnImage = name;//Your Text On Image    
                    string Str_TextOnImage2 ="Completing Course "+ course;//Your Text On Image    
                    string Str_sign = ins;
                    string Str_date = date;

                    g.DrawString(Str_TextOnImage, new Font("Informal Roman", 40,
                    FontStyle.Regular), new SolidBrush(StringColor), new Point(500, 430),
                   stringformat);

                    g.DrawString(Str_TextOnImage2, new Font("Informal Roman", 40,
                    FontStyle.Bold), new SolidBrush(StringColor), new Point(500, 280),
                    stringformat);

                    g.DrawString(Str_sign, new Font("Magneto", 25,
                    FontStyle.Bold), new SolidBrush(StringColor), new Point(730, 510),
                    stringformat);

                    g.DrawString(Str_date, new Font("Informal Roman", 40,
                    FontStyle.Bold), new SolidBrush(StringColor), new Point(280, 500),
                    stringformat);
                    
                }
                string projectDir = Path.GetFullPath(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\.."));
                String full = @"\DB\GUCera\GUCera\Certificates\"+ sid + cid+".png";
                b.Save((projectDir + full));
                //	Image1.ImageUrl = "Stock/cer3.png";
                ///File.Delete(@"C:\Users\Ahmed Ramadan\Desktop\DB\GUCera\GUCera\Stock\cer3.png");
            }
        }
	}
}