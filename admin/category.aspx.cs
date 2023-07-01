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
            if (Request["id"] != null)
            {
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.DeleteCommand = "Delete from tbl_category where Category_Id=@Id";
                SqlDataSource1.DeleteParameters.Add("Id", Request["id"].ToString());
                try
                {
                    int n = SqlDataSource1.Delete();
                    if (n > 0)
                    {
                        Session["msg"] = "Category is Deleted";
                    }
                    else
                    {
                        Session["msg"] = "Category is not Deleted";
                    }
                }
                catch (Exception ex)
                {

                    Session["msg"] = ex.Message;

                }
                SqlDataSource1.DeleteParameters.Clear();
            }

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select * from tbl_category order by Category_Id";
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                Repeater1.DataSource = dv.Table;
                Repeater1.DataBind();

            }
            catch (Exception ex)
            {
                
                Session["msg"] = ex.Message;

            }
            SqlDataSource1.SelectParameters.Clear();
        }
    }
}