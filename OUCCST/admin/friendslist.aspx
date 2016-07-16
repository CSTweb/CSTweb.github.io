<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="friendslist.aspx.cs" Inherits="admin_exchange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul id="navigation2">
        <li><a href="friendslist.aspx">系友名录</a></li>
        <li><a href="friendsnew.aspx">系友通知</a></li>
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
                <label>工作单位</label>
                <asp:DropDownList ID="DDLTitle" runat="server">
                </asp:DropDownList>
            </p>
        </div>
        <div class="grid_5">
            <p>
                <label>联系电话</label>
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
                        <th>工作单位</th>
                        <th>联系电话</th>
                        <th colspan="2" width="10%">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("fname")%></td>
                                <td><%#Eval("workplace")%></td>
                                <td><%#Eval("phone") %></td>
                                <td><a href="friendseditor.aspx?id=<%#Eval("id")%>" class="edit">Edit</a></td>
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

