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
    public partial class View_Assignments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            viewAss.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewAssignments = new SqlCommand("viewAssign", conn);
            viewAssignments.CommandType = System.Data.CommandType.StoredProcedure;
            viewAssignments.Parameters.Add(new SqlParameter("@courseId", courseID.Text));
            viewAssignments.Parameters.Add(new SqlParameter("@Sid", Session["user"]));
            SqlParameter success = viewAssignments.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output; 
            DataTable ass = new DataTable();
            ass.Columns.Add("Course ID");
            ass.Columns.Add("Assignment Number");
            ass.Columns.Add("Type");
            ass.Columns.Add("Full Grade");
            ass.Columns.Add("Weight");
            ass.Columns.Add("Deadline");
            ass.Columns.Add("Content");

                conn.Open();
                SqlDataReader rdr = viewAssignments.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    DataRow dR = ass.NewRow();
                    dR["Course ID"] = rdr["cid"];
                    dR["Assignment Number"] = rdr["number"];
                    dR["Type"] = rdr["type"];
                    dR["Full Grade"] = rdr["fullgrade"];
                    dR["Weight"] = rdr["weight"];
                    dR["Deadline"] = rdr["deadline"];
                    dR["Content"] = rdr["content"];
                    ass.Rows.Add(dR);


                }

                viewAss.DataSource = ass;
                viewAss.DataBind();
                if (viewAss.Rows.Count == 0)
                {
                    msg.Text = "You are not enrolled in the course or  no assignments has been added yet";
                    msg.ForeColor = System.Drawing.Color.Red;
                    
                }
                else
                {
                    
                    viewAss.Visible = true;
                    this.assginmentbox.Style.Add("background-color", "transparent");
                    tobehidden.Visible = false;
                    Button1.Visible = true;
                    Button2.Visible = true;
                    img.Visible = false;
                    welcome.Visible = false;
                }
               
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

        protected void another(object sender, EventArgs e)
        {
            viewAss.Visible = false;
            assginmentbox.Style.Add("background-color", "rgba(0,0,0,0.5)");
            tobehidden.Visible = true;
            Button1.Visible = false;
            Button2.Visible = false;
            img.Visible = true;
            welcome.Visible = true;
            courseID.Text = "";
        }
    }
}