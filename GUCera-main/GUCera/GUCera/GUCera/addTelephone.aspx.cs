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
    public partial class addTelephone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void addtelephone(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            String telephone = telephoneTextBox.Text;
                if (telephone.Length > 11)
                {
                    msg.Text = "Number Of digits >11 digits";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                SqlCommand addTelephone = new SqlCommand("addMobile", conn);

            addTelephone.Parameters.Add(new SqlParameter("@ID", Session["user"]));
            addTelephone.Parameters.Add(new SqlParameter("@mobile_number", telephone));

            addTelephone.CommandType = CommandType.StoredProcedure;

                conn.Open();
                addTelephone.ExecuteNonQuery();
                msg.Text = "Phone number has been added successfully";
                msg.ForeColor = System.Drawing.Color.LightGreen;
                conn.Close();
            }
            catch
            {
                msg.Text = "Phone number has been added before <br/>  ";
                msg.ForeColor = System.Drawing.Color.DarkRed;
            }


        }

        protected void backbtn(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "2")
                Response.Redirect("Student.aspx");
            else if (Session["type"].ToString() == "0")
                Response.Redirect("Instructor.aspx");
            else
                Response.Redirect("HomePage.aspx");
        }
    }
}