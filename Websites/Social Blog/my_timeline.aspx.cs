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
                    DataSet ds_user = post_obj.get_post_by_reg_id(reg_id);
                    if (ds_user.Tables[0].Rows.Count > 0)
                    {
                        for (int j = 0; j < ds_user.Tables[0].Rows.Count; j++)
                        {
                            int post_id = Convert.ToInt32(ds_user.Tables[0].Rows[j]["post_id"]);
                            string caption = ds_user.Tables[0].Rows[j]["caption"].ToString();
                            string image = ds_user.Tables[0].Rows[j]["image"].ToString();
                            string date_time = ds_user.Tables[0].Rows[j]["date_time"].ToString();
                            dt.Rows.Add(reg_id, Session["fn"].ToString(), Session["ln"].ToString(), Session["profile_photo"].ToString(), post_id, caption, image, date_time);
                        }
                    }
        dt.DefaultView.Sort = "friend_date_time desc";
        DataList1.DataSource = dt.DefaultView;
            DataList1.DataBind();
    }
}