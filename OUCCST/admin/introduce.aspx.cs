using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_introduce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new CstwebEntities())
        {
            try
            {
                news new1 = db.news.FirstOrDefault(a => a.@class == 0);
                TxtTitle.Text = new1.title;
                myEditor.InnerText = new1.body;
            }
            catch
            {

            }
        }
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        using (var db = new CstwebEntities())
        {
            try
            {
                news new1 = db.news.FirstOrDefault(a => a.@class == 0);
                new1.title = TxtTitle.Text;
                new1.body = myEditor.InnerText;
                new1.time = DateTime.Now;
                db.SaveChanges();
                Response.Write("<script language=javascript>alert('修改成功');window.location = 'introduce.aspx';</script>");
            }
            catch
            {
                news new1 = new news();
                new1.title = TxtTitle.Text;
                new1.body = myEditor.InnerText;
                new1.time = DateTime.Now;
                db.news.Add(new1);
                db.SaveChanges();
                Response.Write("<script language=javascript>alert('修改成功');window.location = 'introduce.aspx';</script>");
            }
        }
    }
}