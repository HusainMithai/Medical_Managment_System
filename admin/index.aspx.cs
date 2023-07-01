using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select * from tbl_admin where username=@uname and password=@pass";
        SqlDataSource1.SelectParameters.Add("uname", txtUsername.Text);
        SqlDataSource1.SelectParameters.Add("pass", txtPassword.Text);
        try
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
            {
                Session["uname"] = txtUsername.Text;
                Session["error"] = "No";
                Response.Redirect("dashboard.aspx");

            }
            else
            {

                Session["error"] = "Yes";
                Session["msg"] = "Invalid Username or Password";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.SelectParameters.Clear();
    }
}