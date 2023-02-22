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
    public partial class AcceptReject_Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"]==null || Session["type"] == null)
			{
                Response.Redirect("login.aspx");
                return;
			}

        }
        protected void Accept_Reject(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int aid = (int)(Session["user"]);
            int cid = Int16.Parse(Cid.Text);

            SqlCommand AccRej = new SqlCommand("AdminAcceptRejectCourse", conn);
            AccRej.CommandType = CommandType.StoredProcedure;
            AccRej.Parameters.Add(new SqlParameter("@adminid", aid));
            AccRej.Parameters.Add(new SqlParameter("@courseId", cid));
            SqlParameter success = AccRej.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            
                conn.Open();
                AccRej.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "1")
                {
                    msg.Text = "Course has been accepted successfully";
                    msg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    msg.Text = "Course doesn't exist in the database";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
           }
            catch
            {
                msg.Text = "Invalid data";
                msg.ForeColor = System.Drawing.Color.Red;
            }
        }

		protected void Home(object sender, EventArgs e)
		{
                Response.Redirect("HomePage.aspx");
		}
	}
}