using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news_con : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try{
            int id = Convert.ToInt32(Request.QueryString["id"]);
            using (var db = new CstwebEntities())
            {
                var ne = from it in db.news
                         where it.id == id
                         select it;
                Repeater1.DataSource=ne.ToList();
                Repeater1.DataBind();
                try
                {
                    int cl = db.news.FirstOrDefault(a => a.id == id).@class;
                    news ne1 = db.news.OrderByDescending(a=>a.id).FirstOrDefault(a => a.id < id && a.@class == cl);
                    Linpre.Text = ne1.title;
                    Linpre.PostBackUrl = "wantted-con.aspx?id=" + ne1.id.ToString();
                }
                catch {
                    Linpre.Text = "没有了";
                }
                try
                {
                    int cl = db.news.FirstOrDefault(a => a.id == id).@class;
                    news ne2 = db.news.FirstOrDefault(a => a.id > id && a.@class == cl);
                    Linnext.Text = ne2.title;
                    Linnext.PostBackUrl = "wantted-con.aspx?id=" + ne2.id.ToString();
                }
                catch
                {
                    Linnext.Text = "没有了";
                }

            }
        }catch{
            Response.Redirect("wantted-list.aspx");
        }
    }

}