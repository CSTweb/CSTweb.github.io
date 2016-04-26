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

            List<course1> co = new List<course1>();
            course1 cour;
            string first = "";
            foreach (lesson less in se)
            {
                cour = new course1();
                cour.id = less.id;
                cour.lesscla = less.lesscla;
                cour.teach = less.teach;
                cour.experiment = less.experiment;
                cour.credits = less.credits;
                cour.classname = less.classname;
                var rela = (from it in db.lesrelation
                            where it.lesson == less.id
                            select it).ToList();
                foreach (lesrelation le in rela)
                {
                    first += db.lesson.First(a => a.id == le.firstlesson).classname +"、";
                }
                if (first == "")
                {
                    first = "无";
                }
                else
                    first = first.Substring(0, first.Length - 1);
                cour.first = first;
                co.Add(cour);
                first = "";

            }

            r1.DataSource = co;
            r1.DataBind();
        }
    }

    public class course1
    {
        public int id { get; set; }
        public string classname { get; set; }
        public int teach { get; set; }
        public int experiment { get; set; }
        public double credits { get; set; }
        public int lesscla { get; set; }
        public string first { get; set; }
    }
}