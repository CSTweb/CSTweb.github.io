<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="newsadd.aspx.cs" Inherits="admin_newsadd1" ValidateRequest="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <title>新闻添加</title>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content" class="container_16 clearfix">
        <div class="grid_16">
            <h2>添加新闻</h2>
            <%--<p class="error">Something went wronk.</p>--%>
        </div>
        <div class="grid_10">
            <p>
                <label>标题 </label>
                <asp:TextBox runat="server" ID="TxtTitle"></asp:TextBox>
            </p>
        </div>
        <div class="grid_5">
                            <label>新闻类别 </label>
            <asp:dropdownlist runat="server" ID="DdlNew">
                <asp:ListItem Value="1">本系动态</asp:ListItem>
                <asp:ListItem Value="2">科研动态</asp:ListItem>
                <asp:ListItem Value="3">教务动态</asp:ListItem>
                <asp:ListItem Value="4">学术报告</asp:ListItem>
                <asp:ListItem Value="14">通知公告</asp:ListItem>
            </asp:dropdownlist>
        </div>
        <div class="grid_16">
            <p>
                <label>正文 </label>
                <textarea id="myEditor" runat="server" onblur="setUeditor()"></textarea>
                <%--<textarea id="myEditor" runat="server" ></textarea>--%>
            </p>
        </div>
        <div class="grid_16">
        <script type="text/javascript">
            //实例化编辑器
            var um = UE.getEditor('<%=myEditor.ClientID %>');
        </script>
        <script type="text/javascript">
            function setUeditor() {
                var myEditor = document.getElementById("<%=myEditor.ClientID %>");
                myEditor.value = editor.getContent();
            }
        </script>
            </div>
        <div class="grid_16">
                <asp:Button ID="BtnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
        <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
            </div>
    </div>
</asp:Content>

