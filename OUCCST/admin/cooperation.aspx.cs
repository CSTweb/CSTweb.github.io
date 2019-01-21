using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_news1 : System.Web.UI.Page
{
    Int16 newsclass;
    int pageNum;
    int pageCount;
    int pageSize;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Int16.TryParse(Request.QueryString["co"], out newsclass)) newsclass = 1;

        if (!Int32.TryParse(Request.QueryString["page"], out pageNum)) pageNum = 1;
        if (pageNum <= 0) pageNum = 1;
        pageSize = 20;
        pageCount = getPageCount(pageSize);
        if (!IsPostBack)
        {
            DdlSeClass_Select_By_Value();
            if (pageNum >= pageCount) pageNum = pageCount;
            ArticlesBind(pageNum, pageSize);
            TxtPageNum.Text = pageNum.ToString();
        }
    }
    protected void DdlSeClass_Select_By_Value()
    {
        DdlSeClass.ClearSelection();
        for (int i = 0; i < DdlSeClass.Items.Count; i++)
        {
            if (DdlSeClass.Items[i].Value == newsclass.ToString()) { DdlSeClass.Items[i].Selected = true; break; }
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "del")
        {
            using (var db = new CstwebEntities())
            {
                try
                {
                    cooperation ne = db.cooperation.FirstOrDefault<cooperation>(a => a.id == id);
                    db.cooperation.Remove(ne);
                    db.SaveChanges();
                    Response.Write("<script>alert('删除成功');window.location = 'cooperation.aspx?co=" + newsclass.ToString() + "';</script>");
                }
                catch { Response.Write("<script>alert('删除失败')</script>"); }
            }
        }
    }

    void ArticlesBind(int CurrentPage, int PageSize) //文章绑定
    {
        using (var db = new CstwebEntities())
        {
            var dataSource = from items in db.cooperation
                             where items.@class == newsclass
                             orderby items.id descending
                             select new { items.id, items.cooperation1, items.addtime };
            int totalAmount = dataSource.Count();
            pageCount = (int)Math.Ceiling((double)totalAmount / (double)PageSize); //总页数，向上取整
            dataSource = dataSource.Skip(PageSize * (CurrentPage - 1)).Take(PageSize); //分页
            if (totalAmount != 0)
            {
                Repeater1.DataSource = dataSource.ToList();
                Repeater1.DataBind();
            }
            LtlArticlesCount.Text = totalAmount.ToString();
        }
    }

    protected void DdlPageSize_SelectedIndexChanged(object sender, EventArgs e) // pageSize下拉列表改变
    {
        ArticlesBind(1, 20); //从第一页绑定，防止单页项目数量变多，导致页码超出范围。
        TxtPageNum.Text = "1";
        Session["pagenum"] = 1;
    }

    int getPageCount(int pageSize) //获得总页数
    {

        using (var db = new CstwebEntities())
        {
            var dataSource = from items in db.cooperation
                             where items.@class == newsclass
                             orderby items.id
                             select new { items };
            int totalAmount = dataSource.Count();
            pageCount = (int)Math.Ceiling((double)totalAmount / (double)pageSize); //总页数，向上取整
        }
        if (pageCount <= 0) pageCount = 1;

        return pageCount;
    }


    int getPageNum() //获得当前文本框中的合法数字页码
    {
        int pageNum;
        if (!Int32.TryParse(TxtPageNum.Text, out pageNum))
        {
            pageNum = 1;
        }
        return pageNum;
    }

    protected void BtnPreviousPage_Click(object sender, EventArgs e)
    {
        pageNum -= 1;

        if (pageNum < 1)
        {
            pageNum = 1;
            return;
        }
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString() + "&page=" + pageNum.ToString());
        //TxtPageNum.Text = pageNum.ToString();
    }

    protected void BtnNextPage_Click(object sender, EventArgs e)
    {
        pageNum += 1;

        if (pageNum >= pageCount)
        {
            pageNum = pageCount;
        }
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString() + "&page=" + pageNum.ToString());
    }

    protected void BtnHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString() + "&page=1");
    }

    protected void BtnTrailerPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString() + "&page=" + pageCount.ToString());
    }

    protected void BtnJumpPage_Click(object sender, EventArgs e)
    {
        pageNum = getPageNum();
        if (pageNum > pageCount)
        {
            pageNum = pageCount;
        }
        if (pageNum < 1)
        {
            pageNum = 1;
        }
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString() + "&page=" + pageNum.ToString());
    }
    protected void BtnAddnews_Click(object sender, EventArgs e)
    {
        Response.Redirect("cooperationadd.aspx?co=" + newsclass.ToString());
    }
    protected void DdlSeClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!Int16.TryParse(DdlSeClass.SelectedValue, out newsclass)) newsclass = 1;
        newsclass = Convert.ToInt16(DdlSeClass.SelectedValue);
        Response.Redirect("cooperation.aspx?co=" + newsclass.ToString());
    }
}