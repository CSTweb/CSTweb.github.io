<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="teachers.aspx.cs" Inherits="admin_teachers1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <title>教师信息列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("name")%></td>
                                <td><%#Eval("titlename")%></td>
                                <td><%#Eval("levelname") %></td>
                                <td><a href="teacher.aspx?id=<%#Eval("id")%>" class="edit">Edit</a></td>
                                <td>
                                    <asp:LinkButton runat="server" ID="LikDel" CommandArgument='<%#Eval("id")%>' OnClientClick="return confirm('是否删除?');" CommandName="del" class="delete">Delete</asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

