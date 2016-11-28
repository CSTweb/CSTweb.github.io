<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="lessons.aspx.cs" Inherits="admin_lessons1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <ul id="navigation2">
            <li><a href="training.aspx">培养方案</a></li>
            <li><a href="lessons.aspx">课程</a></li>
            <li><a href="games.aspx">竞赛介绍</a></li>
            <li><a href="competionnews.aspx">最新竞赛通知</a></li>
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
                <asp:Button ID="BtnSearch" runat="server" Text="搜索" OnClick="BtnSearch_Click" />
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
</asp:Content>

