<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lessonlist.aspx.cs" Inherits="admin_lessonlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>教师信息列表</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
</head>
<body>
    <form id="form1" runat="server">
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
                </p>
            </div>
            <div class="grid_16">
                <table>
                    <thead>
                        <tr>
                            <th class="auto-style1">课名</th>
                            <th>所属模块</th>
                            <th>选择</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <tr>
                                    <td class="auto-style1">无</td>
                                    <td>无</td>
                                    <td><asp:LinkButton runat="server" CommandName="se">选择</asp:LinkButton></td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="auto-style1"><%#Eval("classname")%></td>
                                    <td><%#Eval("name")%></td>
                                    <td><asp:LinkButton runat="server" CommandArgument='<%#Eval("id")%>' CommandName="sel">选择</asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
