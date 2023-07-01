using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (Page.IsPostBack == false)
        {
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select * from tbl_category where Under_Group='Main' and Category_Name not in (select Under_Group from tbl_category) order by Category_Name ";
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                Repeater3.DataSource = dv.Table;
                Repeater3.DataBind();

            }
            catch (Exception ex)
            {

                Session["msg"] = ex.Message;

            }
            SqlDataSource1.SelectParameters.Clear();

            DataSet ds = new DataSet();

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select Category_Name,Category_id from tbl_category where Under_Group='Main' and Category_Name in (select Under_Group from tbl_category) order by Category_Name ";
            DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt1 = dv1.Table.Copy();
            dt1.TableName = "tab1";
            ds.Tables.Add(dt1);
            SqlDataSource1.SelectParameters.Clear();

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select Category_Name,Under_Group,Category_Id from tbl_category where Under_Group!='Main'";
            DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt2 = dv2.Table.Copy();
            dt2.TableName = "tab2";
            ds.Tables.Add(dt2);
            SqlDataSource1.SelectParameters.Clear();
            ds.Tables[0].Columns[0].ColumnName = "Category_Name";
            ds.Tables[1].Columns[0].ColumnName = "Category_Name";

            ds.Tables[0].Columns[1].ColumnName = "Category_Id";
            ds.Tables[1].Columns[2].ColumnName = "Category_Id";
            ds.Relations.Add(new DataRelation("CategoriesRelation", ds.Tables[0].Columns[0], ds.Tables[1].Columns[1]));
            Repeater1.DataSource = ds.Tables[0];
            Repeater1.DataBind();


            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select * from tbl_cart where user_email_id=@eid";

            SqlDataSource1.SelectParameters.Add("eid", Session["email"].ToString());
            DataView dv3 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            Literal1.Text = dv3.Count.ToString();


            SqlDataSource1.SelectParameters.Clear();
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataRowView drv = e.Item.DataItem as DataRowView;

            Repeater innerRep = e.Item.FindControl("Repeater2") as Repeater;

            innerRep.DataSource = drv.CreateChildView("CategoriesRelation");

            innerRep.DataBind();

        }
    }
}
