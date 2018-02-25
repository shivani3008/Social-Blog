using System;
using BAL;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class stu_login : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (txt_email.Text != string.Empty)
        {
            string pswd;
            string fn;
            string ln;
            DataSet ds = bl.get_user_by_email(txt_email.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                pswd = ds.Tables[0].Rows[0]["pswd"].ToString();
                fn = ds.Tables[0].Rows[0]["fn"].ToString();
                ln = ds.Tables[0].Rows[0]["ln"].ToString();

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("xyz@gmail.com");  //sender's mail address.
                msg.To.Add(txt_email.Text);
                msg.Subject = "Recover Password";
                msg.Body = " Hello, '" + fn + "' '" + ln + "' <br> Your password is:'" + pswd + "' ";
                msg.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new System.Net.NetworkCredential("xyz@gmail.com", "pswd");
                smtp.EnableSsl = true;
                try
                {
                    smtp.Send(msg);
                    txt_email.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "Advertise", "alert('Password Has been send to your Mail')", true);
                }
                catch(Exception ex)
                {
                    Console.Write(ex.Message);
                }
            }

            
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Advertise", "alert('Invalid Email')", true);
        }
        
    }
}