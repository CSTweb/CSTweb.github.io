using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            using (var db = new CstwebEntities())
            {
                var t = (from it in db.teachers
                         where it.title == 1
                         select it).ToList();
                List<teacherview> tv = new List<teacherview>();
                for(int i = 0; i < t.Count; i++)
                {
                    teacherview tvdemo = new teacherview();
                    tvdemo.id = t[i].id;
                    tvdemo.name = t[i].name;
                    int temp = t[i].id;
                    tvdemo.account = db.accounts.First(a => a.teacherid == temp).account;
                    tv.Add(tvdemo);
                }
                tv.OrderBy(a=>a.account);
                RptTitle1.DataSource = tv;
                RptTitle1.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = (from it in db.teachers
                        where it.title == 2 || it.title == 4 || it.title == 5
                        select it).ToList();
                List<teacherview> tv = new List<teacherview>();
                for (int i = 0; i < t.Count; i++)
                {
                    teacherview tvdemo = new teacherview();
                    tvdemo.id = t[i].id;
                    tvdemo.name = t[i].name;
                    int temp = t[i].id;
                    tvdemo.account = db.accounts.First(a => a.teacherid == temp).account;
                    tv.Add(tvdemo);
                }
                tv.OrderBy(a => a.account);
                RptTitle2.DataSource = tv;
                RptTitle2.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = (from it in db.teachers
                        where it.title == 3 || it.title == 6 || it.title == 7
                        select it).ToList();
                List<teacherview> tv = new List<teacherview>();
                for (int i = 0; i < t.Count; i++)
                {
                    teacherview tvdemo = new teacherview();
                    tvdemo.id = t[i].id;
                    tvdemo.name = t[i].name;
                    int temp = t[i].id;
                    tvdemo.account = db.accounts.First(a => a.teacherid == temp).account;
                    tv.Add(tvdemo);
                }
                tv.OrderBy(a => a.account);
                RptTitle3.DataSource = tv;
                RptTitle3.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = (from it in db.teachers
                        where it.title == 12 || it.title == 13
                        select it).ToList();
                List<teacherview> tv = new List<teacherview>();
                for (int i = 0; i < t.Count; i++)
                {
                    teacherview tvdemo = new teacherview();
                    tvdemo.id = t[i].id;
                    tvdemo.name = t[i].name;
                    int temp = t[i].id;
                    tvdemo.account = db.accounts.First(a => a.teacherid == temp).account;
                    tv.Add(tvdemo);
                }
                tv.OrderBy(a => a.account);
                RptTitle8.DataSource = tv;
                RptTitle8.DataBind();
            }

            using (var db = new CstwebEntities())
            {
                var a= from it in db.teachers
                       orderby it.time descending
                       select it.time;
                LBLTime.Text = a.First().ToString("yyyy年MM月dd日");       
            }
        }
    }

    protected void databind1(int i, Repeater rpt1)
    {
        using (var db = new CstwebEntities()) 
        {
            var t = from it in db.teachers
                     where it.title == i
                    orderby it.name
                     select it;
            rpt1.DataSource = t.ToList();
            rpt1.DataBind();
        }
    }

    protected void databind2(int i, Repeater rpt1)
    {
        using (var db = new CstwebEntities())
        {
            var t = from it in db.teachers
                    where it.teacherlevel == i
                    orderby it.name
                    select it;
            rpt1.DataSource = t.ToList();
            rpt1.DataBind();
        }
    }


}
public class teacherview
{
    public int id { get; set; }
    public string name { get; set; }
    public string account { get; set; }
}