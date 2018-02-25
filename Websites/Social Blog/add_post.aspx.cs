using System;
using System.Data;
using BAL;

public partial class add_post : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.Post post_obj = new BLayer.Post();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
        string image_url = "";
        int reg_id = Convert.ToInt32(Session["reg_id"].ToString());
        string currentDateTime = string.Format("{0:mmddyyhhmmss}", DateTime.UtcNow);
        if (fu_image.HasFile)
        {
            image_url = "~/Lib/images/" + reg_id + "_" + currentDateTime + ".jpg";
            fu_image.SaveAs(Server.MapPath(image_url));
        }
        string date_time = DateTime.Now.ToString();
        int i = post_obj.add_post(reg_id, txt_caption.Text, image_url, date_time, 0);
        if (i > 0)
        {
            txt_caption.Text = "";
        }
    }
}