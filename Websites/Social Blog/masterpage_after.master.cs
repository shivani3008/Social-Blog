using System;
using BAL;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["reg_id"] == null)
                Response.Redirect("login.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
        }
        lbl_user.Visible = false;
        if (Session["reg_id"] != null || Convert.ToString(Session["reg_id"]) != "")
        {
            lbl_user.Visible = true;
          
            lbl_user.Text = Session["fn"].ToString() + " " + Session["ln"].ToString();

            lbl_user1.Visible = true;

            lbl_user1.Text = lbl_user.Text;

            BLayer.Request req = new BLayer.Request();
            DataSet ds = req.getAllRequest(Convert.ToInt32(Session["reg_id"]), 0);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbl_total_request.Text = ds.Tables[0].Rows.Count.ToString();
            }
        }
        if (Session["profile_photo"] != null || Convert.ToString(Session["profile_photo"]) != "")
        {
            profile_photo.ImageUrl = Session["profile_photo"].ToString();
            profile_photo1.ImageUrl = Session["profile_photo"].ToString();
        }
        else
        {
            profile_photo.ImageUrl = "~/Lib/images/default_profile_photo.jpg";
            profile_photo1.ImageUrl = "~/Lib/images/default_profile_photo.jpg";
        }
    }
}