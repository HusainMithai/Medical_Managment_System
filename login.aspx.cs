using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select Status from tbl_register where Email_Id=@eid and Password=@pass";
        SqlDataSource1.SelectParameters.Add("eid", txtEmail.Text);
        SqlDataSource1.SelectParameters.Add("pass", txtPass.Text);
        try
        {
            DataView dv =(DataView) SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
            {
                if (dv[0][0].ToString().Equals("Active"))
                {
                    Session["email"] = txtEmail.Text;
                    Session["error"] = "No";
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Session["error"] = "Yes";
                    Session["msg"] = "Your Account is Deactivated..Plz Contact Administator";
                }

            }
            else
            {
               
                Session["error"] = "Yes";
                Session["msg"] = "Invalid Email id or Password";

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