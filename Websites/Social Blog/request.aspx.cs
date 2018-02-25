using System;
using BAL;
using System.Data;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.Request req = new BLayer.Request();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["reg_id"]) != "")
        {
            dataListBind();

            Label l = this.Master.FindControl("lbl_total_request") as Label;
            if (l != null)
            {
                l.Visible = false;
            }
        }
    }

    void dataListBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);

        DataTable dt1 = new DataTable();
        dt1.Clear();
        dt1.Columns.Add("friend_reg_id");
        dt1.Columns.Add("friend_fn");
        dt1.Columns.Add("friend_ln");
        dt1.Columns.Add("friend_profile_photo");
        int flag = 0;

        DataSet ds = req.getAllRequest(reg_id, flag);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string id = ds.Tables[0].Rows[i][0].ToString();
                int from_reg_id = Convert.ToInt32(id);


                DataSet ds1 = bl.get_user_by_reg_id(from_reg_id);

                string fn = ds1.Tables[0].Rows[0][1].ToString();
                string ln = ds1.Tables[0].Rows[0][2].ToString();
                ds1.Clear();

                ds1 = bl.get_profile_photo(from_reg_id);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    string image = ds1.Tables[0].Rows[0][0].ToString();
                    dt1.Rows.Add(from_reg_id, fn, ln, image);
                }
                else
                {
                    dt1.Rows.Add(from_reg_id, fn, ln, "~/Lib/images/default_profile_photo.jpg");
                }
            }

            DataList1.DataSource = dt1.DefaultView;
            DataList1.DataBind();
        }
        else
        {
            DataList1.DataSource = dt1.DefaultView;
            DataList1.DataBind();
            no_request.Visible = true;
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

        if (e.CommandName == "onAccept")
        {
            int from_id = Convert.ToInt32(e.CommandArgument);

            int reg_id = Convert.ToInt32(Session["reg_id"]);
            int to_id = reg_id;

            int flag = 1;

            int i = req.onClickAccept(from_id, to_id, flag);
            if (i > 0)
            {
                dataListBind();
            }
        }

        if (e.CommandName == "onReject")
        {
            int from_id = Convert.ToInt32(e.CommandArgument);

            int reg_id = Convert.ToInt32(Session["reg_id"]);
            int to_id = reg_id;
            
            int i = req.onClickReject(from_id, to_id);
            if (i > 0)
            {
                dataListBind();
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        dataListBind();
    }
}