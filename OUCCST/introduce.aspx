<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="introduce.aspx.cs" Inherits="introduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mid-con intro-ban"></div>
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>计算机科学与技术</header>
            <ul>
                <li><a href="#">本系简介</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix">
            <section class="right-content intro-con box-shadow">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <header class="border-dotted"><%#Eval("title") %></header>
                        <div class="news-time"></div>
                        <article>
                            <%#Eval("body")%>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </section>
    </section>
        <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

