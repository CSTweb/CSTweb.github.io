using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class news_list : System.Web.UI.Page
{
    int pageCount;
    int pageSize;
    int pageNum;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Int32.TryParse(Request.QueryString["page"], out pageNum)) pageNum = 1;
        pageSize = 10;
        pageCount = getPageCount(pageSize);
        if (!IsPostBack)
        {

            if (pageNum >= pageCount) pageNum = pageCount;
            ArticlesBind(pageNum, pageSize);
            effect();
        }
    }
    void ArticlesBind(int CurrentPage, int PageSize) //文章绑定
    {
        using (var db = new CstwebEntities())
        {
            var dataSource = from items in db.news
                             where items.@class == 13
                             orderby items.id descending
                             select new { items.id, items.title, items.time };
            int totalAmount = dataSource.Count();
            pageCount = (int)Math.Ceiling((double)totalAmount / (double)PageSize); //总页数，向上取整
            dataSource = dataSource.Skip(PageSize * (CurrentPage - 1)).Take(PageSize); //分页
            if (totalAmount != 0)
            {
                Repeater1.DataSource = dataSource.ToList();
                Repeater1.DataBind();
            }
        }
    }


    int getPageCount(int pageSize) //获得总页数
    {
        using (var db = new CstwebEntities())
        {
            var dataSource = from items in db.news
                             where items.@class == 13
                             orderby items.id
                             select new { items };
            int totalAmount = dataSource.Count();
            pageCount = (int)Math.Ceiling((double)totalAmount / (double)pageSize); //总页数，向上取整
        }
        if (pageCount <= 0) pageCount = 1;
        return pageCount;
    }

    protected void BtnPreviousPage_Click(object sender, EventArgs e)
    {
        pageNum -= 1;

        if (pageNum < 1)
        {
            pageNum = 1;
            return;
        }
        Response.Redirect("friendsnew-list.aspx?page=" + pageNum.ToString());
    }

    protected void BtnNextPage_Click(object sender, EventArgs e)
    {
        pageNum += 1;

        if (pageNum >= pageCount)
        {
            pageNum = pageCount;
        }
        Response.Redirect("friendsnew-list.aspx?page=" + pageNum.ToString());
    }


    protected void LinbtnJump(object sender, EventArgs e)
    {
        LinkButton link = (LinkButton)sender;
        int pageNum = Convert.ToInt32(link.Text);

        if (pageNum < 1)
        {
            pageNum = 1;
        }
        else if (pageNum > pageCount)
        {
            pageNum = pageCount;
        }
        Response.Redirect("friendsnew-list.aspx?page=" + pageNum.ToString());
    }


    protected void effect()
    {
        LinPageNum.Text = pageNum.ToString();
        LinPageNumnext.Text = (pageNum + 1).ToString();
        LinPageNumpre.Text = (pageNum - 1).ToString();
        LinLastpage.Text = pageCount.ToString();

        LinFirstpage.Visible = true;
        Linpre.Visible = true;
        LinPageNumpre.Visible = true;
        LinPageNum.Visible = true;
        LinPageNumnext.Visible = true;
        Linnext.Visible = true;
        LinLastpage.Visible = true;
        Lblnext.Visible = true;
        Lblpre.Visible = true;

        //初始页面格式 [上一页] [1] ... [i-1]  [i]  [i+1] ... [n] [下一页] 

        if (pageNum <= 3) //如果当前页小于等于3，则前页省略号不显示
        {
            Lblpre.Visible = false;
            if (pageNum <= 2) //如果当前页小于等于2 ,首页消失
            {
                LinFirstpage.Visible = false;

                if (pageNum == 1)//如果当前页等于1，则上一页也消失
                {
                    Linpre.Visible = false;
                    LinPageNumpre.Visible = false;
                }
            }
        }
        if (pageCount - pageNum <= 2) //如果页面差值小于等于2，则后页省略号消失
        {
            Lblnext.Visible = false;
            if (pageCount - pageNum <= 1) //如果页面差值小于等于1，则尾页消失
            {
                LinLastpage.Visible = false;

                if (pageCount <= pageNum)
                {
                    LinPageNumnext.Visible = false;
                    Linnext.Visible = false;
                }
            }
        }
    }
}