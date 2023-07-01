using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.UpdateCommand = "Update tbl_admin set Password=@npass where Username=@uname and Password=@opass";
        SqlDataSource1.UpdateParameters.Add("npass", txtNpass.Text);
        SqlDataSource1.UpdateParameters.Add("uname", Session["uname"].ToString());
        SqlDataSource1.UpdateParameters.Add("opass", txtOpass.Text);
        try
        {
            int n = SqlDataSource1.Update();
            if (n > 0)
            {
                Session["msg"] = "Password is changed";
            }
            else
            {
                Session["msg"] = "Invalid Old Password";

            }

        }
        catch (Exception ex)
        {
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.UpdateParameters.Clear();
    }
}