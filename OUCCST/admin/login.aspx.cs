using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (TxtAccount.Text.Trim() == "")
        {
            Response.Write("<script>alert('用户名不能为空')</script>");
        }
        else if (TxtPassword.Text.Trim() == "")
        {
            Response.Write("<script>alert('密码不能为空')</script>");
        }
        else
        {
            using (var db = new CstwebEntities())
            {
                try
                {
                    accounts ac = db.accounts.FirstOrDefault(a => a.account == TxtAccount.Text.Trim());
                    if (PasswordHash.PasswordHash.ValidatePassword(TxtPassword.Text.Trim(), ac.password))
                    {
                        if (ac.accountlevel == 0)
                        {
                            Session["admin"] = ac.id;
                            Response.Write("<script language=javascript>alert('登录成功');window.location = 'index.aspx';</script>");
                        }
                        else if (ac.accountlevel == 1)
                        {
                            Session["teacherid"] = ac.teacherid;
                            Response.Write("<script language=javascript>alert('登录成功');window.location = 'index2.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('出现迷之错误')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('用户名或密码错误')</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('用户名或密码错误')</script>");
                }

            }
        }
    }
}