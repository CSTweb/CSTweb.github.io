using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lesson1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            initDDL();
            FindQuery();
        }
        FindSession();
    }

    protected void FindSession()
    {
        try
        {
            using (var db = new CstwebEntities())
            {
                lesson les = (lesson)Session["less"];
                TxtLessonName.Text = les.classname;
                TxtTeach.Text = les.teach.ToString();
                TxtExp.Text = les.experiment.ToString();
                TxtCredits.Text = les.credits.ToString();
                DDLClass.SelectedValue = les.lesscla.ToString();
                int id;
                if (Session["First1"] == null)
                {
                    Label1.Text = "0";
                    LinFirst1.Text = "先修课程1";
                }
                else
                {
                    Label1.Text = Session["First1"].ToString();
                    id = Convert.ToInt32(Label1.Text);
                    LinFirst1.Text = db.lesson.First(a => a.id == id).classname.ToString(); ;
                }
                if (Session["First2"] == null)
                {
                    LinFirst2.Text = "先修课程2";
                    Label2.Text = "0";
                }
                else
                {
                    Label2.Text = Session["First2"].ToString();
                    id = Convert.ToInt32(Label2.Text);
                    LinFirst2.Text = db.lesson.First(a => a.id == id).classname.ToString(); ;
                }
                if (Session["First3"] == null)
                {
                    LinFirst3.Text = "先修课程3";
                    Label3.Text = "0";
                }
                else
                {
                    Label3.Text = Session["First3"].ToString();
                    id = Convert.ToInt32(Label3.Text);
                    LinFirst3.Text = db.lesson.First(a => a.id == id).classname.ToString(); ;
                }
                Session["FList"] = null;
                Session["Less"] = null;
                Session["First1"] = null;
                Session["First2"] = null;
                Session["First3"] = null;
            }
        }
        catch
        {
        }
    }

    protected void FindQuery()
    {
        try
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Session["lessonID"] = id.ToString();
            using (var db = new CstwebEntities())
            {
                lesson les = db.lesson.First(a => a.id == id);
                TxtLessonName.Text = les.classname;
                TxtTeach.Text = les.teach.ToString();
                TxtExp.Text = les.experiment.ToString();
                TxtCredits.Text = les.credits.ToString();
                try
                {
                    LblFilename.Text = les.lesfile;
                }
                catch { }
                myEditor.InnerHtml = les.etc;
                DDLClass.SelectedValue = les.lesclass.ToString();
                var less = db.lesrelation.Where(a => a.lesson == id).ToList();
                try
                {
                    id = Convert.ToInt32(less[0].firstlesson);
                    Label1.Text = id.ToString();
                    LinFirst1.Text = db.lesson.First(a => a.id == id).classname;
                    try
                    {
                        id = Convert.ToInt32(less[1].firstlesson);
                        Label2.Text = id.ToString();
                        LinFirst2.Text = db.lesson.First(a => a.id == id).classname;
                        try
                        {
                            id = Convert.ToInt32(less[2].firstlesson);
                            Label3.Text = id.ToString();
                            LinFirst3.Text = db.lesson.First(a => a.id == id).classname;
                        }
                        catch { }
                    }
                    catch { }
                }
                catch
                {
                }
            }
        }
        catch { }
    }


    protected void initDDL()
    {
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

    protected void SaveSession()
    {
        using (var db = new CstwebEntities())
        {
            lesson les = new lesson();
            int temp;
            double cr;
            if (TxtLessonName.Text.Trim() != "") les.classname = TxtLessonName.Text.Trim();
            temp = Convert.ToInt32(DDLClass.SelectedValue);
            les.lesscla = temp;
            try
            {
                if (TxtTeach.Text.Trim() != "")
                {
                    temp = Convert.ToInt32(TxtTeach.Text.Trim());
                    les.teach = temp;
                }
            }
            catch { }
            try
            {
                if (TxtExp.Text.Trim() != "")
                {
                    temp = Convert.ToInt32(TxtExp.Text.Trim());
                    les.experiment = temp;
                }
            }
            catch { }
            try
            {
                if (TxtCredits.Text.Trim() != "")
                {
                    cr = Convert.ToDouble(TxtCredits.Text.Trim());
                    les.credits = cr;
                }
            }
            catch { }
            try
            {
                string tempstr = Server.HtmlDecode(myEditor.InnerHtml);
                if (tempstr.Trim() != "")
                {
                    les.etc = tempstr;
                }
            }
            catch { }
            try
            {
                if (LblFilename.Text != "")
                {
                    les.lesfile = LblFilename.Text;
                }
            }
            catch { }
            Session["Less"] = les;
            if (Label1.Text == "0") Session["First1"] = null;
            else Session["First1"] = Label1.Text;
            if (Label2.Text == "0") Session["First2"] = null;
            else Session["First2"] = Label2.Text;
            if (Label3.Text == "0") Session["First3"] = null;
            else Session["First3"] = Label3.Text;
        }
    }


    protected void LinFirst1_Click(object sender, EventArgs e)
    {
        SaveSession();
        Session["FList"] = "1";
        Response.Redirect("lessonlist.aspx");
    }
    protected void LinFirst2_Click(object sender, EventArgs e)
    {
        SaveSession();
        Session["FList"] = "2";
        Response.Redirect("lessonlist.aspx");
    }
    protected void LinFirst3_Click(object sender, EventArgs e)
    {
        SaveSession();
        Session["FList"] = "3";
        Response.Redirect("lessonlist.aspx");
    }
    protected void BtnReturn_Click(object sender, EventArgs e)
    {
        Session["FList"] = null;
        Session["Less"] = null;
        Session["First1"] = null;
        Session["First2"] = null;
        Session["First3"] = null;
        Session["lessonID"] = null;
        Response.Redirect("lessons.aspx");
    }

    protected bool IsOK()
    {
        if (TxtLessonName.Text.Trim() == "")
        {
            Response.Write("<script>alert('课程名不能为空')</script>");
            return false;
        }
        if (TxtTeach.Text.Trim() == "")
        {
            Response.Write("<script>alert('教授学时不能为空')</script>");
            return false;
        }

        if (TxtExp.Text.Trim() == "")
        {
            Response.Write("<script>alert('实验学时不能为空')</script>");
            return false;
        }
        if (TxtCredits.Text.Trim() == "")
        {
            Response.Write("<script>alert('学分不能为空')</script>");
            return false;
        }
        
        return true;
    }

    protected void BtnPost_Click(object sender, EventArgs e)
    {
        int temp;
        double cr;
        if (IsOK())
        {
            using (var db = new CstwebEntities())
            {
                if (Session["lessonID"].ToString() != "0")
                {
                    try
                    {
                        temp = Convert.ToInt32(Session["lessonID"].ToString());
                        var del = db.lesrelation.Where(a => a.lesson == temp).ToList();
                        lesrelation les1;
                        try
                        {
                            les1 = del[0];
                            db.lesrelation.Remove(les1);
                            db.SaveChanges();
                        }
                        catch { }
                        try
                        {
                            les1 = del[1];
                            db.lesrelation.Remove(les1);
                            db.SaveChanges();
                        }
                        catch { }
                        try
                        {
                            les1 = del[2];
                            db.lesrelation.Remove(les1);
                            db.SaveChanges();
                        }
                        catch { }
                        lesson les = db.lesson.First(a => a.id == temp);
                        les.classname = TxtLessonName.Text.Trim();
                        cr = Convert.ToDouble(TxtCredits.Text.Trim());
                        les.credits = cr;
                        temp = Convert.ToInt32(TxtTeach.Text.Trim());
                        les.teach = temp;
                        temp = Convert.ToInt32(TxtExp.Text.Trim());
                        les.experiment = temp;
                        temp = Convert.ToInt32(DDLClass.SelectedValue);
                        les.lesscla = temp;
                        temp = Convert.ToInt32(Session["lessonID"].ToString());
                        if (LblFilename.Text != "")
                        {
                            les.lesfile = LblFilename.Text;
                        }
                        string tempstr = Server.HtmlDecode(myEditor.InnerHtml);
                        les.etc = tempstr.Trim();
                        les1 = new lesrelation();
                        les1.lesson = temp;
                        db.SaveChanges();
                        if (Label1.Text != "0")
                        {
                            temp = Convert.ToInt32(Label1.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        if (Label2.Text != "0")
                        {
                            temp = Convert.ToInt32(Label2.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        if (Label3.Text != "0")
                        {
                            temp = Convert.ToInt32(Label3.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        Session["FList"] = null;
                        Session["Less"] = null;
                        Session["First1"] = null;
                        Session["First2"] = null;
                        Session["First3"] = null;
                        Session["lessonID"] = null;
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'lessons.aspx';</script>");
                    }
                    catch
                    {
                        Response.Write("<script>alert('修改失败')</script>");
                    }
                }
                else
                {
                    try
                    {
                        lesson les = new lesson();
                        lesrelation les1 = new lesrelation();
                        les.classname = TxtLessonName.Text.Trim();
                        cr = Convert.ToDouble(TxtCredits.Text.Trim());
                        les.credits = cr;
                        temp = Convert.ToInt32(TxtTeach.Text.Trim());
                        les.teach = temp;
                        temp = Convert.ToInt32(TxtExp.Text.Trim());
                        les.experiment = temp;
                        temp = Convert.ToInt32(DDLClass.SelectedValue);
                        les.lesscla = temp;
                        temp = Convert.ToInt32(Session["lessonID"].ToString());
                        if (LblFilename.Text != "")
                        {
                            les.lesfile = LblFilename.Text;
                            
                        }
                        string tempstr = Server.HtmlDecode(myEditor.InnerHtml);
                        les.etc = tempstr.Trim();
                        db.lesson.Add(les);
                        db.SaveChanges();
                        temp = db.lesson.First(a => a.classname == TxtLessonName.Text.Trim()).id;
                        les1.lesson = temp;
                        if (Label1.Text != "0")
                        {
                            temp = Convert.ToInt32(Label1.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        if (Label2.Text != "0")
                        {
                            temp = Convert.ToInt32(Label2.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        if (Label3.Text != "0")
                        {
                            temp = Convert.ToInt32(Label3.Text);
                            les1.firstlesson = temp;
                            db.lesrelation.Add(les1);
                            db.SaveChanges();
                        }
                        Session["FList"] = null;
                        Session["Less"] = null;
                        Session["First1"] = null;
                        Session["First2"] = null;
                        Session["First3"] = null;
                        Session["lessonID"] = null;
                        Response.Write("<script language=javascript>alert('添加成功');window.location = 'lessons.aspx';</script>");

                    }
                    catch { Response.Write("<script>alert('添加失败')</script>"); }
                }
            }
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        string strName = FileUploadControl.PostedFile.FileName;//使用fileupload控件获取上传文件的文件名
        if (strName != "")//如果文件名存在
        {
            bool fileOK = false;
            int i = strName.LastIndexOf(".");//获取。的索引顺序号，在这里。代表图片名字与后缀的间隔
            string kzm = strName.Substring(i);//获取文件扩展名的另一种方法 string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();


            string xiangdui = @"~\files\";//设置文件相对网站根目录的保存路径 ，~号表示当前目录，在此表示根目录下的images文件夹
            string juedui = Server.MapPath("~\\files\\");//设置文件保存的本地目录绝对路径，对于路径中的字符“＼”在字符串中必须以“＼＼”表示，因为“＼”为特殊字符。或者可以使用上一行的给路径前面加上＠
            string newFileName = juedui + strName;
            if (FileUploadControl.HasFile)//验证 FileUpload 控件确实包含文件
            {

                String[] allowedExtensions = { ".doc", ".docx", ".txt" };
                for (int j = 0; j < allowedExtensions.Length; j++)
                {
                    if (kzm == allowedExtensions[j])
                    {
                        fileOK = true;
                    }
                }
            }
            if (fileOK)
            {
                try
                {
                    // 判定该路径是否存在
                    if (!Directory.Exists(juedui))
                        Directory.CreateDirectory(juedui);
                    LblFilename.Text = xiangdui + strName;
                    StatusLabel.Text = "文件上传成功.";
                    FileUploadControl.PostedFile.SaveAs(newFileName);//将图片存储到服务器上
                }
                catch (Exception)
                {
                    StatusLabel.Text = "文件上传失败.";
                }
            }
            else
            {
                StatusLabel.Text = "只能够上传word文档.";
            }
        }
    }

}