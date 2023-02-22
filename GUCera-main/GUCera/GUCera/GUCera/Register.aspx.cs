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
    public partial class Register : System.Web.UI.Page
    {
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

        

        

        protected void registerButton_Click(object sender, EventArgs e)
        {
            try
            {


                if (ddlGender.SelectedValue == "-1")
                {
                    Response.Write("PLEASE SELECT YOUR GENDER" + "<br/>");
                }

                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                string first_name = fname.Text;
                string last_name = lname.Text;
                string password = regPassword.Text;
                string email = mail.Text;
                string address = Regaddress.Text;

                SqlCommand StudentReg = new SqlCommand("studentRegister", conn);
                SqlCommand InstructortReg = new SqlCommand("InstructorRegister", conn);

                StudentReg.CommandType = System.Data.CommandType.StoredProcedure;
                InstructortReg.CommandType = System.Data.CommandType.StoredProcedure;

                if (ddlInstructorStudent.SelectedItem.Value == "Student")
                {

                    StudentReg.Parameters.Add(new SqlParameter("@first_name", first_name));
                    StudentReg.Parameters.Add(new SqlParameter("@last_name", last_name));
                    StudentReg.Parameters.Add(new SqlParameter("@password", password));
                    StudentReg.Parameters.Add(new SqlParameter("@email", email));
                    StudentReg.Parameters.Add(new SqlParameter("@address", address));
                    if (ddlGender.SelectedValue == "Male")
                    {
                        StudentReg.Parameters.Add(new SqlParameter("@gender", "1"));
                    }
                    else if (ddlGender.SelectedValue == "Female")
                    {
                        StudentReg.Parameters.Add(new SqlParameter("@gender", "0"));
                    }
                    conn.Open();
                    StudentReg.ExecuteNonQuery();
                    conn.Close();

                }
                else if (ddlInstructorStudent.SelectedValue == "Instructor")
                {
                    InstructortReg.Parameters.Add(new SqlParameter("@first_name", first_name));
                    InstructortReg.Parameters.Add(new SqlParameter("@last_name", last_name));
                    InstructortReg.Parameters.Add(new SqlParameter("@password", password));
                    InstructortReg.Parameters.Add(new SqlParameter("@email", email));
                    InstructortReg.Parameters.Add(new SqlParameter("@address", address));
                    if (ddlGender.SelectedValue == "Male")
                    {
                        InstructortReg.Parameters.Add(new SqlParameter("@gender", "1"));
                    }
                    else if (ddlGender.SelectedValue == "Female")
                    {
                        InstructortReg.Parameters.Add(new SqlParameter("@gender", "0"));
                    }
                    conn.Open();
                    InstructortReg.ExecuteNonQuery();
                    conn.Close();


                }
                Response.Redirect("Login.aspx");
            }
			catch
			{
                msg.Text = "Invalid Data";
                msg.ForeColor = System.Drawing.Color.Red;
            }
   
       
        }
         

        

        

        

        protected void ddlInstructorStudent_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}