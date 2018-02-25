using BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registration : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drp_country_code.Items.Add(new ListItem("Select Country Code", "0", true));

            drp_country.Items.Clear();
            drp_country.Items.Add(new ListItem("Select Country", "0", true));
            DataSet ds = bl.get_country();
            ds.Tables[0].DefaultView.Sort = "country_name";
            drp_country.DataSource = ds.Tables[0];
            drp_country.DataTextField = "country_name";
            drp_country.DataValueField = "country_id";
            drp_country.DataBind();
            ds.Clear();

            ds = bl.get_country_code();
            ds.Tables[0].DefaultView.Sort = "country_name";
            ds.Tables[0].Columns.Add("name_code");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i][3] = ds.Tables[0].Rows[i][2] + " (" + ds.Tables[0].Rows[i][1] + ")";
            }
            drp_country_code.DataSource = ds.Tables[0];
            drp_country_code.DataTextField = "name_code";
            drp_country_code.DataValueField = "country_code_id";
            drp_country_code.DataBind();
            ds.Clear();
        }
    }

    protected void drp_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        drp_state.Items.Clear();
        drp_state.Items.Add(new ListItem("Select State", "0", true));
        DataSet ds = bl.get_state(Convert.ToInt32(drp_country.SelectedValue));
        ds.Tables[0].DefaultView.Sort = "state_name";
        drp_state.DataSource = ds.Tables[0];
        drp_state.DataTextField = "state_name";
        drp_state.DataValueField = "state_id";
        drp_state.DataBind();
        ds.Clear();
    }

    protected void drp_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        drp_city.Items.Clear();
        drp_city.Items.Add(new ListItem("Select City", "0", true));
        DataSet ds = bl.get_city(Convert.ToInt32(drp_state.SelectedValue));
        ds.Tables[0].DefaultView.Sort = "city_name";
        drp_city.DataSource = ds.Tables[0];
        drp_city.DataTextField = "city_name";
        drp_city.DataValueField = "city_id";
        drp_city.DataBind();
        ds.Clear();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int i = bl.insert_user(txt_fn.Text, txt_ln.Text, Convert.ToInt32(drp_country.SelectedValue), Convert.ToInt32(drp_state.SelectedValue), Convert.ToInt32(drp_country.SelectedValue), Convert.ToInt32(drp_country_code.SelectedValue), txt_mob_no.Text, rb_gender.SelectedValue, txt_email.Text, txt_pswd.Text);
        if (i > 0)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Email or Password')</script>");
        }
    }
}