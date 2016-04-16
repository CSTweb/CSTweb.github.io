<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lessons.aspx.cs" Inherits="admin_lessons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>教师信息列表</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
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
            <div class="grid_4">
                <p>
                    <label>课名</label>
                    <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label>所属模块</label>
                    <asp:DropDownList ID="DDLClass" runat="server">
                    </asp:DropDownList>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label>&nbsp;</label>
                    <asp:Button ID="BtnSearch" runat="server" Text="搜索" OnClick="BtnSearch_Click"  />
                    <asp:Button ID="BtnADD" runat="server" Text="添加" OnClick="BtnADD_Click" />
                </p>
            </div>
            <div class="grid_16">
                <table>
                    <thead>
                        <tr>
                            <th class="auto-style1">课名</th>
                            <th>所属模块</th>
                            <th colspan="2" width="10%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td class="auto-style1"><%#Eval("classname")%></td>
                                    <td><%#Eval("name")%></td>
                                    <td><a href="lesson.aspx?id=<%#Eval("id")%>" class="edit">Edit</a></td>
                                    <td>
                                        <asp:LinkButton ID="LinDel" CommandArgument='<%#Eval("id")%>' OnClientClick="return confirm('是否删除?');" CommandName="del" runat="server">Delete</asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </div>
        <div id="foot">
            <a href="#">爱特工作室2016年制作</a>

        </div>
    </form>
</body>
</html>
