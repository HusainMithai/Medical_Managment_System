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
    protected void btnChange_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.UpdateCommand = "Update tbl_register set Password=@npass where Email_Id=@eid and Password=@opass";
        SqlDataSource1.UpdateParameters.Add("npass", txtNPass.Text);
        SqlDataSource1.UpdateParameters.Add("eid", Session["email"].ToString());
        SqlDataSource1.UpdateParameters.Add("opass", txtOPass.Text);
        try
        {
            int n = SqlDataSource1.Update();
            if (n > 0)
            {
                Session["error"] = "No";
                Session["msg"] = "Password is changed";
            }
            else
            {

                Session["error"] = "Yes";
                Session["msg"] = "Invalid Old Password";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.UpdateParameters.Clear();
    }
}