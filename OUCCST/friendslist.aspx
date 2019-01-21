<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="friendslist.aspx.cs" Inherits="friendslist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>系友工作</header>
            <ul>
                <li><a href="friendslist.aspx">系友名录</a></li>
                <li><a href="friendsnew-list.aspx">系友通知</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix ">
            <section class="right-content news-list competition-intro competition-news-list box-shadow">
                <header class="header-mid"><i class="icon-calendar"></i>系友名录</header>
                <div>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>姓名</th>
                                <th>工作单位</th>
                                <th>联系电话</th>
                                <th>电子邮箱</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--在这里一条条记录-->
                            <asp:Repeater runat="server" ID="rpt1">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("fname")%></td>
                                        <td><%#Eval("workplace")%></td>
                                        <td><%#Eval("phone")%></td>
                                        <td><%#Eval("email")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                            <!--在这里一条条记录-->
                        </tbody>
                    </table>
                </div>
            </section>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/modernizr-custom-v2.7.1.min.js"></script>
    <script src="js/flickerplate.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>

