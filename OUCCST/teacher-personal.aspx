<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="teacher-personal.aspx.cs" Inherits="teacher_personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>师资队伍</header>
            <ul>
                <li><a href="teacher-list1.aspx">师资总览</a></li>
                <li><a href="teacher-list2.aspx">博士生导师</a></li>
                <li><a href="teacher-list3.aspx">硕士生导师</a></li>
            </ul>
        </section>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <section class="right-all  clearfix">
                    <section class="right-content teacher-personal box-shadow">
                        <section class="basicInfomation">
                            <header class="border-dotted">
                                <span class="border-left">基本信息</span>
                            </header>
                            <section class="clearfix">
                                <img src="<%#Eval("photo")%>">
                                <ul>
                                    <li>姓名 :<%#Eval("name")%></li>
                                    <li>职称 :<%#Eval("titlename")%></li>
                                    <li>导师 :<%#Eval("levelname")%></li>
                                    <li>邮箱 :<%#Eval("mail")%></li>
                                    <li>办公电话 :<%#Eval("phone")%></li>
                                    <li>办公室地址:<%#Eval("office")%></li>
                                    <li>研究领域 :<%#Eval("field")%></li>
                                    <li>教授课程 :<%#Eval("course")%></li>
                                </ul>
                            </section>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">教育背景</span>
                            </header>
                            <p>
                               
                                <%#Eval("education")%>
                            </p>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">个人简介</span>
                            </header>
                            <p>
                                <%#Eval("etc")%>
                            </p>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">社会兼职</span>
                            </header>
                            <p>
                                <%#Eval("parttimejob")%>
                            </p>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">科研项目</span>
                            </header>
                            <p>
                                <%#Eval("project")%>
                            </p>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">奖励荣誉</span>
                            </header>
                            <p>
                                <%#Eval("reward")%>
                            </p>
                        </section>
                        <section class="personl-introduction">
                            <header class="border-dotted">
                                <span class="border-left">论文成果</span>
                            </header>
                            <p>
                                <%#Eval("paper")%>
                            </p>
                        </section>
                    </section>
                </section>
            </ItemTemplate>
        </asp:Repeater>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            var ifBlankEle = $('.personl-introduction>header+p');
            for (var i = 0, len = ifBlankEle.length; i < len; i++) {
                if (ifBlankEle.eq(i).html().replace(/[ \r\n]/g, "") == '') {
                    ifBlankEle.eq(i).parent('.personl-introduction').hide();
                }
            }
        });
    </script>
</asp:Content>

