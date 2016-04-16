<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="admin_news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>新闻公告</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
    <style type="text/css">
        .auto-style1 {
            width: 523px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 id="head">中国海洋大学计算机系网站后台系统</h1>

        <ul id="navigation">
            <li><a href="#">首页</a></li>
            <li><span class="active">新闻</span></li>
            <li><a href="#">教师</a></li>
        </ul>
        <div id="content" class="container_16 clearfix">
            <div class="grid_16">
                <table>
                    <thead>
                        <tr>
                            <th class="auto-style1">标题</th>
                            <th>最后更新时间</th>
                            <th colspan="2" width="10%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="auto-style1"><%#Eval("title")%></td>
                                    <td><%#Eval("time")%></td>
                                    <td><a href="newsadd.aspx?id=<%#Eval("id")%>" class="edit">Edit</a></td>
                                    <td>
                                        <asp:LinkButton ID="LinDel" CommandArgument='<%#Eval("id")%>' OnClientClick="return confirm('是否删除?');" CommandName="del" runat="server">Delete</asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                    <tfoot>
                        <tr>

                            <td>当前共有
        <asp:Literal ID="LtlArticlesCount" runat="server"></asp:Literal>
                                篇文章
                                <asp:Button ID="BtnAddnews" runat="server"  Text="添加新闻" OnClick="BtnAddnews_Click" />
                            </td>

                            <td colspan="3" class="pagination">
                                <asp:Button ID="BtnPreviousPage" runat="server" OnClick="BtnPreviousPage_Click" Text="前一页" />
                                <asp:Button ID="BtnNextPage" runat="server" OnClick="BtnNextPage_Click" Text="后一页" />
                                <asp:Button ID="BtnHomePage" runat="server" OnClick="BtnHomePage_Click" Text="首页" />
                                <asp:Button ID="BtnTrailerPage" runat="server" OnClick="BtnTrailerPage_Click" Text="尾页" />
                                <asp:TextBox ID="TxtPageNum" runat="server" Height="22px" Style="font-size: large" Width="37px">1</asp:TextBox>
                                <asp:Button ID="BtnJumpPage" runat="server" OnClick="BtnJumpPage_Click" Text="跳页" />
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <div id="foot">
            <a href="#">爱特工作室2016年制作</a>

        </div>


    </form>
</body>
</html>
