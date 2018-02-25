using System;
using BAL;

public partial class registration : System.Web.UI.Page
{
    BLayer bl = new BLayer();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["profile_id"]) != "")
        {
            Response.Redirect("profile_view.aspx");
        }
        if (!IsPostBack)
        {
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string profile_photo_url = "";
        int reg_id = Convert.ToInt32(Session["reg_id"].ToString());
        string currentDateTime = string.Format("{0:mmddyyhhmmss}", DateTime.UtcNow);
        if (fu_profile_photo.HasFile)
        {
            profile_photo_url = "~/Lib/images/" + reg_id + "_" + currentDateTime + ".jpg";
            fu_profile_photo.SaveAs(Server.MapPath(profile_photo_url));

            Session["profile_photo"] = profile_photo_url;
        }
        int i = bl.insert_profile(reg_id, txt_dob.Text, Convert.ToInt32(txt_age.Text), txt_designation.Text, txt_qualification.Text, txta_description.Text, profile_photo_url);

        int profile_id = bl.get_profile_id(reg_id);
        Session["profile_id"] = profile_id;

        Response.Redirect("profile_view.aspx");
    }
}