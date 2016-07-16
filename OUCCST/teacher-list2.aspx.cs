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

            databind2(3, RptLevel3);
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