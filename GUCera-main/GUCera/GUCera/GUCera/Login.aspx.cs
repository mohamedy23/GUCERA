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
    public partial class Login : System.Web.UI.Page
    {
        public object WebConfigerationManager { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
			if (Session["user"] != null && Session["user"] != null)
			{
                if (Session["type"].ToString() == "2")
                    Response.Redirect("Student.aspx");
                else if (Session["type"].ToString() == "0")
                    Response.Redirect("Instructor.aspx");
                else
                    Response.Redirect("HomePage.aspx");
                return;
            }

        }

        protected void login(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int id = Int16.Parse(username.Text);
                string pass = password.Text;

                SqlCommand loginproc = new SqlCommand("userLogin", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add(new SqlParameter("@id", id));
                loginproc.Parameters.Add(new SqlParameter("@password", pass));


                SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);




                SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;
                type.Direction = ParameterDirection.Output;


                conn.Open();
                loginproc.ExecuteNonQuery();
                conn.Close();


                if (success.Value.ToString() == "1")
                {
                    Session["user"] = id;
                    Response.Write(type.Value.ToString());
                    if (type.Value.ToString() == "2")
                    {
                        Session["type"] = 2;
                        Response.Redirect("Student.aspx");
                    }
                    else if (type.Value.ToString() == "1")
                    {
                        Session["type"] = 1;
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        Session["type"] = 0;
                        Response.Redirect("Instructor.aspx");
                    }
                }
                else
                {
                    msg.Text = "Invalid id or password";
                    msg.ForeColor = System.Drawing.Color.Red;
                }
            }
			catch
			{
                msg.Text = "Invalid Data";
                msg.ForeColor = System.Drawing.Color.Red;
            }
                
            


        }



        protected void register(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}