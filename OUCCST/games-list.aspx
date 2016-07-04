<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="games-list.aspx.cs" Inherits="games_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="container clearfix">
    <section class="left-list box-shadow">
        <header>本科生</header>
        <ul>
                <li><a href="training.aspx">培养方案</a></li>
                <li><a href="course.aspx">课程大纲</a></li>
                <li><a href="games-list.aspx">学生竞赛</a></li>
            </ul>
    </section>
    <section class="right-all  clearfix">
        <section class="right-content competition-intro box-shadow">
            <header class="header-default">竞赛介绍</header>
            <ul>
                <asp:Repeater ID="RptGame" runat="server">
                    <ItemTemplate>
                        <li class="border-dotted"><a href="games-con.aspx?id=<%#Eval("id")%>"><i class="icon-trophy"></i><%#Eval("gamename")%></a><%#Eval("gamestatus")%></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </section>
        <section class="right-content news-list competition-news-list box-shadow">
            <header class="header-default">最新竞赛通知</header>
            <ul class="border-dotted">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="games-news-con.aspx?id=<%#Eval("id") %>">
                                    <span class="news-title"><%#Eval("title")%></span>
                                    <span class="news-time"><%#Eval("time","{0:yyyy-MM-dd}")%></span>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            <footer>
                    <ul class="paging">
                        <li>
                            <asp:LinkButton ID="Linpre" runat="server">上一页</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinFirstpage" runat="server">1</asp:LinkButton></li>
                        <li>
                            <asp:Label ID="Lblpre" runat="server" Text="..."></asp:Label></li>
                        <li>
                            <asp:LinkButton ID="LinPageNumpre" runat="server">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinPageNum" runat="server">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinPageNumnext" runat="server">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:Label ID="Lblnext" runat="server" Text="..."></asp:Label></li>
                        <li>
                            <asp:LinkButton ID="LinLastpage" runat="server">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="Linnext" runat="server">上一页</asp:LinkButton></li>
                    </ul>
                </footer>
        </section>

    </section>
</section>
    <script src="js/jquery-v1.10.2.min.js"></script>
<script src="js/index.js"></script>
</asp:Content>

