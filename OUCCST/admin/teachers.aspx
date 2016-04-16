<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teachers.aspx.cs" Inherits="admin_teachers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>教师信息列表</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
</head>
<body>
    <form id="form1" runat="server">
        <h1 id="head">教师信息列表</h1>

        <ul id="navigation">
            <li><span class="active">Overview</span></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Users</a></li>
        </ul>

        <div id="content" class="container_16 clearfix">
            <div class="grid_4">
                <p>
                    <label>姓名</label>
                    <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label>职称</label>
                    <asp:DropDownList ID="DDLTitle" runat="server">
                    </asp:DropDownList>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label>导师资格</label>
                    <asp:DropDownList ID="DDLLevel" runat="server"></asp:DropDownList>
                </p>
            </div>
            <div class="grid_2">
                <p>
                    <label>&nbsp;</label>
                    <input type="submit" value="搜索" />
                    <asp:Button ID="BtnADD" runat="server" Text="添加" OnClick="BtnADD_Click" />
                </p>
            </div>
            <div class="grid_16">
                <table>
                    <thead>
                        <tr>
                            <th>姓名</th>
                            <th>职称</th>
                            <th>导师资格</th>
                            <th colspan="2" width="10%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1"  runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("name")%></td>
                                    <td><%#Eval("titlename")%></td>
                                    <td><%#Eval("levelname") %></td>
                                    <td><a href="teacher.aspx?id=<%#Eval("id")%>"  class="edit">Edit</a></td>
                                    <td><asp:LinkButton runat="server" ID="LikDel" CommandArgument='<%#Eval("id")%>' onclientclick="return confirm('是否删除?');" CommandName="del" class="delete">Delete</asp:LinkButton></td>
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
