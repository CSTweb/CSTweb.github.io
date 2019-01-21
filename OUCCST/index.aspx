<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/flickerplate.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix index-content">
        
     <section class="Carousel box-shadow">
        <div class="flicker-example" data-block-text="false">
            <ul>
                <li data-background="images/field.jpg">
                    <!--<div class="lick-title">测试图片1</div>-->
                    <!--<div class="flick-sub-text">这里是一些简单的介绍文本</div>-->
                </li>
                <li data-background="images/forest.jpg">
                    <!--<div class="flick-title">测试图片2</div>-->
                    <!--<div class="flick-sub-text">这里是一些简单的介绍文本</div>-->
                </li>
                <li data-background="images/frozen-water.jpg">
                    <!--<div class="flick-title">测试图片3</div>-->
                    <!--<div class="flick-sub-text">这里是一些简单的介绍文本</div>-->
                </li>
            </ul>
        </div>
    </section>    
        <section class="index-news-list box-shadow">
            <header><i class="icon-bullhorn"></i> 通知公告</header>
            <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href="news-con.aspx?id=<%#Eval("id") %>" title="<%#Eval("title")%>"><span class="index-news-title"><%#Eval("title")%></span><span class="index-news-time" ><%#Eval("time","{0:yyyy-MM-dd}")%></span></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="more"><a href="news-list.aspx?newclass=14">查看更多</a></div>
        </section>
        <section class="index-news-list box-shadow">
            <header><i class="icon-comments"></i> 本系动态</header>
            <ul>
                 <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href="news-con.aspx?id=<%#Eval("id") %>" title="<%#Eval("title")%>"><span class="index-news-title"><%#Eval("title")%></span><span class="index-news-time" ><%#Eval("time","{0:yyyy-MM-dd}")%></span></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="more"><a href="news-list.aspx">查看更多</a></div>
        </section>
        <section class="index-news-list box-shadow">
            <header><i class="icon-tasks"></i> 学术报告</header>
            <ul>
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href="news-con.aspx?id=<%#Eval("id") %>" title="<%#Eval("title")%>"><span class="index-news-title"><%#Eval("title")%></span><span class="index-news-time" ><%#Eval("time","{0:yyyy-MM-dd}")%></span></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="more"><a href="news-list.aspx?newclass=4">查看更多</a></div>
        </section>
        <section class="expressway box-shadow">
            <header><i class="icon-cogs"></i> 快速通道</header>
            <ul>
                <li><a href="http://222.195.151.48:8080/tEvaluate6/" target="_blank"> 教学评价系统</a></li>
                <li><a href="http://222.195.151.48:8080/gevaluate2/" target="_blank"> 毕业生调查系统</a></li>
            </ul>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/modernizr-custom-v2.7.1.min.js"></script>
    <script src="js/flickerplate.min.js"></script>
    <script src="js/index.js"></script>
    <script>
        $(document).ready(function () {
            $('.flicker-example').flicker();
        });
</script>
</asp:Content>

