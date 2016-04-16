<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="course.aspx.cs" Inherits="course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>师资队伍</header>
            <ul>
                <li><a href="cs-teacher-list.html">教职工名录</a></li>
                <li><a href="#">杰出人才</a></li>
                <li><a href="#">名誉学衔</a></li>
            </ul>
        </section>
        <section class="right-all course clearfix">
            <header class="box-shadow clearfix">
                <div>课程模块</div>
                <ul>
                    <li><a class="course-a course-a-active" href="#"><span class="course-icon course-icon1"></span>公共专业</a></li>
                    <li><a class="course-a" href="#"><span class="course-icon course-icon2"></span>系统结构</a></li>
                    <li><a class="course-a" href="#"><span class="course-icon course-icon3"></span>软件工程</a></li>
                    <li><a class="course-a" href="#"><span class="course-icon course-icon4"></span>数字媒体</a></li>
                    <li><a class="course-a" href="#"><span class="course-icon course-icon5"></span>网络安全</a></li>
                </ul>
            </header>
            <section class="right-content course-content box-shadow clearfix">
                <ul class="clearfix">
                    <asp:Repeater ID="Rptclass1" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%#Eval("classname")%></p>
                                <p>学时：讲授 <%#Eval("teach")%> 实验 <%#Eval("experiment")%></p>
                                <p>先修课程：无</p>
                                <p>学分：<%#Eval("credits")%></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <section class="right-content course-content box-shadow clearfix">
                <ul class="clearfix">
                    <asp:Repeater ID="Rptclass2" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%#Eval("classname")%></p>
                                <p>学时：讲授 <%#Eval("teach")%> 实验 <%#Eval("experiment")%></p>
                                <p>先修课程：无</p>
                                <p>学分：<%#Eval("credits")%></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <section class="right-content course-content box-shadow clearfix">
                <ul class="clearfix">
                    <asp:Repeater ID="Rptclass3" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%#Eval("classname")%></p>
                                <p>学时：讲授 <%#Eval("teach")%> 实验 <%#Eval("experiment")%></p>
                                <p>先修课程：无</p>
                                <p>学分：<%#Eval("credits")%></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <section class="right-content course-content box-shadow clearfix">
                <ul class="clearfix">
                    <asp:Repeater ID="Rptclass4" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%#Eval("classname")%></p>
                                <p>学时：讲授 <%#Eval("teach")%> 实验 <%#Eval("experiment")%></p>
                                <p>先修课程：无</p>
                                <p>学分：<%#Eval("credits")%></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
            <section class="right-content course-content box-shadow clearfix">
                <ul class="clearfix">
                    <asp:Repeater ID="Rptclass5" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%#Eval("classname")%></p>
                                <p>学时：讲授 <%#Eval("teach")%> 实验 <%#Eval("experiment")%></p>
                                <p>先修课程：无</p>
                                <p>学分：<%#Eval("credits")%></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </section>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

