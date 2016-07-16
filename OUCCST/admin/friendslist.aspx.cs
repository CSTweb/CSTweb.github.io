using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exchange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            databind();
        }

    }

    protected void databind()
    {
        using (var db = new CstwebEntities())
        {
            var se = from it in db.friends
                     select it;
            Repeater1.DataSource = se.ToList();
            Repeater1.DataBind();
        }
    }

    
    protected void BtnADD_Click(object sender, EventArgs e)
    {
        Response.Redirect("friendseditor.aspx");
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            using (var db = new CstwebEntities())
            {
                int id = Convert.ToInt32(e.CommandArgument);
                friends tea = db.friends.FirstOrDefault(a => a.id == id);
                
                db.friends.Remove(tea);
                
                db.SaveChanges();
                Response.Write("<script>alert('删除成功');window.location = 'friendslist.aspx';</script>");
            }
        }
    }
}