<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="graduate-list.aspx.cs" Inherits="games_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        
        <section class="right-all clearfix right-allwidth">
            <section class="right-content competition-intro box-shadow">
                <header class="header-default">
                    <asp:Label ID="Label1" runat="server" Text="培养计划"></asp:Label></header>
                <ul>
                    <asp:Repeater ID="RptGame" runat="server">
                        <ItemTemplate>
                            <li class="border-dotted"><a href="graduate-con.aspx?id=<%#Eval("id")%>"><i class="icon-group"></i><%#Eval("graduate1")%></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <section class="right-content news-list competition-news-list box-shadow">
                <header class="header-default">最新通知</header>
                <ul class="border-dotted">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="graduate-news-con.aspx?id=<%#Eval("id") %>">
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
                            <asp:LinkButton ID="Linpre" runat="server" OnClick="BtnNextPage_Click">上一页</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinFirstpage" runat="server" OnClick="LinbtnJump">1</asp:LinkButton></li>
                        <li>
                            <asp:Label ID="Lblpre" runat="server" Text="..."></asp:Label></li>
                        <li>
                            <asp:LinkButton ID="LinPageNumpre" runat="server" OnClick="LinbtnJump">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinPageNum" runat="server" OnClick="LinbtnJump">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="LinPageNumnext" runat="server" OnClick="LinbtnJump">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:Label ID="Lblnext" runat="server" Text="..."></asp:Label></li>
                        <li>
                            <asp:LinkButton ID="LinLastpage" runat="server" OnClick="LinbtnJump">LinkButton</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="Linnext" runat="server" OnClick="BtnNextPage_Click">下一页</asp:LinkButton></li>
                    </ul>
                </footer>
            </section>

        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

