<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news-list.aspx.cs" Inherits="news_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <ul>
                <li><a href="news-list.aspx">本系新闻</a></li>
                <li><a href="#">通知公告</a></li>
                <li><a href="#">学术报告</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix">
            <section class="right-content news-list box-shadow">
                <header class="header-default">本系新闻</header>

                <ul class="border-dotted">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="news-con.aspx?id=<%#Eval("id") %>">
                                    <span class="news-title"><%#Eval("title")%></span>
                                    <span class="news-time"><%#Eval("time","{0:yyyy-MM-dd}")%></span>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <footer>
                    <ul class="paging">
                        <li><asp:LinkButton ID="Linpre" runat="server">上一页</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinFirstpage" runat="server">1</asp:LinkButton></li>
                        <li><asp:Label ID="Lblpre" runat="server" Text="..."></asp:Label></li>
                        <li><asp:LinkButton ID="LinPageNumpre" runat="server">LinkButton</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinPageNum" runat="server">LinkButton</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinPageNumnext" runat="server">LinkButton</asp:LinkButton></li>
                        <li><asp:Label ID="Lblnext" runat="server" Text="..."></asp:Label></li>
                        <li><asp:LinkButton ID="LinLastpage" runat="server">LinkButton</asp:LinkButton></li>
                        <li><asp:LinkButton ID="Linnext" runat="server">上一页</asp:LinkButton></li>
                    </ul>
                </footer>
            </section>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

