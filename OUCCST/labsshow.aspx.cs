using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class labsshow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            using (var db = new CstwebEntities())
            {
                var data = from it in db.labs
                           select it;
                Repeater1.DataSource = data.ToList();
                Repeater1.DataBind();
            }
        }
    }
}