using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Write("<script language=javascript>alert('注销成功');window.location = 'login.aspx';</script>");
    }
}
