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
    public partial class viewProfile : System.Web.UI.Page
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

            SqlCommand viewProfile = new SqlCommand("viewMyProfile", conn);
            viewProfile.CommandType = CommandType.StoredProcedure;


            viewProfile.Parameters.Add(new SqlParameter("@id", Session["user"]));

            conn.Open();
            SqlDataReader rdr = viewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {


                if (Session["user"].ToString() == (rdr.GetInt32(rdr.GetOrdinal("id"))).ToString())
                {


                    fname.Text = rdr.GetString(rdr.GetOrdinal("firstname"));
                    lname.Text = rdr.GetString(rdr.GetOrdinal("lastname"));
                    pass.Text = rdr.GetString(rdr.GetOrdinal("password"));
                    

                    Byte[] gender = (Byte[])rdr.GetSqlBinary(rdr.GetOrdinal("gender"));
                    if (gender[0] == 1) lblgender.Text = "Male";
                    else if (gender[0] == 0) lblgender.Text ="Female";

                    mail.Text= rdr.GetString(rdr.GetOrdinal("email"));
                    
                    address.Text = rdr.GetString(rdr.GetOrdinal("address"));


                }
            }


        }

        protected void profileEventMethod(object sender, EventArgs e)
        {




        }

        protected void backbtn(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
    }
}
