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
    public partial class addCreditCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["type"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
        }

        protected void addCredit(object sender, EventArgs e)
        {
			try { 
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string number = numberTextBox.Text;
            string cardHolderName = cardHolderNameTextBox.Text;
            DateTime expirydate = Convert.ToDateTime(expiryDateTextBox.Text);
            string cvv = cvvTextBox.Text;
				if (number.Length > 15)
				{
                    msg.Text = "Number Of digits >15 digits";
                    msg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

            SqlCommand loginproc = new SqlCommand("addCreditCard", conn);

            loginproc.Parameters.Add(new SqlParameter("@sid", Session["user"]));
            loginproc.Parameters.Add(new SqlParameter("@number", number));
            loginproc.Parameters.Add(new SqlParameter("@cardHolderName", cardHolderName));
            loginproc.Parameters.Add(new SqlParameter("@expiryDate", expirydate));
            loginproc.Parameters.Add(new SqlParameter("@cvv", cvv));


            loginproc.CommandType = CommandType.StoredProcedure;
                conn.Open();
                loginproc.ExecuteNonQuery();
                conn.Close();
                msg.Text = "Credit card has been added successfully";
                msg.ForeColor = System.Drawing.Color.Green;
            }
            catch
            {
                msg.Text = "This credit card has been added before";
                msg.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void backbtn(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
    }
}