using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_lessons1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            initDDL();
            using (var db = new CstwebEntities())
            {
                var s = from it in db.lessonandclass
                        select it;
                Repeater1.DataSource = s.ToList();
                Repeater1.DataBind();
            }
        }
    }
    protected void initDDL()
    {
        DDLClass.Items.Add(new ListItem("全部", "0"));
        using (var db = new CstwebEntities())
        {
            var d1 = (from it in db.lesclass
                      select it).ToList();
            int i = 0;
            for (i = 0; i < d1.Count; i++)
            {
                DDLClass.Items.Add(new ListItem(d1[i].name, d1[i].id.ToString()));
            }
        }

    }
    protected void BtnADD_Click(object sender, EventArgs e)
    {
        Response.Redirect("lesson.aspx");
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            using (var db = new CstwebEntities())
            {
                int id = Convert.ToInt32(e.CommandArgument);
                var le1 = db.lesrelation.Where(a => a.lesson == id).ToList();
                try
                {
                    db.lesrelation.Remove(le1[0]);
                    db.SaveChanges();
                }
                catch { }
                try
                {
                    db.lesrelation.Remove(le1[1]);
                    db.SaveChanges();
                }
                catch { }
                try
                {
                    db.lesrelation.Remove(le1[2]);
                    db.SaveChanges();
                }
                catch { }
                lesson les = db.lesson.FirstOrDefault(a => a.id == id);

                db.lesson.Remove(les);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功');window.location = 'lessons.aspx';</script>");
            }
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        using (var db = new CstwebEntities())
        {
            if (DDLClass.SelectedValue == "0")
            {
                var se = (from it in db.lessonandclass
                          select it).ToList();
                Repeater1.DataSource = se.Where(a => a.classname.IndexOf(TxtName.Text.Trim()) > 0);
                Repeater1.DataBind();
            }
            else
            {
                int cl = Convert.ToInt32(DDLClass.SelectedValue);
                var se = from it in db.lessonandclass
                         where it.lesscla == cl
                         select it;
                Repeater1.DataSource = se.Where(a => a.classname.IndexOf(TxtName.Text.Trim()) > 0);
                Repeater1.DataBind();
            }
        }
    }
}