<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="training.aspx.cs" Inherits="training" %>

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
            <section class="right-content intro-con box-shadow">
                 <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <header class="border-dotted"><%#Eval("title") %></header>
                        <div class="news-time"></div>
                        <article>
                            <%#Eval("body")%>
                            <embed id="pdfwatch" src="">
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </section>    
    </section>

    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
        <script type="text/javascript">
            function getsrc() {
                var box = $("section.right-content>article>p>a");
                var www = box.attr("href");
                $("#pdfwatch").attr("src", www);
            }
            getsrc();
    </script>
</asp:Content>

