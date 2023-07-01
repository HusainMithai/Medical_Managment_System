using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        SqlDataSource1.InsertCommand = "insert into tbl_register(Name,Gender,Mobile_no,Address,City,State,Country,Email_Id,Password) values(@Name,@Gender,@Mobile_no,@Address,@City,@State,@Country,@Email_Id,@Password)";
        SqlDataSource1.InsertParameters.Add("Name", txtName.Text);
        SqlDataSource1.InsertParameters.Add("Gender", rdbtngender.SelectedItem.Text);
        SqlDataSource1.InsertParameters.Add("Mobile_no", txtMobile.Text);
        SqlDataSource1.InsertParameters.Add("Address", txtAddress.Text);
        SqlDataSource1.InsertParameters.Add("City", txtCity.Text);
        SqlDataSource1.InsertParameters.Add("State", txtState.Text);
        SqlDataSource1.InsertParameters.Add("Country", txtCountry.Text);
        SqlDataSource1.InsertParameters.Add("Email_Id", txtEmail.Text);
        SqlDataSource1.InsertParameters.Add("Password", txtPass.Text);
        try
        {
            int n=SqlDataSource1.Insert();
            if (n > 0)
            {
                Session["error"] = "No";
                Session["msg"] = "Registration is Completed";
               
            }
            else
            {
                Session["error"] = "Yes";
                Session["msg"] = "Registration is Failed";
              
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