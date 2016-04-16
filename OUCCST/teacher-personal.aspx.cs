using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_personal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                using (var db = new CstwebEntities())
                {
                    var a = from it in db.teachersall
                            where it.id == id
                            select it;
                    Repeater1.DataSource = a.ToList();
                    Repeater1.DataBind();
                }
            }
            catch 
            { 
            }
        }
    }
}