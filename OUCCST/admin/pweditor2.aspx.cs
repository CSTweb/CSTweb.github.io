using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_pweditor2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        using (var db = new CstwebEntities())
        {
            int id = Convert.ToInt16(Session["teacherid"].ToString());
            accounts ac = db.accounts.FirstOrDefault(a => a.teacherid == id);
            if (PasswordHash.PasswordHash.ValidatePassword(TxtOldPw.Text, ac.password))
            {
                string str = PasswordHash.PasswordHash.CreateHash(NewPw1.Text);
                ac.password = str;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功')</script>");
            }
        }
    }
}