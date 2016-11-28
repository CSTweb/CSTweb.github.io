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

            databind2(2, RptLevel2);
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
                    orderby it.accounts
                     select it;
            rpt1.DataSource = t.ToList();
            rpt1.DataBind();
        }
    }

    protected void databind2(int i, Repeater rpt1)
    {
        using (var db = new CstwebEntities())
        {
            var t = (from it in db.teachers
                     where it.teacherlevel == i
                     select it).ToList();
            List<teacherview> tv = new List<teacherview>();
            for (int m = 0; m < t.Count; m++)
            {
                teacherview tvdemo = new teacherview();
                tvdemo.id = t[m].id;
                tvdemo.name = t[m].name;
                int temp = t[i].id;
                tvdemo.account = db.accounts.First(a => a.teacherid == temp).account;
                tv.Add(tvdemo);
            }
            tv.OrderBy(a => a.account);
            rpt1.DataSource = tv;
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