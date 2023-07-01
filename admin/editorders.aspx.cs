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
            if (Request["ono"] != null)
            {
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_orders where order_no=@ono";
                SqlDataSource1.SelectParameters.Add("ono", Request["ono"].ToString());
                try
                {
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count > 0)
                    {
                        txtono.Text = dv[0][2].ToString();
                        txtsubtotal.Text = dv[0][5].ToString();
                        txtshipping.Text = dv[0][6].ToString();
                        txttotal.Text = dv[0][7].ToString();
                        txttype.Text = dv[0][8].ToString();
                        for (int i = 0; i < dv.Count; i++)
                        {
                            ddlstatus.Items[i].Selected = false;
                        }
                        for (int i = 0; i < dv.Count; i++)
                        {
                            if (ddlstatus.Items[i].Text.Equals(dv[0][9].ToString()))
                            {
                                ddlstatus.Items[i].Selected = true;
                                break;
                            }
                        }
                    }
                    else
                    {
                        txtono.Text = "0";
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
                txtono.Text = "0";
            }
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        if (int.Parse(txtono.Text) != 0)
        {

            SqlDataSource1.UpdateCommand = "update tbl_orders set status=@status where order_no=@ono";
            SqlDataSource1.UpdateParameters.Add("status", ddlstatus.SelectedValue);
            SqlDataSource1.UpdateParameters.Add("ono", txtono.Text);
            try
            {
                int n = SqlDataSource1.Update();
                if (n > 0)
                {
                    Session["msg"] = "Status is Updated";

                }
                else
                {
                    Session["msg"] = "Status is Not Updated";

                }

            }
            catch (Exception ex)
            {
                Session["msg"] = ex.Message;

            }
            SqlDataSource1.UpdateParameters.Clear();
        }
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("orders.aspx");
    }
}