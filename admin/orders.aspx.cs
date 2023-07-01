using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select * from tbl_orders order by Id desc";
            DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            Repeater1.DataSource = dv1.Table;
            Repeater1.DataBind();
            SqlDataSource1.SelectParameters.Clear();

            if (Request["ono"] != null)
            {
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_orderlist where order_no=@ono";
                SqlDataSource1.SelectParameters.Add("ono", Request["ono"]);
                DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                Repeater2.DataSource = dv2.Table;
                Repeater2.DataBind();
                SqlDataSource1.SelectParameters.Clear();

                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_shipping where order_no=@ono";
                SqlDataSource1.SelectParameters.Add("ono", Request["ono"]);
                DataView dv3 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                Repeater3.DataSource = dv3.Table;
                Repeater3.DataBind();
                SqlDataSource1.SelectParameters.Clear();

                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_bill where order_no=@ono";
                SqlDataSource1.SelectParameters.Add("ono", Request["ono"]);
                DataView dv4 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                Repeater4.DataSource = dv4.Table;
                Repeater4.DataBind();
                SqlDataSource1.SelectParameters.Clear();
            }
        }
    }
    
}