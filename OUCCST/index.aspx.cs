using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new CstwebEntities())
            {
                var se1 = from it in db.news
                          where it.@class == 14
                          orderby it.time descending
                          select it;
                Repeater1.DataSource = se1.Take(7).ToList();
                var se2 = from it in db.news
                          where it.@class == 1
                          orderby it.time descending
                          select it;
                Repeater2.DataSource = se2.Take(7).ToList();
                var se3 = from it in db.news
                          where it.@class == 4
                          orderby it.time descending
                          select it;
                Repeater3.DataSource = se3.Take(7).ToList();
                Repeater1.DataBind();
                Repeater2.DataBind();
                Repeater3.DataBind();
            }
        }
    }
}