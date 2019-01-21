using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newsadd1 : System.Web.UI.Page
{
    int neid;
    int newsclass;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            neid = Convert.ToInt32(Request.QueryString["id"]);
            if (!IsPostBack)
            {
                using (var db = new CstwebEntities())
                {
                    cooperation ne = db.cooperation.First<cooperation>(a => a.id == neid);
                    newsclass = ne.@class;
                    TxtTitle.Text = ne.cooperation1;
                    myEditor.InnerHtml = ne.body;
                }
            }
        }
        catch
        {
            neid = 0;
            if (!Int32.TryParse(Request.QueryString["co"], out newsclass)) newsclass = 1;
        }
        if (IsPostBack) newsclass = Convert.ToInt32(DdlNew.SelectedValue);
        if (!IsPostBack)
        {
            Refresh_DDlclss();
        }


    }

    protected void Refresh_DDlclss()
    {
        DdlNew.ClearSelection();
        for (int i = 0; i < DdlNew.Items.Count; i++)
        {
            if (DdlNew.Items[i].Value == newsclass.ToString()) { DdlNew.Items[i].Selected = true; break; }
        }
    }

    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString());
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
                    cooperation ne;
                    if (neid == 0)
                        ne = new cooperation();
                    else
                        ne = db.cooperation.First<cooperation>(a => a.id == neid);

                    ne.cooperation1 = TxtTitle.Text.Trim();
                    ne.body = str.Trim();
                    ne.@class =Convert.ToInt32(DdlNew.SelectedValue);
                    ne.addtime = DateTime.Now;
                    if (neid == 0)
                    {
                        db.cooperation.Add(ne);
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('发布成功');window.location = 'cooperation.aspx?co=" + newsclass.ToString() + "';</script>");
                    }
                    else
                    {
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'cooperation.aspx?co=" + newsclass.ToString() + "';</script>");
                    }

                }
            }
            catch
            {
                Response.Write("<script>alert('失败')</script>");
            }
    }
}