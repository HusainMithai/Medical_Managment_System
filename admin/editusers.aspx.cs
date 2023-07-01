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
                SqlDataSource1.SelectCommand = "Select * from tbl_register where Id=@Id";
                SqlDataSource1.SelectParameters.Add("Id", Request["id"].ToString());
                try
                {
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count > 0)
                    {
                        txtuid.Text = dv[0][0].ToString();
                        txtName.Text = dv[0][1].ToString();
                        txtGender.Text = dv[0][2].ToString();
                        txtMno.Text = dv[0][3].ToString();
                        txtAddress.Text = dv[0][4].ToString()+","+dv[0][5].ToString()+","+dv[0][6].ToString()+","+dv[0][7].ToString();
                        txtEmail.Text = dv[0][8].ToString();
                        for (int i = 0; i < dv.Count; i++)
                        {
                            ddlActivate.Items[i].Selected = false;
                        }
                        for (int i = 0; i < dv.Count; i++)
                        {
                            if(ddlActivate.Items[i].Text.Equals(dv[0][9].ToString()))
                            {
                                ddlActivate.Items[i].Selected = true;
                                break;
                            }
                        }
                    }
                    else
                    {
                        txtuid.Text = "0";
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
                txtuid.Text = "0";
            }
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        if (int.Parse(txtuid.Text) != 0)
        {
            
            SqlDataSource1.UpdateCommand = "update tbl_register set Status=@status where Id=@id";
            SqlDataSource1.UpdateParameters.Add("status", ddlActivate.SelectedValue);
            SqlDataSource1.UpdateParameters.Add("id", txtuid.Text);
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
        Response.Redirect("users.aspx");
    }
}