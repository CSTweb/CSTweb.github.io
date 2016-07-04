<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="teaching-list.aspx.cs" Inherits="news_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="clearfix">
            <section class="right-content news-list box-shadow">
                <header class="header-mid">
                    <i class="icon-bullhorn"></i>
                    <asp:Label runat="server" ID="hea" Text="教务动态"> </asp:Label></header>

                    <ul class="border-dotted">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="teaching-con.aspx?id=<%#Eval("id") %>">
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
                            <asp:LinkButton ID="Linpre" runat="server" OnClick="BtnPreviousPage_Click">上一页</asp:LinkButton></li>
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

