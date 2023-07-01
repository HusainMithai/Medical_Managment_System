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
                SqlDataSource1.SelectCommand = "Select * from tbl_category where Category_Id=@Id";
                SqlDataSource1.SelectParameters.Add("Id", Request["id"].ToString());
                try
                {
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count > 0)
                    {
                        txtId.Text = dv[0][0].ToString();
                        txtcname.Text = dv[0][1].ToString();
                        txtunder.Text = dv[0][2].ToString();

                    }
                    else
                    {
                        txtId.Text = "0";
                    }

                }
                catch (Exception ex)
                {

                    Session["msg"] = ex.Message;

                }
                SqlDataSource1.SelectParameters.Clear();
            }
            else
            {
                txtId.Text = "0";
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        if (int.Parse(txtId.Text) == 0)
        {
            SqlDataSource1.InsertCommand = "insert into tbl_category(Category_Name,Under_Group) values(@Name,@Under)";
            SqlDataSource1.InsertParameters.Add("Name", txtcname.Text);
            SqlDataSource1.InsertParameters.Add("Under", txtunder.Text);
            try
            {
                int n = SqlDataSource1.Insert();
                if (n > 0)
                {
                    Session["msg"] = "Category is Added";
                    txtcname.Text = "";
                    txtunder.Text = "";

                }
                else
                {
                    Session["msg"] = "Category is Not Added";

                }

            }
            catch (Exception ex)
            {
                Session["msg"] = ex.Message;

            }
            SqlDataSource1.InsertParameters.Clear();
        }
        else
        {
            SqlDataSource1.UpdateCommand = "update tbl_category set Category_Name=@cname,Under_Group=@under where Category_Id=@id";
            SqlDataSource1.UpdateParameters.Add("cname", txtcname.Text);
            SqlDataSource1.UpdateParameters.Add("under", txtunder.Text);
            SqlDataSource1.UpdateParameters.Add("id", txtId.Text);
            try
            {
                int n = SqlDataSource1.Update();
                if (n > 0)
                {
                    Session["msg"] = "Category is Updated";
                    txtcname.Text = "";
                    txtunder.Text = "";
                    txtId.Text = "0";
                }
                else
                {
                    Session["msg"] = "Category is Not Updated";

                }

            }
            catch (Exception ex)
            {
                Session["msg"] = ex.Message;

            }
            SqlDataSource1.UpdateParameters.Clear();
        }
    }
    protected void btnList_Click(object sender, EventArgs e)
    {
        Response.Redirect("category.aspx");
    }
}