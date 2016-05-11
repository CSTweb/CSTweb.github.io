<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="training.aspx.cs" Inherits="training" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>本科生</header>
            <ul>
                <li><a href="培养方案.html">培养方案</a></li>
                <li><a href="课程大纲.html">课程大纲</a></li>
                <li><a href="学生竞赛.html">学生竞赛</a></li>
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
    <footer>
        <div class="foot-con">
            Copyright © 2016 中国海洋大学 - 计算机科学与技术系. All Rights Reserved.
        </div>
    </footer>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

