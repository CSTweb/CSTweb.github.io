using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newsadd1 : System.Web.UI.Page
{
    int neid;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            neid = Convert.ToInt32(Request.QueryString["id"]);
            if (!IsPostBack)
            {
                using (var db = new CstwebEntities())
                {
                    labs ne = db.labs.First<labs>(a => a.id == neid);
                    TxtTitle.Text = ne.labname;
                    myEditor.InnerHtml = ne.labbody;
                }
            }
        }
        catch
        {
            neid = 0;
        }

    }
    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("labslist.aspx");
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string str = Server.HtmlDecode(myEditor.InnerHtml);
        if (TxtTitle.Text.Trim() == "") Response.Write("<script>alert('标题不能为空')</script>");
        else if (str.Trim() == "") Response.Write("<script>alert('文章不能为空')</script>");
        else
            try
            {
                using (var db = new CstwebEntities())
                {
                    labs ne;
                    if (neid == 0)
                        ne = new labs();
                    else
                        ne = db.labs.First<labs>(a => a.id == neid);

                    ne.labname = TxtTitle.Text.Trim();
                    ne.labbody = str.Trim();
                    ne.addtime = DateTime.Now;
                    if (neid == 0)
                    {
                        db.labs.Add(ne);
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('发布成功');window.location = 'labslist.aspx';</script>");
                    }
                    else
                    {
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'labslist.aspx';</script>");
                    }

                }
            }
            catch
            {
                Response.Write("<script>alert('失败')</script>");
            }
    }
}