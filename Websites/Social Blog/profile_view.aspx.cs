using System;
using BAL;

public partial class registration : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.MoreDetails md = new BLayer.MoreDetails();
    BLayer.Request req = new BLayer.Request();
    BLayer.Friend frnd = new BLayer.Friend();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int reg_id = Convert.ToInt32(Session["reg_id"]);
            DataList1.DataSource = md.getMoreDetails(reg_id);
            DataList1.DataBind();
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {

        if (e.CommandName == "onTimeline")
        {
            Response.Redirect("my_timeline.aspx");
        }
    }
}