using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stu_masterpage_before : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
              if (Session["reg_id"] != null)
              {
                  Response.Redirect("timeline.aspx");
              }
        }
    }
}