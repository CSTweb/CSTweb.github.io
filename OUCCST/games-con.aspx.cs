using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news_con : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try{
            int id = Convert.ToInt32(Request.QueryString["id"]);
            using (var db = new CstwebEntities())
            {
                var ne = from it in db.games
                         where it.id == id
                         select it;
                Repeater1.DataSource=ne.ToList();
                Repeater1.DataBind();
               

            }
        }catch{
            Response.Redirect("games-list.aspx");
        }
    }

}