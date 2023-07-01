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
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }

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

        if (dv2.Count > 0 && dv2[0][0]!=DBNull.Value)
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
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
       

        switch (e.CommandName)
        {
            case "minus":
                 SqlDataSource1.UpdateCommand = "update tbl_cart set qty=qty-1,amount=amount-price where user_email_id=@eid and product_id=@pid";
                 SqlDataSource1.UpdateParameters.Add("eid", Session["email"].ToString());
                 SqlDataSource1.UpdateParameters.Add("pid", id);

                 SqlDataSource1.Update();
                 SqlDataSource1.UpdateParameters.Clear();
                break;
            case "plus":
                SqlDataSource1.UpdateCommand = "update tbl_cart set qty=qty+1,amount=amount+price where user_email_id=@eid  and product_id=@pid";
                 SqlDataSource1.UpdateParameters.Add("eid", Session["email"].ToString());
                 SqlDataSource1.UpdateParameters.Add("pid", id);
                 SqlDataSource1.Update();
                 SqlDataSource1.UpdateParameters.Clear();
                break;
            case "del":
                SqlDataSource1.DeleteCommand = "delete from tbl_cart where user_email_id=@eid and product_id=@pid";
                 SqlDataSource1.DeleteParameters.Add("eid", Session["email"].ToString());
                 SqlDataSource1.DeleteParameters.Add("pid", id);
                 SqlDataSource1.Delete();
                 SqlDataSource1.DeleteParameters.Clear();
                break;
        }
        getcart();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            var btn = e.Item.FindControl("btnminus") as Button;
            var btn1 = e.Item.FindControl("btnplus") as Button;
            var btn2 = e.Item.FindControl("btndel") as Button;
            var ltr = e.Item.FindControl("ltrid") as Literal;
            
               // btn.Click += new EventHandler(minusclick);
                btn.CommandName = "minus";
                btn.CommandArgument = ltr.Text;

                btn1.CommandName = "plus";
                btn1.CommandArgument = ltr.Text;

                btn2.CommandName = "del";
                btn2.CommandArgument = ltr.Text;

        }
    }

   /* void minusclick(object sender, EventArgs e)
    {
        
    }*/
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx");
    }
}