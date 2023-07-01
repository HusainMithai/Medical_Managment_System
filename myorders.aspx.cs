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
        if (Page.IsPostBack == false)
        {
            getorder();
        }
    }
    void getorder()
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select * from tbl_orders where user_email_id=@eid";

        SqlDataSource1.SelectParameters.Add("eid", Session["email"].ToString());
        DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        Repeater1.DataSource = dv1.Table;
        Repeater1.DataBind();
        SqlDataSource1.SelectParameters.Clear();

    }
}