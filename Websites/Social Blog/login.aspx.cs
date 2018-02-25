using System;
using System.Linq;
using BAL;
using System.Data;

public partial class registration : System.Web.UI.Page
{
    BLayer bl = new BLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void lnk_forget_pswd_Click(object sender, EventArgs e)
    {
        Response.Redirect("forget_pswd.aspx");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        DataSet ds = bl.get_user(txt_email.Text, txt_pswd.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["reg_id"] = ds.Tables[0].Rows[0][0].ToString();
            Session["fn"] = ds.Tables[0].Rows[0][1].ToString();
            Session["ln"] = ds.Tables[0].Rows[0][2].ToString();
            Session["email"] = ds.Tables[0].Rows[0][11].ToString();
            ds.Clear();

            ds = bl.get_profile_by_reg_id(Convert.ToInt32(Session["reg_id"]));
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["profile_id"] = ds.Tables[0].Rows[0][0].ToString();
                Session["profile_photo"] = ds.Tables[0].Rows[0][7].ToString();
            }
            else
            {
                Session["profile_photo"] = "~/Lib/images/default_profile_photo.jpg";
            }
            Response.Redirect("timeline.aspx");
        }
        else
        {
            Response.Write("<script language='JavaScript'>alert('Email or Password are Invalid')</script>");
        }
    }
}