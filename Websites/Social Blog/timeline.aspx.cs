using System;
using BAL;
using System.Data;
public partial class AutoSearch : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.Friend frnd = new BLayer.Friend();
    BLayer.Post post_obj = new BLayer.Post();

    protected void Page_Load(object sender, EventArgs e)
    {
        dataListBind();
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
        dt.Columns.Add("friend_post_id");
        dt.Columns.Add("friend_caption");
        dt.Columns.Add("friend_image");
        dt.Columns.Add("friend_date_time");
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
                    DataSet ds_user = post_obj.get_post_by_reg_id_filtered(from_id);
                    DataSet ds_profile_photo = bl.get_profile_photo(from_id);
                    string profile_photo = "";
                    if (ds_profile_photo.Tables[0].Rows.Count > 0)
                    {
                        profile_photo = ds_profile_photo.Tables[0].Rows[0][0].ToString();
                    }
                    else
                    {
                        profile_photo = "~/Lib/images/default_profile_photo.jpg";
                    }
                    ds_profile_photo.Clear();
                    if (ds_user.Tables[0].Rows.Count > 0)
                    {
                        for (int j = 0; j < ds_user.Tables[0].Rows.Count; j++)
                        {
                            string fn = ds_user.Tables[0].Rows[j]["fn"].ToString();
                            string ln = ds_user.Tables[0].Rows[j]["ln"].ToString();
                            int post_id = Convert.ToInt32(ds_user.Tables[0].Rows[j]["post_id"]);
                            string caption = ds_user.Tables[0].Rows[j]["caption"].ToString();
                            string image = ds_user.Tables[0].Rows[j]["image"].ToString();
                            string date_time = ds_user.Tables[0].Rows[j]["date_time"].ToString();
                            dt.Rows.Add(from_id, fn, ln, profile_photo, post_id, caption, image, date_time);
                        }
                    }
                }
                if (to_id != reg_id)
                {
                    from_id = to_id;
                    DataSet ds_user = post_obj.get_post_by_reg_id_filtered(from_id);
                    DataSet ds_profile_photo = bl.get_profile_photo(from_id);
                    string profile_photo = "";
                    if (ds_profile_photo.Tables[0].Rows.Count > 0)
                    {
                        profile_photo = ds_profile_photo.Tables[0].Rows[0][0].ToString();
                    }
                    else
                    {
                        profile_photo = "~/Lib/images/default_profile_photo.jpg";
                    }
                    ds_profile_photo.Clear();
                    if (ds_user.Tables[0].Rows.Count > 0)
                    {
                        for (int j = 0; j < ds_user.Tables[0].Rows.Count; j++)
                        {
                            string fn = ds_user.Tables[0].Rows[j]["fn"].ToString();
                            string ln = ds_user.Tables[0].Rows[j]["ln"].ToString();
                            int post_id = Convert.ToInt32(ds_user.Tables[0].Rows[j]["post_id"]);
                            string caption = ds_user.Tables[0].Rows[j]["caption"].ToString();
                            string image = ds_user.Tables[0].Rows[j]["image"].ToString();
                            string date_time = ds_user.Tables[0].Rows[j]["date_time"].ToString();
                            dt.Rows.Add(from_id, fn, ln, profile_photo, post_id, caption, image, date_time);
                        }
                    }
                } //end if
            } //end for
            dt.DefaultView.Sort = "friend_date_time desc";
            DataList1.DataSource = dt.DefaultView;
            DataList1.DataBind();
        } //end if
        else
        {
            dt.DefaultView.Sort = "friend_date_time desc";
            DataList1.DataSource = dt.DefaultView;
            DataList1.DataBind();
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onLikes")
        {
            int post_id = Convert.ToInt32(e.CommandArgument);
            Session["like_post_id"] = post_id;
            
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        dataListBind();
    }
}