using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin2 : System.Web.UI.MasterPage
{
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacherid"] == null)
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
