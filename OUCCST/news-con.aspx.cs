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
                    news ne1 = db.news.OrderByDescending(a=>a.id).FirstOrDefault(a => a.id < id && a.@class == 1);
                    Linpre.Text = ne1.title;
                    Linpre.PostBackUrl = "news-con.aspx?id=" + ne1.id.ToString();
                }
                catch {
                    Linpre.Text = "没有了";
                }
                try
                {
                    news ne2 = db.news.FirstOrDefault(a => a.id > id && a.@class == 1);
                    Linnext.Text = ne2.title;
                    Linnext.PostBackUrl = "news-con.aspx?id=" + ne2.id.ToString();
                }
                catch
                {
                    Linnext.Text = "没有了";
                }

            }
        }catch{}
    }

}