using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_contact(Name,Email,Subject,Message,ContactDate) values(@Name,@Email,@Subject,@Message,@ContactDate)";
        SqlDataSource1.InsertParameters.Add("Name", txtname.Text);
        SqlDataSource1.InsertParameters.Add("Email", txtemail.Text);
        SqlDataSource1.InsertParameters.Add("Subject", txtsub.Text);
        SqlDataSource1.InsertParameters.Add("Message", txtmsg.Text);
        SqlDataSource1.InsertParameters.Add("ContactDate", DateTime.Now.ToString("dd-MM-yyyy HH:mm"));
        
        try
        {
            int n = SqlDataSource1.Insert();
            if (n > 0)
            {
                Session["error"] = "No";
                Session["msg"] = "Message Sent";

            }
            else
            {
                Session["error"] = "Yes";
                Session["msg"] = "Message Failed";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.InsertParameters.Clear();
    }
}