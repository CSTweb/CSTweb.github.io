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
                    games ne = db.games.First<games>(a => a.id == neid);
                    TxtTitle.Text = ne.gamename;
                    myEditor.InnerHtml = ne.body;
                    DdlStatus.SelectedValue = ne.status.ToString();
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
        Response.Redirect("games.aspx");
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
                    games ne;
                    if (neid == 0)
                        ne = new games();
                    else
                        ne = db.games.First<games>(a => a.id == neid);

                    ne.gamename = TxtTitle.Text.Trim();
                    ne.body = str.Trim();
                    ne.addtime = DateTime.Now;
                    int status = Convert.ToInt16(DdlStatus.SelectedValue);
                    ne.status = status;
                    if (neid == 0)
                    {
                        db.games.Add(ne);
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('发布成功');window.location = 'games.aspx';</script>");
                    }
                    else
                    {
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'games.aspx';</script>");
                    }

                }
            }
            catch
            {
                Response.Write("<script>alert('失败')</script>");
            }
    }
}