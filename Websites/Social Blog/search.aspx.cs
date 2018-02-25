using System;
using BAL;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    string opr;
    BLayer bl = new BLayer();
    BLayer.Search search_obj = new BLayer.Search();
    BLayer.Request req = new BLayer.Request();
    protected void Page_Load(object sender, EventArgs e)
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        opr = Request.QueryString["opr"].ToString();
        if (opr == "search")
        {
            string key = Request.QueryString["key"].ToString();

            DataTable dt = search_obj.getSearch(reg_id, key);
            if (dt.Rows.Count > 0)
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                no_record.Visible = true;
            }
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onMore")
        {
            int reg_id = Convert.ToInt32(e.CommandArgument);
            Session["req_reg_id"] = reg_id;
            Response.Redirect("view_more_details.aspx");
        }
    }
}