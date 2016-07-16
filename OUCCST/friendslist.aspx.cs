using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class friendslist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new CstwebEntities())
        {
            var se = from it in db.friends
                     orderby it.id descending
                     select it;
            rpt1.DataSource = se.ToList();
            rpt1.DataBind();
        }
    }
}