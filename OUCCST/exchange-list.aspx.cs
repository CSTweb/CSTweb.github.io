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
                var a= from it in db.exchange
                       orderby it.grade descending
                       select it;
                Repeater1.DataSource = a.ToList();
                Repeater1.DataBind();
            }
        }
    }



}