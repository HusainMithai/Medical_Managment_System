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
            if (Request["pid"] == null)
            {
                Response.Redirect("products.aspx");
            }
            else
            {
                txtpid.Text = Request["pid"];
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_products where product_id=@pid";

                SqlDataSource1.SelectParameters.Add("pid", Request["pid"]);
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Count > 0)
                {
                    Image1.ImageUrl = "~/admin/uploads/"+dv[0][11].ToString();
                    Image2.ImageUrl = "~/admin/uploads/" + dv[0][12].ToString();
                    Image3.ImageUrl = "~/admin/uploads/" + dv[0][13].ToString();
                    Image4.ImageUrl = "~/admin/uploads/" + dv[0][14].ToString();
                    Literal1.Text = dv[0][1].ToString();
                    Literal2.Text = "Rs. "+dv[0][9].ToString();
                    Literal3.Text = dv[0][5].ToString();
                    Literal4.Text = dv[0][6].ToString();
                    Literal5.Text = dv[0][7].ToString();
                    Literal6.Text = dv[0][10].ToString();
                    Literal7.Text = dv[0][1].ToString();
                }
                SqlDataSource1.SelectParameters.Clear();


                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select * from tbl_reviews where product_id=@pid";

                SqlDataSource1.SelectParameters.Add("pid", txtpid.Text);
                DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                Literal8.Text = dv1.Count.ToString();
                Literal9.Text = dv1.Count.ToString();
                Literal10.Text = dv1.Count.ToString();
                Repeater1.DataSource = dv1.Table;
                Repeater1.DataBind();
                SqlDataSource1.SelectParameters.Clear();


                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
                SqlDataSource1.SelectCommand = "Select avg(rating) from tbl_reviews where product_id=@pid";

                SqlDataSource1.SelectParameters.Add("pid", txtpid.Text);
                DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv2.Count > 0)
                {
                    if (dv2[0][0] == DBNull.Value)
                    {
                        Session["rating"] = 0;
                    }
                    else
                    {
                        Session["rating"] = float.Parse(dv2[0][0].ToString());
                    }
                }
                else
                {
                    Session["rating"] = 0;
                }
                SqlDataSource1.SelectParameters.Clear();
            }
        }
    }
    protected void btnleave_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_reviews(Name,EmailId,Review,Rating,Review_Datetime,Product_Id) values(@Name,@EmailId,@Review,@Rating,@Review_Datetime,@Product_Id)";
        SqlDataSource1.InsertParameters.Add("Name", txtName.Text);
        SqlDataSource1.InsertParameters.Add("EmailId", txtEmail.Text);
        SqlDataSource1.InsertParameters.Add("Review", txtmessage.Text);
        SqlDataSource1.InsertParameters.Add("Rating", txtratings.Text);
        SqlDataSource1.InsertParameters.Add("Review_Datetime", DateTime.Now.ToString("dd-MM-yyyy HH:mm"));
        SqlDataSource1.InsertParameters.Add("Product_Id", txtpid.Text);
        
        try
        {
            int n = SqlDataSource1.Insert();
            if (n > 0)
            {
                Session["error"] = "No";
                Session["msg"] = "Review is Completed";

            }
            else
            {
                Session["error"] = "Yes";
                Session["msg"] = "Review is Failed";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.InsertParameters.Clear();
    }
    protected void btncart_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_cart(user_email_id,product_id,product_name,product_photo,price,qty,amount) values(@user_email_id,@product_id,@product_name,@product_photo,@price,@qty,@amount)";
        SqlDataSource1.InsertParameters.Add("user_email_id",Session["email"].ToString());
        SqlDataSource1.InsertParameters.Add("product_id", txtpid.Text);
        SqlDataSource1.InsertParameters.Add("product_name",Literal1.Text);
        SqlDataSource1.InsertParameters.Add("product_photo", Image1.ImageUrl.Substring(Image1.ImageUrl.LastIndexOf('/')+1));
        SqlDataSource1.InsertParameters.Add("price", Literal2.Text.Substring(4));
        SqlDataSource1.InsertParameters.Add("qty", txtqty.Text);
        SqlDataSource1.InsertParameters.Add("amount", (int.Parse(txtqty.Text) * float.Parse(Literal2.Text.Substring(4))).ToString());

        try
        {
            int n = SqlDataSource1.Insert();
            if (n > 0)
            {
                Session["error"] = "No";
                Session["msg"] = "Product is Added";
                Response.Redirect("cart.aspx");
            }
            else
            {
                Session["error"] = "Yes";
                Session["msg"] = "Product is not Added";

            }

        }
        catch (Exception ex)
        {
            Session["error"] = "Yes";
            Session["msg"] = ex.Message;

        }
        SqlDataSource1.InsertParameters.Clear();
        
    }
}