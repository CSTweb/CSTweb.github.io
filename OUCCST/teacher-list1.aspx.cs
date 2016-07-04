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
                var t = from it in db.teachers
                        where it.title == 1
                        select it;
                RptTitle1.DataSource = t.ToList();
                RptTitle1.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = from it in db.teachers
                        where it.title == 2 || it.title == 4 || it.title == 5
                        select it;
                RptTitle2.DataSource = t.ToList();
                RptTitle2.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = from it in db.teachers
                        where it.title == 3 || it.title == 6 || it.title == 7
                        select it;
                RptTitle3.DataSource = t.ToList();
                RptTitle3.DataBind();
            }
            using (var db = new CstwebEntities())
            {
                var t = from it in db.teachers
                        where it.title == 12 || it.title == 13 
                        select it;
                RptTitle8.DataSource = t.ToList();
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
                    select it;
            rpt1.DataSource = t.ToList();
            rpt1.DataBind();
        }
    }

}