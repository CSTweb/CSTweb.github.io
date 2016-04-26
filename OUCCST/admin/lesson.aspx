<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="lesson.aspx.cs" Inherits="lesson1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" Runat="Server">
    <title>课程</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content" class="container_16 clearfix">
            <div class="grid_16">
                <h2>添加/修改课程</h2>
                <p class="error">Something went wronk.</p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">课名 </label>
                    <asp:TextBox ID="TxtLessonName" runat="server"></asp:TextBox>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">学分 </label>
                    <asp:TextBox ID="TxtCredits" runat="server"></asp:TextBox>
                </p>

            </div>
            <div class="grid_6">
                <p>
                    <label for="title">所属模块</label>
                    <asp:DropDownList ID="DDLClass" runat="server">
                    </asp:DropDownList>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label for="title">教授 </label>
                    <asp:TextBox ID="TxtTeach" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="grid_5">
                <p>
                    <label for="title">实验 </label>
                    <asp:TextBox ID="TxtExp" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="grid_16">
                <p>
                    <label>先修课程</label>
                    <asp:Label ID="Label1" runat="server"  Visible="false" Text="0"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Visible="false" Text="0"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Visible="false" Text="0"></asp:Label>
                    <asp:LinkButton ID="LinFirst1" runat="server" OnClick="LinFirst1_Click">先修课程1</asp:LinkButton>
                    <asp:LinkButton ID="LinFirst2" runat="server" OnClick="LinFirst2_Click">先修课程2</asp:LinkButton>
                    <asp:LinkButton ID="LinFirst3" runat="server" OnClick="LinFirst3_Click">先修课程3</asp:LinkButton>
                </p>
                <p class="submit">
                    <asp:Button ID="BtnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
                    <asp:Button ID="BtnPost" runat="server" Text="提交" OnClick="BtnPost_Click" />
                </p>
            </div>
        </div>
</asp:Content>

