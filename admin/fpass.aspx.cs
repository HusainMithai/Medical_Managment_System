using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;


public partial class admin_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select * from tbl_admin where emailid=@eid";
        SqlDataSource1.SelectParameters.Add("eid", txtEmail.Text);
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
            {
                Session["error"] = "No";

                var fromAddress = new MailAddress("myeshopper2021@gmail.com", "Eshopper System");
                var toAddress = new MailAddress(txtEmail.Text, dv[0][0].ToString());
                const string fromPassword = "eshopper2021";
                const string subject = "Password Recovery";
                string body = "Your Password is " + dv[0][1].ToString();

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(message);
                    Session["msg"] = "Password is sent to your Registered Email Id, Also check Spam folder";
                }

            }
            else
            {

                Session["error"] = "Yes";
                Session["msg"] = "Invalid Email id";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.SelectParameters.Clear();

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}