using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_teacher1 : System.Web.UI.Page
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
            if (teaid != 0)
                using (var db = new CstwebEntities())
                {
                    var tea = db.friends.FirstOrDefault(a => a.id == teaid);
                    Txtname.Text = tea.fname;
                    
                    TxtMail.Text = tea.email;

                    TxtWork.Text = tea.workplace;

                    TxtPhone.Text = tea.phone;

                    TxtBirth.Text = tea.birth;

                    DdlSex.SelectedValue = tea.sex.ToString();

                     
 
                    ImgIco.ImageUrl = tea.photo;

                    myEditor.InnerHtml = tea.ect;
                }
        }
    }


    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Txtname.Text.Trim() == "") Response.Write("<script>alert('姓名不能为空')</script>");
        else if (TxtMail.Text.Trim() == "") Response.Write("<script>alert('邮箱不能为空')</script>");
        else if (TxtWork.Text.Trim() == "") Response.Write("<script>alert('工作单位不能为空')</script>");
        
        else if (TxtBirth.Text.Trim() == "") Response.Write("<script>alert('出生年月不能为空')</script>");
        else if (TxtPhone.Text.Trim() == "") Response.Write("<script>alert('联系电话不能为空')</script>");
      
        else
            using (var db = new CstwebEntities())
            {
                try
                {
                    if (teaid == 0)
                    {
                        var tea = new friends();
                        tea.fname = Txtname.Text.Trim();
                        tea.email = TxtMail.Text.Trim();
                        tea.photo = ImgIco.ImageUrl.ToString();
                        tea.phone = TxtPhone.Text.Trim();
                        int sex = Convert.ToInt32(DdlSex.SelectedValue);
                        tea.sex = sex;
                        tea.birth = TxtBirth.Text.Trim();
                        tea.workplace = TxtWork.Text.Trim();
                        
                        string tempstr = Server.HtmlDecode(myEditor.InnerHtml);
                        if (tempstr != "") tea.ect = tempstr;
                        db.friends.Add(tea);
                        db.SaveChanges();
                        
                        Response.Write("<script language=javascript>alert('添加成功');window.location = 'friendslist.aspx';</script>");

                    }
                    else
                    {
                        friends tea = db.friends.First<friends>(a => a.id == teaid);
                        tea.fname = Txtname.Text.Trim();
                        tea.email = TxtMail.Text.Trim();
                        tea.photo = ImgIco.ImageUrl.ToString();
                        tea.phone = TxtPhone.Text.Trim();
                        int sex = Convert.ToInt32(DdlSex.SelectedValue);
                        tea.sex = sex;
                        tea.birth = TxtBirth.Text.Trim();
                        tea.workplace = TxtWork.Text.Trim();
                        
                        string tempstr = Server.HtmlDecode(myEditor.InnerHtml);
                        if (tempstr != "") tea.ect = tempstr;

                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('修改成功');window.location = 'friendslist.aspx';</script>");
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
        str1 = str1.Replace("\r\n", "<br/>");
        return str1;
    }

    protected string rstrp(string str1)
    {
        if (str1 != null)
            str1 = str1.Replace("<br/>", "\r\n");
        return str1;
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("friendslist.aspx");
    }
}