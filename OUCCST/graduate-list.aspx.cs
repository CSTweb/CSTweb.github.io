using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class games_list : System.Web.UI.Page
{
    int neid;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            try
            {
                neid = Convert.ToInt16(Request.QueryString["cooperation"]);
            }
            catch
            {
                neid = 1;
            }
            int currentPage = 1;
            int pageSize = 10;
            Session["pagenum"] = 1;
            ArticlesBind(currentPage, pageSize);
            
        }
        using (var db = new CstwebEntities())
        {
            var lo = (from it in db.graduate
                      //where it.@class == neid
                     select it).ToList();
                RptGame.DataSource = lo;
            RptGame.DataBind();
        }
        effect();
    }
    void ArticlesBind(int CurrentPage, int PageSize) //文章绑定
    {
        using (var db = new CstwebEntities())
        {
            var dataSource = from items in db.news
                             where items.@class == 11
                             orderby items.id descending
                             select new { items.id, items.title, items.time };
            int totalAmount = dataSource.Count();
            Session["pageCount"] = Math.Ceiling((double)totalAmount / (double)PageSize); //总页数，向上取整
            dataSource = dataSource.Skip(PageSize * (CurrentPage - 1)).Take(PageSize); //分页
            Repeater1.DataSource = dataSource.ToList();
            Repeater1.DataBind();
        }
    }


    int getPageCount(int pageSize) //获得总页数
    {
        int pageCount = 1;
        if (Session["pageCount"] == null)
        {
            using (var db = new CstwebEntities())
            {
                var dataSource = from items in db.news
                                 orderby items.id
                                 select new { items };
                int totalAmount = dataSource.Count();
                pageCount = (int)Math.Ceiling((double)totalAmount / (double)pageSize); //总页数，向上取整
            }
            Session["pageCount"] = pageCount;
        }
        else
        {
            pageCount = Convert.ToInt32(Session["pageCount"]);
        }
        return pageCount;
    }

    protected void BtnPreviousPage_Click(object sender, EventArgs e)
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]) - 1;
        int pageSize = 20;
        if (pageNum < 1)
        {
            pageNum = 1;
            return;
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        LinPageNum.Text = pageNum.ToString();
    }

    protected void BtnNextPage_Click(object sender, EventArgs e)
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]) + 1;
        int pageSize = 10;
        if (pageNum >= getPageCount(pageSize))
        {
            pageNum = getPageCount(pageSize);
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        LinPageNum.Text = pageNum.ToString();
    }


    protected void BtnTrailerPage_Click(object sender, EventArgs e)
    {
        int pageSize = 10;
        int pageNum = getPageCount(pageSize);
        if (pageNum <= 0) //没有内容的情况
        {
            pageNum = 1;
        }
        Session["pagenum"] = pageNum;
        ArticlesBind(pageNum, pageSize);
        LinPageNum.Text = pageNum.ToString();
    }

    protected void LinbtnJump(object sender, EventArgs e)
    {
        LinkButton link = (LinkButton)sender;
        int pageNum = Convert.ToInt32(link.Text);
        int pageSize = 10;
        if (pageNum < 1)
        {
            pageNum = 1;
        }
        else if (pageNum > pageSize)
        {
            pageNum = getPageCount(pageSize);
        }
        ArticlesBind(pageNum, pageSize);
        LinPageNum.Text = pageNum.ToString();
    }


    protected void effect()
    {
        int pageNum = Convert.ToInt16(Session["pagenum"]);
        int pageCount = getPageCount(10);
        LinPageNum.Text = pageNum.ToString();
        LinPageNumnext.Text = (pageNum + 1).ToString();
        LinPageNumpre.Text = (pageNum - 1).ToString();
        LinLastpage.Text = pageCount.ToString();
        if (pageNum <= 3)
        {
            Lblpre.Visible = false;
            if (pageNum <= 2)
            {
                LinPageNumpre.Visible = false;
                if (pageNum == 1)
                {
                    LinFirstpage.Visible = false;
                    Linpre.Visible = false;
                    LinPageNum.Visible = false;
                }
            }
        }
        if (pageCount - pageNum <= 2)
        {
            Lblnext.Visible = false;
            if (pageCount - pageNum <= 1)
            {
                LinPageNumnext.Visible = false;
                if (pageCount == pageNum)
                {
                    LinLastpage.Visible = false;
                    Linnext.Visible = false;
                }
            }
        }
    }
}

public partial class games1
{
    public int id { get; set; }
    public string gamename { get; set; }
    public int status { get; set; }
    public string body { get; set; }
    public string gamestatus { get; set; }
}