<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news-con.aspx.cs" Inherits="news_con" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>新闻公告</header>
            <ul>
                <li><a href="news-list.aspx">本系动态</a></li>
                <li><a href="news-list.aspx?newclass=2">科研动态</a></li>
                <li><a href="news-list.aspx?newclass=3">教务动态</a></li>
                <li><a href="news-list.aspx?newclass=4">学术报告</a></li>
                <li><a href="news-list.aspx?newclass=14">通知公告</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix">
            <section class="right-content intro-con box-shadow">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <header class="border-dotted"><%#Eval("title") %></header>
                        <article>
                            <%#Eval("body")%>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="other-news">
                    <div class="border-dotted"></div>
                    <p><span>上一篇:</span><asp:LinkButton ID="Linpre" runat="server">LinkButton</asp:LinkButton></p>
                    <p><span>下一篇:</span><asp:LinkButton ID="Linnext" runat="server">LinkButton</asp:LinkButton></p>
                </div>
            </section>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

