using System;
using BAL;
using System.Web.UI.WebControls;
using System.Data;

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
            int req_reg_id = Convert.ToInt32(Session["req_reg_id"]);
            DataList1.DataSource = md.getMoreDetails(req_reg_id);
            DataList1.DataBind();
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        LinkButton lnk_send = (LinkButton)e.Item.FindControl("lnk_send");
        LinkButton lnk_cancel = (LinkButton)e.Item.FindControl("lnk_cancel");

        if (e.CommandName == "onSend")
        {            
            int req_reg_id = Convert.ToInt32(Session["req_reg_id"]);    //To

            int reg_id = Convert.ToInt32(Session["reg_id"]);    //From

            int flag = 0;
            DataSet ds = req.isRequestAlreadySend(reg_id, req_reg_id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lnk_send.Visible = false;
                lnk_cancel.Visible = false;
            }
            else
            {
                lnk_send.Visible = true;
                lnk_cancel.Visible = false;
                int i = frnd.onClickAddFriend(reg_id, req_reg_id, flag);
                if (i > 0)
                {
                    lnk_send.Visible = false;
                    lnk_cancel.Visible = true;
                }
            }
        }

        if (e.CommandName == "onCancel")
        {
            int req_reg_id = Convert.ToInt32(Session["req_reg_id"]);    //To

            int reg_id = Convert.ToInt32(Session["reg_id"]);    //From

            int i = frnd.onClickCancel(reg_id, req_reg_id);
            if (i > 0)
            {
                lnk_send.Visible = true;
                lnk_cancel.Visible = false;
            }
        }

        if (e.CommandName == "onTimeline")
        {

        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton lnk_send = (LinkButton)e.Item.FindControl("lnk_send");
        LinkButton lnk_cancel = (LinkButton)e.Item.FindControl("lnk_cancel");
        int req_reg_id = Convert.ToInt32(Session["req_reg_id"]);    //To

        int reg_id = Convert.ToInt32(Session["reg_id"]);    //From

        DataSet ds = req.isRequestAlreadySend(reg_id, req_reg_id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lnk_send.Visible = false;
            lnk_cancel.Visible = false;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int req_reg_id = Convert.ToInt32(Session["req_reg_id"]);
        DataList1.DataSource = md.getMoreDetails(req_reg_id);
        DataList1.DataBind();
    }
}