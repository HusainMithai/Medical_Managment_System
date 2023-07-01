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
            
            

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select distinct generic_name from tbl_products order by generic_name";

            DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            colorlist.Items.Clear();
            colorlist.Items.Add(new ListItem("&nbsp;&nbsp;All Name" , "All Name"));
            
            for (int i = 0; i < dv1.Count; i++)
            {
                colorlist.Items.Add(new ListItem("&nbsp;&nbsp;"+dv1[i][0].ToString(),dv1[i][0].ToString()));
            }
         /*   colorlist.DataSource = dv1.Table;
            colorlist.DataTextField = "color";
            colorlist.DataValueField = "color";
            colorlist.DataBind();*/
            SqlDataSource1.SelectParameters.Clear();

            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
            SqlDataSource1.SelectCommand = "Select distinct medicine_type from tbl_products order by medicine_type";

            sizelist.Items.Clear();
            sizelist.Items.Add(new ListItem("&nbsp;&nbsp;All Type", "All Type"));

            DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i < dv2.Count; i++)
            {
                sizelist.Items.Add(new ListItem("&nbsp;&nbsp;" + dv2[i][0].ToString(), dv2[i][0].ToString()));
            }
            
            SqlDataSource1.SelectParameters.Clear();

            pricelist.Items[0].Selected = true;
            colorlist.Items[0].Selected = true;
            sizelist.Items[0].Selected = true;


            fetchdata(false);

        }
    }
    public void fetchdata(Boolean filter)
    {
        string pcondition="";
        if (pricelist.Items[0].Selected)
        {
            if (pcondition.Equals(""))
                pcondition = "new_price>0";
            else
                pcondition += " or new_price>0";
        }
        if (pricelist.Items[1].Selected)
        {
            if (pcondition.Equals(""))
                pcondition = "(new_price>=0 and new_price<100)";
            else
                pcondition += " or (new_price>=0 and new_price<100)";
        }
        if (pricelist.Items[2].Selected)
        {
            if (pcondition.Equals(""))
                pcondition = "(new_price>=100 and new_price<300)";
            else
                pcondition = " or (new_price>=100 and new_price<300)";
        }
        if (pricelist.Items[3].Selected)
        {
            if (pcondition.Equals(""))
                pcondition = "(new_price>=300 and new_price<500)";
            else
                pcondition += " or (new_price>=300 and new_price<500)";
        }
        if (pricelist.Items[4].Selected)
        {
            if (pcondition.Equals(""))
                pcondition = "(new_price>=500)";
            else
                pcondition += " or (new_price>=500)";
        }
        if (pcondition.Equals(""))
        {
            pcondition = "new_price>0";
        }

        string clr = "";
        for (int i = 0; i < colorlist.Items.Count; i++)
        {
            if (i == 0 && colorlist.Items[i].Selected)
            {
                break;
            }
            if(colorlist.Items[i].Selected)
            {
                if (clr.Equals(""))
                    clr = "'"+colorlist.Items[i].Value+"'";
                else
                    clr += ",'" + colorlist.Items[i].Value+"'";
            }
        }
        if (!clr.Equals(""))
        {
            pcondition += " and generic_name in ("+clr+")";
        }

        string size = "";
        for (int i = 0; i < sizelist.Items.Count; i++)
        {
            if (i == 0 && sizelist.Items[i].Selected)
            {
                break;
            }
            if (sizelist.Items[i].Selected)
            {
                if (size.Equals(""))
                    size = "'" + sizelist.Items[i].Value + "'";
                else
                    size += ",'" + sizelist.Items[i].Value + "'";
            }
        }
        if (!size.Equals(""))
        {
            pcondition += " and medicine_type in (" + size + ")";
        }
        
      
        DataTable dt;
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ShopperDbConnect"].ToString();
        if (Request["catid"] == null)
        {
            SqlDataSource1.SelectCommand = "Select * from tbl_products where "+pcondition+"  order by product_id desc";
        }
        else
        {
            SqlDataSource1.SelectCommand = "Select * from tbl_products where Category_id=@cat and "+pcondition+" order by product_id desc";
            SqlDataSource1.SelectParameters.Add("cat", Request["catid"]);
        }
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = dv.Table.Copy();
        dt.Rows.Clear();
        dt.AcceptChanges();
        Session["nopages"] = Math.Ceiling(dv.Count / 9.0);
        if (Request["pno"] == null)
        {
            Session["curpage"] = 1;
        }
        else
        {
            Session["curpage"] = Request["pno"];
        }

        int range1, range2;
        range2 = int.Parse(Session["curpage"].ToString()) * 9;
        range1 = range2 - 9;
        for (int i = range1; i < range2; i++)
        {
            if (i < dv.Count)
            {
                DataRow dr = dt.NewRow();
                for (int k = 0; k < dv.Table.Copy().Columns.Count; k++)
                {
                    dr[k] = dv.Table.Copy().Rows[i][k];
                }
                dt.Rows.Add(dr);
            }
        }
        Repeater1.DataSource = dt;
        Repeater1.DataBind();


        SqlDataSource1.SelectParameters.Clear();
       
    }
    protected void pricelist_SelectedIndexChanged(object sender, EventArgs e)
    {
        fetchdata(true);
    }
    protected void colorlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        fetchdata(true);
    }
    protected void sizelist_SelectedIndexChanged(object sender, EventArgs e)
    {
        fetchdata(true);
    }
}