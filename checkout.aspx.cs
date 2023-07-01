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
            getcart();
        }
    }
    void getcart()
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select * from tbl_cart where user_email_id=@eid";

        SqlDataSource1.SelectParameters.Add("eid", Session["email"].ToString());
        DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        Repeater1.DataSource = dv1.Table;
        Repeater1.DataBind();
        SqlDataSource1.SelectParameters.Clear();


        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select sum(amount) from tbl_cart where user_email_id=@eid";

        SqlDataSource1.SelectParameters.Add("eid", Session["email"].ToString());
        DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv2.Count > 0)
        {
            Literal1.Text = dv2[0][0].ToString();
            Literal2.Text = (float.Parse(dv2[0][0].ToString()) + 40).ToString();
        }
        else
        {
            Literal1.Text = "0";
            Literal2.Text = "40";
        }
        SqlDataSource1.SelectParameters.Clear();
    }

    protected void btnplace_Click(object sender, EventArgs e)
    {
        string ono;
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select order_no from tbl_bill order by order_no desc";
        DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv1.Count > 0)
        {
            ono = dv1[0][0].ToString();
        }
        else
        {
            ono = "1";
        }
        SqlDataSource1.SelectParameters.Clear();

        string odate, otime;
        odate = DateTime.Now.ToString("MM-dd-yyyy");
        otime = DateTime.Now.ToString("HH:mm");

        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_bill(user_email_id,order_no,order_date,order_time,first_name,last_name,email_id,mobile_no,address1,address2,country,city,state,zipcode) values(@user_email_id,@order_no,@order_date,@order_time,@first_name,@last_name,@email_id,@mobile_no,@address1,@address2,@country,@city,@state,@zipcode)";
        SqlDataSource1.InsertParameters.Add("user_email_id", Session["email"].ToString());
        SqlDataSource1.InsertParameters.Add("order_no", ono);
        SqlDataSource1.InsertParameters.Add("order_date", odate);
        SqlDataSource1.InsertParameters.Add("order_time", otime);
        SqlDataSource1.InsertParameters.Add("first_name", txtfname.Text);
        SqlDataSource1.InsertParameters.Add("last_name", txtlname.Text);
        SqlDataSource1.InsertParameters.Add("email_id", txtemail.Text);
        SqlDataSource1.InsertParameters.Add("mobile_no", txtmno.Text);
        SqlDataSource1.InsertParameters.Add("address1", txtaddr1.Text);
        SqlDataSource1.InsertParameters.Add("address2", txtaddr2.Text);
        SqlDataSource1.InsertParameters.Add("country", ddlcountry.SelectedValue);
        SqlDataSource1.InsertParameters.Add("city", txtcity.Text);
        SqlDataSource1.InsertParameters.Add("state", txtstate.Text);
        SqlDataSource1.InsertParameters.Add("zipcode", txtzip.Text);
        SqlDataSource1.Insert();
        SqlDataSource1.InsertParameters.Clear();

        if (shipto.Checked)
        {
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.InsertCommand = "insert into tbl_shipping(user_email_id,order_no,order_date,order_time,first_name,last_name,email_id,mobile_no,address1,address2,country,city,state,zipcode) values(@user_email_id,@order_no,@order_date,@order_time,@first_name,@last_name,@email_id,@mobile_no,@address1,@address2,@country,@city,@state,@zipcode)";
            SqlDataSource1.InsertParameters.Add("user_email_id", Session["email"].ToString());
            SqlDataSource1.InsertParameters.Add("order_no", ono);
            SqlDataSource1.InsertParameters.Add("order_date", odate);
            SqlDataSource1.InsertParameters.Add("order_time", otime);
            SqlDataSource1.InsertParameters.Add("first_name", TextBox1.Text);
            SqlDataSource1.InsertParameters.Add("last_name", TextBox2.Text);
            SqlDataSource1.InsertParameters.Add("email_id", TextBox3.Text);
            SqlDataSource1.InsertParameters.Add("mobile_no", TextBox4.Text);
            SqlDataSource1.InsertParameters.Add("address1", TextBox5.Text);
            SqlDataSource1.InsertParameters.Add("address2", TextBox6.Text);
            SqlDataSource1.InsertParameters.Add("country", DropDownList1.SelectedValue);
            SqlDataSource1.InsertParameters.Add("city", TextBox7.Text);
            SqlDataSource1.InsertParameters.Add("state", TextBox8.Text);
            SqlDataSource1.InsertParameters.Add("zipcode", TextBox9.Text);
            SqlDataSource1.Insert();
            SqlDataSource1.InsertParameters.Clear();
        }
        else
        {
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.InsertCommand = "insert into tbl_shipping(user_email_id,order_no,order_date,order_time,first_name,last_name,email_id,mobile_no,address1,address2,country,city,state,zipcode) values(@user_email_id,@order_no,@order_date,@order_time,@first_name,@last_name,@email_id,@mobile_no,@address1,@address2,@country,@city,@state,@zipcode)";
            SqlDataSource1.InsertParameters.Add("user_email_id", Session["email"].ToString());
            SqlDataSource1.InsertParameters.Add("order_no", ono);
            SqlDataSource1.InsertParameters.Add("order_date", odate);
            SqlDataSource1.InsertParameters.Add("order_time", otime);
            SqlDataSource1.InsertParameters.Add("first_name", txtfname.Text);
            SqlDataSource1.InsertParameters.Add("last_name", txtlname.Text);
            SqlDataSource1.InsertParameters.Add("email_id", txtemail.Text);
            SqlDataSource1.InsertParameters.Add("mobile_no", txtmno.Text);
            SqlDataSource1.InsertParameters.Add("address1", txtaddr1.Text);
            SqlDataSource1.InsertParameters.Add("address2", txtaddr2.Text);
            SqlDataSource1.InsertParameters.Add("country", ddlcountry.SelectedValue);
            SqlDataSource1.InsertParameters.Add("city", txtcity.Text);
            SqlDataSource1.InsertParameters.Add("state", txtstate.Text);
            SqlDataSource1.InsertParameters.Add("zipcode", txtzip.Text);
            SqlDataSource1.Insert();
            SqlDataSource1.InsertParameters.Clear();
        }


        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.SelectCommand = "Select * from tbl_cart where user_email_id=@eid";

        SqlDataSource1.SelectParameters.Add("eid", Session["email"].ToString());
        DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        SqlDataSource1.SelectParameters.Clear();

        for (int k = 0; k < dv2.Count; k++)
        {
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.InsertCommand = "insert into tbl_orderlist(user_email_id,order_no,order_date,order_time,srno,product_id,product_name,product_photo,price,qty,amount) values(@user_email_id,@order_no,@order_date,@order_time,@srno,@product_id,@product_name,@product_photo,@price,@qty,@amount)";
            SqlDataSource1.InsertParameters.Add("user_email_id", Session["email"].ToString());
            SqlDataSource1.InsertParameters.Add("order_no", ono);
            SqlDataSource1.InsertParameters.Add("order_date", odate);
            SqlDataSource1.InsertParameters.Add("order_time", otime);
            SqlDataSource1.InsertParameters.Add("srno", (k+1).ToString());
            SqlDataSource1.InsertParameters.Add("product_id", dv2[k][2].ToString());
            SqlDataSource1.InsertParameters.Add("product_name", dv2[k][3].ToString());
            SqlDataSource1.InsertParameters.Add("product_photo", dv2[k][4].ToString());
            SqlDataSource1.InsertParameters.Add("price", dv2[k][5].ToString());
            SqlDataSource1.InsertParameters.Add("qty", dv2[k][6].ToString());
            SqlDataSource1.InsertParameters.Add("amount", dv2[k][7].ToString());
            SqlDataSource1.Insert();
            SqlDataSource1.InsertParameters.Clear();
        }

        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_orders(user_email_id,order_no,order_date,order_time,subtotal,shipping,total_amount,payment_type,status) values(@user_email_id,@order_no,@order_date,@order_time,@subtotal,@shipping,@total_amount,@payment_type,@status)";
        SqlDataSource1.InsertParameters.Add("user_email_id", Session["email"].ToString());
        SqlDataSource1.InsertParameters.Add("order_no", ono);
        SqlDataSource1.InsertParameters.Add("order_date", odate);
        SqlDataSource1.InsertParameters.Add("order_time", otime);
        SqlDataSource1.InsertParameters.Add("subtotal", Literal1.Text);
        SqlDataSource1.InsertParameters.Add("shipping", "40");
        SqlDataSource1.InsertParameters.Add("total_amount", Literal2.Text);
        SqlDataSource1.InsertParameters.Add("payment_type", RadioButtonList1.SelectedValue);
        SqlDataSource1.InsertParameters.Add("status", "Placed");
        SqlDataSource1.Insert();
        SqlDataSource1.InsertParameters.Clear();



        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.DeleteCommand = "delete from tbl_cart where user_email_id=@eid";
        SqlDataSource1.DeleteParameters.Add("eid", Session["email"].ToString());
        SqlDataSource1.Delete();
        SqlDataSource1.DeleteParameters.Clear();

        Response.Redirect("thanks.aspx");
    }
}