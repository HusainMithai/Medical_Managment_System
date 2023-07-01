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
            DataTable dt;
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select category_name,count(*) as 'noimgs' from tbl_category,tbl_products where tbl_category.category_id=tbl_products.category_id group by category_name";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            dt = dv.Table;
            SqlDataSource1.SelectParameters.Clear();

            dt.Columns.Add(new DataColumn("photo"));

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlDataSource1.SelectCommand = "Select photo from tbl_category,tbl_products where tbl_category.category_id=tbl_products.category_id and category_name=@cat";
                SqlDataSource1.SelectParameters.Add("cat", dt.Rows[i][0].ToString());
                DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                dt.Rows[i][2] = dv1[0][0].ToString();
                SqlDataSource1.SelectParameters.Clear();
            }
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            

            
        }
    }
}