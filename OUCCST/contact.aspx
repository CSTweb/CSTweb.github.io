<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="css/moCss.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>计算机科学与技术</header>
            <ul>
                <li><a href="introduce.aspx">本系简介</a></li>
                <li><a href="contact.aspx">联系我们</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix">
            <section class="right-content intro-con box-shadow">
                <header class="border-dotted"><i class="icon-home"></i> 联系我们</header>
                <div class="news-time"></div>
                <article>
                    <img class="contactUs" src="images/contactUsImg.png" alt="地址：山东省青岛市崂山区松岭路238号中国海洋大学;电话：0532-6678124;邮编：266100">
                </article>
                
            </section>
        </section>    
    </section>
</asp:Content>

