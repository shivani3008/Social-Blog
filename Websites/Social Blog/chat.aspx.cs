using System;
using BAL;
using System.Data;
using System.Web.UI.WebControls;

public partial class message : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.Friend frnd = new BLayer.Friend();
    BLayer.Chat chat = new BLayer.Chat();
    string delete_date = DateTime.Today.ToShortDateString();
    string delete_time = DateTime.Now.AddMinutes(-30).ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["reg_id"]) != "")
        {
            txt_msg.Focus();
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

    void dataListHeaderBind()
    {
        if (Session["chat_reg_id"] != null)
        {
            int req_reg_id = Convert.ToInt32(Session["chat_reg_id"]);
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("friend_reg_id");
            dt.Columns.Add("friend_fn");
            dt.Columns.Add("friend_ln");
            dt.Columns.Add("friend_profile_photo");

            DataSet ds_user = bl.get_user_by_reg_id(req_reg_id);
            string fn = ds_user.Tables[0].Rows[0]["fn"].ToString();
            string ln = ds_user.Tables[0].Rows[0]["ln"].ToString();
            Session["chat_fn"] = fn;
            Session["chat_ln"] = ln;
            DataSet ds_profile_photo = bl.get_profile_photo(req_reg_id);

            if (ds_profile_photo.Tables[0].Rows.Count > 0)
            {
                string image = ds_profile_photo.Tables[0].Rows[0][0].ToString();
                Session["chat_profile_photo"] = image;
                dt.Rows.Add(req_reg_id, fn, ln, image);
            }
            else
            {
                dt.Rows.Add(req_reg_id, fn, ln, "~/Lib/images/default_profile_photo.jpg");
                Session["chat_profile_photo"] = "~/Lib/images/default_profile_photo.jpg";
            }
            DataListHeader.DataSource = dt.DefaultView;
            DataListHeader.DataBind();
        }
    }


    void dataListMainBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        if (Session["chat_reg_id"] != null)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("reg_id");
            dt.Columns.Add("fn");
            dt.Columns.Add("ln");
            dt.Columns.Add("profile_photo");
            dt.Columns.Add("msg");
            dt.Columns.Add("date_time");

            int chat_reg_id = Convert.ToInt32(Session["chat_reg_id"]);
              string chat_fn = Convert.ToString(Session["chat_fn"]);
              string chat_ln = Convert.ToString(Session["chat_ln"]);
              string chat_profile_photo = Convert.ToString(Session["chat_profile_photo"]);
              DataSet ds = chat.get_msg_by_reg_id(reg_id, chat_reg_id, delete_date, delete_time);

              if (ds.Tables[0].Rows.Count > 0)
              {
                  for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                  {
                        int from_id = Convert.ToInt32(ds.Tables[0].Rows[i]["from_id"]);
                        int to_id = Convert.ToInt32(ds.Tables[0].Rows[i]["to_id"]);
                        string msg = Convert.ToString(ds.Tables[0].Rows[i]["msg"]);
                        string date_time = Convert.ToString(ds.Tables[0].Rows[i]["date_time"]);
                        if (from_id == reg_id)
                        {
                            dt.Rows.Add(reg_id, Session["fn"].ToString(), Session["ln"].ToString(), Session["profile_photo"].ToString(), msg, date_time);
                            DataListMain.DataSource = dt.DefaultView;
                            DataListMain.DataBind();
                        }
                        else
                        {
                            dt.Rows.Add(chat_reg_id, chat_fn, chat_ln, chat_profile_photo, msg, date_time);
                            DataListMain.DataSource = dt.DefaultView;
                            DataListMain.DataBind();
                        }
                    }
                }
                else
                {
                    dt.Clear();
                    DataListMain.DataSource = dt.DefaultView;
                    DataListMain.DataBind();
                }
                dt.Clear();
          }
    }
    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onOpenChat")
        {
            int reg_id = Convert.ToInt32(Session["reg_id"]);
            int chat_reg_id = Convert.ToInt32(e.CommandArgument);
            Session["chat_reg_id"] = chat_reg_id;
            chat.delete_msg(reg_id, chat_reg_id, delete_date, delete_time);
            dataListHeaderBind();
            dataListMainBind();
            txt_msg.Visible = true;
            btn_send.Visible = true;
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        dataListMainBind();
    }

    protected void btn_send_Click(object sender, EventArgs e)
    {
        string date_time = DateTime.Now.ToString();
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        int chat_reg_id = Convert.ToInt32(Session["chat_reg_id"]);
        int i = chat.insert_msg(reg_id, chat_reg_id, txt_msg.Text, date_time);
        if (i > 0)
        {
            txt_msg.Text = "";
            dataListHeaderBind();
            dataListMainBind();
            txt_msg.Focus();
        }
    }
}