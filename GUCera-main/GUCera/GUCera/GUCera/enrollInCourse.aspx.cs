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
    public partial class enrollInCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void enrollaction(object sender, EventArgs e)
        {
			try { 

            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

       
            int cid = Int16.Parse(courseIdTextBox.Text);
            int instrid = Int16.Parse(instructorIdTextBox.Text);

            SqlCommand enrollProc = new SqlCommand("enrollInCourse", conn);

            enrollProc.Parameters.Add(new SqlParameter("@sid", Session["user"]));
            enrollProc.Parameters.Add(new SqlParameter("@cid", cid));
            enrollProc.Parameters.Add(new SqlParameter("@instr", instrid));

            SqlParameter flag = enrollProc.Parameters.Add("@falg", SqlDbType.Int);
            flag.Direction = ParameterDirection.Output;

            enrollProc.CommandType = CommandType.StoredProcedure;
                conn.Open();
                enrollProc.ExecuteNonQuery();
                if (flag.Value.ToString() == "2")
                {
                    msg.Text = "Y" + "OU ARE ALREADY ENROLLED IN THIS COURSE".ToLower();
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else if (flag.Value.ToString() == "1")
                {
                    msg.Text = "Y" + "OU MUST REGISTER FOR PREREQUISTIES FIRST".ToLower();
                    msg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    msg.Text = "You are successfully enrolled";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                conn.Close();
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