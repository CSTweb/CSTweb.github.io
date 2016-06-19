<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="teacher-list1.aspx.cs" Inherits="teacher_list" %>

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
        <section class="right-all  clearfix">
            <%--<section class="right-header box-shadow clearfix">
                <header class="header-normal">教职工名录</header>
                <ul class="clearfix">
                    <li class="selection"><a href="#">按职称分类</a></li>
                    <li class="selection"><a href="#">博士生导师</a></li>
                    <li class="selection"><a href="#">硕士生导师</a></li>
                    <li class="time">更新时间:<asp:Label ID="LBLTime" runat="server" Text="Label"></asp:Label></li>
                </ul>
            </section>--%>
            <section class="right-content teacher-list-all box-shadow">
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">教授</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle1" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">副教授</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle2" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">讲师</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle3" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">高级工程师</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle4" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">高级实验师</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle5" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">助理工程师</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle6" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </section>
                <section class="teacher-list">
                    <header class="border-dotted">
                        <span class="border-left">助理实验师</span>
                    </header>

                    <ul>
                        <asp:Repeater ID="RptTitle7" runat="server">
                            <ItemTemplate>
                                <li><a href="teacher-personal.aspx?id=<%#Eval("id")%>"><%#Eval("name")%></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </section>
            </section>
            
            </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">
    </script>
</asp:Content>

