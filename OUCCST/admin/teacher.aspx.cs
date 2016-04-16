using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_teacher : System.Web.UI.Page
{
    int teaid;
    protected void Page_Load(object sender, EventArgs e)
    {
            try
            {
                teaid = Convert.ToInt32(Request.QueryString["id"]);
 
            }
            catch
            {
                teaid = 0;
            }
            if (!IsPostBack)
            {
                initDDL();
                if(teaid !=0)
                using (var db = new CstwebEntities())
                {
                    var tea = db.teachers.FirstOrDefault(a => a.id == teaid);
                    Txtname.Text = tea.name;
                    TxtID.Text = db.accounts.FirstOrDefault(a => a.teacherid == teaid).account;
                    TxtHome.Text = tea.home;
                    Txtfield.Text = tea.field;
                    Txtetc.Text = rstrp(tea.etc);
                    TxtCourse.Text = tea.course; 
                    TxtMail.Text = tea.mail;
                    TxtOffice.Text = tea.office;
                    TxtPaper.Text = rstrp(tea.paper);
                    TxtStudy.Text = rstrp(tea.education);
                    TxtReward.Text = rstrp(tea.reward);
                    TxtPartjob.Text = rstrp(tea.parttimejob);
                    TxtProject.Text = rstrp(tea.project);
                    TxtPhone.Text = tea.phone;
                    DDLLevel.SelectedValue = tea.teacherlevel.ToString();
                    DDLTitle.SelectedValue = tea.title.ToString();
                    ImgIco.ImageUrl = tea.photo;
                }
            }
    }

    protected void initDDL()
    {
        using (var db = new CstwebEntities())
        {
            var d1 = (from it in db.title
                      select it).ToList();
            var d2 = (from it in db.teachlevel
                      select it).ToList();
            int i = 0;
            for (i = 0; i < d1.Count; i++)
            {
                DDLTitle.Items.Add(new ListItem(d1[i].name, d1[i].id.ToString()));
            }
            for (i = 0; i < d2.Count; i++)
            {
                DDLLevel.Items.Add(new ListItem(d2[i].name, d2[i].id.ToString()));
            }
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Txtname.Text.Trim() == "") Response.Write("<script>alert('姓名不能为空')</script>");
        else if (TxtMail.Text.Trim() == "") Response.Write("<script>alert('邮箱不能为空')</script>");
        else if (TxtOffice.Text.Trim() == "") Response.Write("<script>alert('办公室地址不能为空')</script>");
        else if (TxtPhone.Text.Trim() == "") Response.Write("<script>alert('办公室电话不能为空')</script>");
        else if (Txtfield.Text.Trim() == "") Response.Write("<script>alert('研究领域不能为空')</script>");
        else if (TxtCourse.Text.Trim() == "") Response.Write("<script>alert('教授课程不能为空')</script>");
        else if (TxtID.Text.Trim() == "") Response.Write("<script>alert('教工号不能为空')</script>");
        else
            using (var db = new CstwebEntities())
            {
                try
                {
                    if (teaid == 0)
                    {
                        var tea = new teachers();
                        tea.name = Txtname.Text.Trim();
                        tea.mail = TxtMail.Text.Trim();
                        tea.office = TxtOffice.Text.Trim();
                        tea.photo = ImgIco.ImageUrl.ToString();
                        tea.phone = TxtPhone.Text.Trim();
                        tea.field = Txtfield.Text.Trim();
                        tea.course = TxtCourse.Text.Trim();
                        int i = Convert.ToInt32(DDLLevel.SelectedValue);
                        tea.teacherlevel = i;
                        i = Convert.ToInt32(DDLTitle.SelectedValue);
                        tea.title = i;
                        if (Txtetc.Text.Trim() != "") tea.etc = strp(Txtetc.Text.Trim());
                        if (TxtHome.Text.Trim() != "") tea.home = TxtHome.Text.Trim();
                        if (TxtStudy.Text.Trim() != "") tea.education = strp(TxtStudy.Text.Trim());
                        if (TxtReward.Text.Trim() != "") tea.reward = strp(TxtReward.Text.Trim());
                        if (TxtPartjob.Text.Trim() != "") tea.parttimejob = strp(TxtPartjob.Text.Trim());
                        if (TxtPaper.Text.Trim() != "") tea.paper = strp(TxtPaper.Text.Trim());
                        if (TxtProject.Text.Trim() != "") tea.project = strp(TxtProject.Text.Trim());
                        tea.time = System.DateTime.Now;
                        db.teachers.Add(tea);
                        db.SaveChanges();

                        var id1 = db.teachers.FirstOrDefault(a => a.name == Txtname.Text.Trim()).id;
                        accounts ac = new accounts();
                        ac.account = TxtID.Text.Trim();
                        ac.password = PasswordHash.PasswordHash.CreateHash(TxtID.Text.Trim());
                        ac.teacherid = id1;
                        ac.accountlevel = 1;
                        db.accounts.Add(ac);
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('添加成功');window.location = 'teachers.aspx';</script>");

                    }
                    else
                    {
                        teachers tea = db.teachers.First<teachers>(a => a.id == teaid);
                        tea.name = Txtname.Text.Trim();
                        tea.mail = TxtMail.Text.Trim();
                        tea.office = TxtOffice.Text.Trim();
                        tea.photo = ImgIco.ImageUrl.ToString();
                        tea.phone = TxtPhone.Text.Trim();
                        tea.field = Txtfield.Text.Trim();
                        tea.course = TxtCourse.Text.Trim();
                        int i = Convert.ToInt32(DDLLevel.SelectedValue);
                        tea.teacherlevel = i;
                        i = Convert.ToInt32(DDLTitle.SelectedValue);
                        tea.title = i;
                        if (Txtetc.Text.Trim() != "") tea.etc = strp(Txtetc.Text.Trim());
                        //else tea.etc = null;
                        if (TxtHome.Text.Trim() != "") tea.home = TxtHome.Text.Trim();
                        //else tea.home = null;
                        if (TxtStudy.Text.Trim() != "") tea.education = strp(TxtStudy.Text.Trim());
                        //else tea.education = null;
                        if (TxtReward.Text.Trim() != "") tea.reward = strp(TxtReward.Text.Trim());
                        //else tea.reward = null;
                        if (TxtPartjob.Text.Trim() != "") tea.parttimejob = strp(TxtPartjob.Text.Trim());
                        //else tea.parttimejob = null;
                        if (TxtPaper.Text.Trim() != "") tea.paper = strp(TxtPaper.Text.Trim());
                        //else tea.paper = null;
                        if (TxtProject.Text.Trim() != "") tea.project = strp(TxtProject.Text.Trim());
                        //else tea.project = null;
                        tea.time = System.DateTime.Now;
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'teachers.aspx';</script>");
                    }
                       

                }
                catch
                {
                    Response.Write("<script>alert('失败')</script>");
                }

            }
    }
    protected void upload()
    {
        Boolean fileOk = false;
        if (FileUpload1.HasFile)//验证是否包含文件
        {
            //取得文件的扩展名,并转换成小写
            string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
            //验证上传文件是否图片格式
            fileOk = IsImage(fileExtension);

            if (fileOk)
            {
                //对上传文件的大小进行检测，限定文件最大不超过8M
                if (FileUpload1.PostedFile.ContentLength < 8192000)
                {
                    string filepath = "/images/ico/";
                    if (Directory.Exists(Server.MapPath(filepath)) == false)//如果不存在就创建file文件夹
                    {
                        Directory.CreateDirectory(Server.MapPath(filepath));
                    }
                    //string virpath = filepath + CreatePasswordHash(FileUpload1.FileName, 4) + fileExtension;//这是存到服务器上的虚拟路径
                    string virpath = filepath + DateTime.Now.ToString("yyyyMMddhhmmss") + fileExtension;
                    string mappath = Server.MapPath(virpath);//转换成服务器上的物理路径
                    FileUpload1.PostedFile.SaveAs(mappath);//保存图片
                    //显示图片
                    ImgIco.ImageUrl = virpath;
                    //清空提示
                    lbl_pic.Text = "";
                }
                else
                {
                    ImgIco.ImageUrl = "";
                    lbl_pic.Text = "文件大小超出8M！请重新选择！";
                }
            }
            else
            {
                ImgIco.ImageUrl = "";
                lbl_pic.Text = "要上传的文件类型不对！请重新选择！";
            }
        }
        else
        {
            ImgIco.ImageUrl = "";
            lbl_pic.Text = "请选择要上传的图片！";
        }
    }

    /// <summary>
    /// 验证是否指定的图片格式
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool IsImage(string str)
    {
        bool isimage = false;
        string thestr = str.ToLower();
        //限定只能上传jpg和gif图片
        string[] allowExtension = { ".jpg", ".gif", ".bmp", ".png" };
        //对上传的文件的类型进行一个个匹对
        for (int i = 0; i < allowExtension.Length; i++)
        {
            if (thestr == allowExtension[i])
            {
                isimage = true;
                break;
            }
        }
        return isimage;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        upload();
    }
    protected string strp(string str1)
    {
        str1=str1.Replace("\r\n", "<br/>");
        return str1;
    }

    protected string rstrp(string str1)
    {
        if(str1!=null)
        str1 = str1.Replace("<br/>", "\r\n");
        return str1;
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("teachers.aspx");
    }
}