using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            databind(2, Rptclass1);
            databind(3, Rptclass2);
            databind(4, Rptclass3);
            databind(5, Rptclass4);
            databind(6, Rptclass5);
        }
    }
    protected void databind(int i, Repeater r1)
    {
        using (var db = new CstwebEntities())
        {
            var se = (from it in db.lesson
                     where it.lesscla == i
                     select it).ToList();
            r1.DataSource = se;
            r1.DataBind();
        }
    }
}