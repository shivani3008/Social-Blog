using System;
using BAL;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class friend_list : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.Request req = new BLayer.Request();
    BLayer.Friend frnd = new BLayer.Friend();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["reg_id"]) != "")
        {
            dataListBind();

       /*     Label l = this.Master.FindControl("lbl_total_request") as Label;
            if (l != null)
            {
                l.Visible = false;
            }  */
        }
    }

    void dataListBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);

        DataTable dt = new DataTable();
        dt.Clear();
        dt.Columns.Add("friend_reg_id");
        dt.Columns.Add("friend_fn");
        dt.Columns.Add("friend_ln");
        dt.Columns.Add("friend_profile_photo");
        int flag = 1;

        DataSet ds = frnd.getAllFriends(reg_id, flag);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                int from_id = Convert.ToInt32(ds.Tables[0].Rows[i][1]);
                int to_id = Convert.ToInt32(ds.Tables[0].Rows[i][2]);
                if (from_id != reg_id)
                {
                    DataSet ds_user = bl.get_user_by_reg_id(from_id);


                    string fn = ds_user.Tables[0].Rows[0]["fn"].ToString();
                    string ln = ds_user.Tables[0].Rows[0]["ln"].ToString();


                    DataSet ds_profile_photo = bl.get_profile_photo(from_id);
                    if (ds_profile_photo.Tables[0].Rows.Count > 0)
                    {
                        string image = ds_profile_photo.Tables[0].Rows[0][0].ToString();
                        dt.Rows.Add(from_id, fn, ln, image);
                    }
                    else
                    {
                        dt.Rows.Add(from_id, fn, ln, "~/Lib/images/default_profile_photo.jpg");
                    }
                }
                if (to_id != reg_id)
                {
                    DataSet ds_user = bl.get_user_by_reg_id(to_id);


                    string fn = ds_user.Tables[0].Rows[0]["fn"].ToString();
                    string ln = ds_user.Tables[0].Rows[0]["ln"].ToString();


                    DataSet ds_profile_photo = bl.get_profile_photo(to_id);
                    if (ds_profile_photo.Tables[0].Rows.Count > 0)
                    {
                        string image = ds_profile_photo.Tables[0].Rows[0][0].ToString();
                        dt.Rows.Add(to_id, fn, ln, image);
                    }
                    else
                    {
                        dt.Rows.Add(to_id, fn, ln, "~/Lib/images/default_profile_photo.jpg");
                    }
                }
                DataList1.DataSource = dt.DefaultView;
                DataList1.DataBind();
            }
        }
        else
        {
            DataList1.DataSource = dt.DefaultView;
            DataList1.DataBind();
            no_friends.Visible = true;
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

        if (e.CommandName == "onUnfriend")
        {
            int friend_id = Convert.ToInt32(e.CommandArgument);

            int reg_id = Convert.ToInt32(Session["reg_id"]);

            int i = frnd.onClickUnfriend(reg_id, friend_id);
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