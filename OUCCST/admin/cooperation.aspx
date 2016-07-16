<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="cooperation.aspx.cs" Inherits="admin_news1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 523px;
        }
    </style>
    <title>新闻公告</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul id="navigation2">
        <li><a href="cooperation.aspx">合作项目</a></li>
        <li><a href="cooperationnews.aspx">合作公告</a></li>
        <li><a href="app.aspx">企业招聘</a></li>
    </ul>
    <div id="content" class="container_16 clearfix">
        <div class="grid_5">
            <asp:DropDownList AutoPostBack="True" runat="server" ID="DdlSeClass" OnSelectedIndexChanged="DdlSeClass_SelectedIndexChanged">
                <asp:ListItem Value="1">校校合作</asp:ListItem>
                <asp:ListItem Value="2">校企合作</asp:ListItem>
            </asp:DropDownList>
        </div>
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
                                <td class="auto-style1"><%#Eval("cooperation1")%></td>
                                <td><%#Eval("addtime")%></td>
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
                                <asp:Button ID="BtnAddnews" runat="server" Text="添加" OnClick="BtnAddnews_Click" />
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
</asp:Content>

