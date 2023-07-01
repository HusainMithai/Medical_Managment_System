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
            DataTable dt=new DataTable();
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select * from tbl_category where Under_Group='Main' order by Category_Id";
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                 dt = dv.Table;
                
                
            }
            catch (Exception ex)
            {

                Session["msg"] = ex.Message;

            }
            SqlDataSource1.SelectParameters.Clear();
            DataRow dr = dt.NewRow();
            dr[0] = 0;
            dr[1] = "Select";
            dr[2] = "Main";
            dt.Rows.InsertAt(dr, 0);

            ddlcname.DataSource = dt;
            ddlcname.DataTextField = "Category_Name";
            ddlcname.DataValueField = "Category_Id";
            ddlcname.DataBind();


            if (Request["id"] != null)
            {
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_products where product_id=@Id";
                SqlDataSource1.SelectParameters.Add("Id", Request["id"].ToString());
                try
                {
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    if (dv.Count > 0)
                    {
                        txtpid.Text = dv[0][0].ToString();
                        txtpname.Text = dv[0][1].ToString();
                        for (int i = 0; i < ddlcname.Items.Count; i++)
                        {
                            ddlcname.Items[i].Selected = false;
                        }
                        for (int i = 0; i < ddlcname.Items.Count; i++)
                        {
                            if (ddlcname.Items[i].Value.Equals(dv[0][2].ToString()))
                            {
                                ddlcname.Items[i].Selected = true;
                                ddlcname_SelectedIndexChanged(null, null);
                                break;
                            }
                        }
                        for (int i = 0; i < ddlscname.Items.Count; i++)
                        {
                            ddlscname.Items[i].Selected = false;
                        }
                        for (int i = 0; i < ddlscname.Items.Count; i++)
                        {
                            if (ddlscname.Items[i].Value.Equals(dv[0][3].ToString()))
                            {
                                ddlscname.Items[i].Selected = true;
                                break;
                            }
                        }
                        txtbname.Text = dv[0][4].ToString();
                        txtsdscr.Text = dv[0][5].ToString();
                        txtsizewght.Text = dv[0][6].ToString();
                        txtcolor.Text = dv[0][7].ToString();
                        txtoprice.Text = dv[0][8].ToString();
                        txtnprice.Text = dv[0][9].ToString();
                        txtdscr.Text = dv[0][10].ToString();
                        txtRealFileName.Text = dv[0][11].ToString();
                        txtRealFileName1.Text = dv[0][12].ToString();
                        txtRealFileName2.Text = dv[0][13].ToString();
                        txtRealFileName3.Text = dv[0][14].ToString();
                        Image1.ImageUrl = "~\\admin\\uploads\\" + txtRealFileName.Text;
                        Image1.Visible = true;
                        Image2.ImageUrl = "~\\admin\\uploads\\" + txtRealFileName1.Text;
                        Image2.Visible = true;
                        Image3.ImageUrl = "~\\admin\\uploads\\" + txtRealFileName2.Text;
                        Image3.Visible = true;
                        Image4.ImageUrl = "~\\admin\\uploads\\" + txtRealFileName3.Text;
                        Image4.Visible = true;
                    }
                    else
                    {
                        txtpid.Text = "0";
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
                txtpid.Text = "0";
            }
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
       
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        if (int.Parse(txtpid.Text) == 0)
        {
            SqlDataSource1.SelectCommand = "Select IDENT_CURRENT('tbl_products')+1";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    
                  
            if (fupAttachment.HasFile)
            {
                fupAttachment.SaveAs(Server.MapPath("uploads") + "\\" + dv[0][0].ToString() + "_1"+ fupAttachment.FileName.Substring(fupAttachment.FileName.LastIndexOf('.')));
            }
            if (fupAttachment1.HasFile)
            {
                fupAttachment1.SaveAs(Server.MapPath("uploads") + "\\" + dv[0][0].ToString() + "_2" + fupAttachment1.FileName.Substring(fupAttachment1.FileName.LastIndexOf('.')));
            }
            if (fupAttachment2.HasFile)
            {
                fupAttachment2.SaveAs(Server.MapPath("uploads") + "\\" + dv[0][0].ToString() + "_3" + fupAttachment2.FileName.Substring(fupAttachment2.FileName.LastIndexOf('.')));
            }
            if (fupAttachment3.HasFile)
            {
                fupAttachment3.SaveAs(Server.MapPath("uploads") + "\\" + dv[0][0].ToString() + "_4" + fupAttachment3.FileName.Substring(fupAttachment3.FileName.LastIndexOf('.')));
            }
            SqlDataSource1.InsertCommand = "insert into tbl_products(product_name,category_id,subcategory_id,company_name,generic_name,medicine_type,medicine_unit,old_price,new_price,descr,photo,photo1,photo2,photo3) values(@product_name,@category_id,@subcategory_id,@company_name,@generic_name,@medicine_type,@medicine_unit,@old_price,@new_price,@descr,@photo,@photo1,@photo2,@photo3)";
            SqlDataSource1.InsertParameters.Add("product_name", txtpname.Text);
            SqlDataSource1.InsertParameters.Add("category_id", ddlcname.SelectedValue);
            SqlDataSource1.InsertParameters.Add("subcategory_id", ddlscname.SelectedValue);
            SqlDataSource1.InsertParameters.Add("company_name", txtbname.Text);
            SqlDataSource1.InsertParameters.Add("generic_name", txtsdscr.Text);
            SqlDataSource1.InsertParameters.Add("medicine_type", txtsizewght.Text);
            SqlDataSource1.InsertParameters.Add("medicine_unit", txtcolor.Text);
            SqlDataSource1.InsertParameters.Add("old_price", txtoprice.Text);
            SqlDataSource1.InsertParameters.Add("new_price", txtnprice.Text);
            SqlDataSource1.InsertParameters.Add("descr", txtdscr.Text);
            SqlDataSource1.InsertParameters.Add("photo", dv[0][0].ToString() +"_1"+ fupAttachment.FileName.Substring(fupAttachment.FileName.LastIndexOf('.')));
            SqlDataSource1.InsertParameters.Add("photo1", dv[0][0].ToString() + "_2" + fupAttachment1.FileName.Substring(fupAttachment1.FileName.LastIndexOf('.')));
            SqlDataSource1.InsertParameters.Add("photo2", dv[0][0].ToString() + "_3" + fupAttachment2.FileName.Substring(fupAttachment2.FileName.LastIndexOf('.')));
            SqlDataSource1.InsertParameters.Add("photo3", dv[0][0].ToString() + "_4" + fupAttachment3.FileName.Substring(fupAttachment3.FileName.LastIndexOf('.')));


            try
            {
                int n = SqlDataSource1.Insert();
                if (n > 0)
                {
                    Session["msg"] = "Product is Added";
                    txtpid.Text = "0";
                    txtpname.Text = "";
                    ddlcname.SelectedIndex = 0;
                    ddlscname.SelectedIndex = 0;
                    txtbname.Text = "";
                    txtdscr.Text = "";
                    txtsizewght.Text = "";
                    txtcolor.Text = "";
                    txtoprice.Text = "";
                    txtnprice.Text = "";
                    txtsdscr.Text = "";
                    txtRealFileName.Text = "";
                    Image1.Visible = false;
                    txtRealFileName1.Text = "";
                    Image2.Visible = false;
                    txtRealFileName2.Text = "";
                    Image3.Visible = false;
                    txtRealFileName3.Text = "";
                    Image4.Visible = false;
                }
                else
                {
                    Session["msg"] = "Product is Not Added";

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
            if (fupAttachment.HasFile)
            {
                fupAttachment.SaveAs(Server.MapPath("uploads") + "\\" + txtpid.Text + "_1" + fupAttachment.FileName.Substring(fupAttachment.FileName.LastIndexOf('.')));
            }
            if (fupAttachment1.HasFile)
            {
                fupAttachment1.SaveAs(Server.MapPath("uploads") + "\\" + txtpid.Text + "_2" + fupAttachment1.FileName.Substring(fupAttachment1.FileName.LastIndexOf('.')));
            }
            if (fupAttachment2.HasFile)
            {
                fupAttachment2.SaveAs(Server.MapPath("uploads") + "\\" + txtpid.Text + "_3" + fupAttachment2.FileName.Substring(fupAttachment2.FileName.LastIndexOf('.')));
            }
            if (fupAttachment3.HasFile)
            {
                fupAttachment3.SaveAs(Server.MapPath("uploads") + "\\" + txtpid.Text + "_4" + fupAttachment3.FileName.Substring(fupAttachment3.FileName.LastIndexOf('.')));
            }
            SqlDataSource1.UpdateCommand = "update tbl_products set product_name=@product_name,category_id=@category_id,subcategory_id=@subcategory_id,company_name=@company_name,generic_name=@generic_name,medicine_type=@medicine_type,medicine_unit=@medicine_unit,old_price=@old_price,new_price=@new_price,descr=@descr,photo=@photo,photo1=@photo1,photo2=@photo2,photo3=@photo3 where product_id=@product_id";
            SqlDataSource1.UpdateParameters.Add("product_name", txtpname.Text);
            SqlDataSource1.UpdateParameters.Add("category_id", ddlcname.SelectedValue);
            SqlDataSource1.UpdateParameters.Add("subcategory_id", ddlscname.SelectedValue);
            SqlDataSource1.UpdateParameters.Add("company_name", txtbname.Text);
            SqlDataSource1.UpdateParameters.Add("generic_name", txtsdscr.Text);
            SqlDataSource1.UpdateParameters.Add("medicine_type", txtsizewght.Text);
            SqlDataSource1.UpdateParameters.Add("medicine_unit", txtcolor.Text);
            SqlDataSource1.UpdateParameters.Add("old_price", txtoprice.Text);
            SqlDataSource1.UpdateParameters.Add("new_price", txtnprice.Text);
            SqlDataSource1.UpdateParameters.Add("descr", txtdscr.Text);
            if (fupAttachment.HasFile)
            {
                SqlDataSource1.UpdateParameters.Add("photo", txtpid.Text + fupAttachment.FileName.Substring(fupAttachment.FileName.LastIndexOf('.')));
            }
            else
            {
                SqlDataSource1.UpdateParameters.Add("photo", txtRealFileName.Text);
            }

            if (fupAttachment1.HasFile)
            {
                SqlDataSource1.UpdateParameters.Add("photo1", txtpid.Text + fupAttachment1.FileName.Substring(fupAttachment1.FileName.LastIndexOf('.')));
            }
            else
            {
                SqlDataSource1.UpdateParameters.Add("photo1", txtRealFileName1.Text);
            }

            if (fupAttachment2.HasFile)
            {
                SqlDataSource1.UpdateParameters.Add("photo2", txtpid.Text + fupAttachment2.FileName.Substring(fupAttachment2.FileName.LastIndexOf('.')));
            }
            else
            {
                SqlDataSource1.UpdateParameters.Add("photo2", txtRealFileName2.Text);
            }

            if (fupAttachment3.HasFile)
            {
                SqlDataSource1.UpdateParameters.Add("photo3", txtpid.Text + fupAttachment3.FileName.Substring(fupAttachment3.FileName.LastIndexOf('.')));
            }
            else
            {
                SqlDataSource1.UpdateParameters.Add("photo3", txtRealFileName3.Text);
            }
            SqlDataSource1.UpdateParameters.Add("product_id", txtpid.Text);
            try
            {
                int n = SqlDataSource1.Update();
                if (n > 0)
                {
                    Session["msg"] = "Product is Updated";
                    txtpid.Text = "0";
                    txtpname.Text = "";
                    ddlcname.SelectedIndex = 0;
                    ddlscname.SelectedIndex = 0;
                    txtbname.Text = "";
                    txtsdscr.Text = "";
                    txtsizewght.Text = "";
                    txtcolor.Text = "";
                    txtoprice.Text = "";
                    txtnprice.Text = "";
                    txtdscr.Text = "";
                    txtRealFileName.Text = "";
                    Image1.Visible = false;
                    txtRealFileName1.Text = "";
                    Image2.Visible = false;
                    txtRealFileName2.Text = "";
                    Image3.Visible = false;
                    txtRealFileName3.Text = "";
                    Image4.Visible = false;
                }
                else
                {
                    Session["msg"] = "Product is Not Updated";

                }

            }
            catch (Exception ex)
            {
                Session["msg"] = ex.Message;

            }
            SqlDataSource1.UpdateParameters.Clear();
        }
    }
    protected void ddlcname_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable(); ;
          SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
           SqlDataSource1.SelectCommand = "Select * from tbl_category where Under_Group=@cat order by Category_Id";
        
           SqlDataSource1.SelectParameters.Add("cat", ddlcname.SelectedItem.Text);
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                dt = dv.Table;
                
            }
            catch (Exception ex)
            {

                Session["msg"] = ex.Message;

            }
            SqlDataSource1.SelectParameters.Clear();
            DataRow dr = dt.NewRow();
            dr[0] = 0;
            dr[1] = "Select";
            dr[2] = "Main";
            dt.Rows.InsertAt(dr, 0);

            ddlscname.DataSource = dt;
            ddlscname.DataTextField = "Category_Name";
            ddlscname.DataValueField = "Category_Id";
            ddlscname.DataBind();
        
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("products.aspx");
    }
}