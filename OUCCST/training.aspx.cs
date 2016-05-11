using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class training : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new CstwebEntities())
            {
                var re = from it in db.news
                         where it.@class == 5
                         select it;
                Repeater1.DataSource = re.ToList();
                Repeater1.DataBind();
            }
        }
    }
}