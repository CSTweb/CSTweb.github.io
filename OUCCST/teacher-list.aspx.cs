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
            databind1(1, RptTitle1);
            databind1(2, RptTitle2);
            databind1(3, RptTitle3);
            databind1(4, RptTitle4);
            databind1(5, RptTitle5);
            databind1(6, RptTitle6);
            databind1(7, RptTitle7);
            databind2(3, RptLevel3);
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