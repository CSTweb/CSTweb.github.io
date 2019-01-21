<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" validateRequest="false" AutoEventWireup="true" CodeFile="cooperationnewadd.aspx.cs" Inherits="admin_newsadd1" %>

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
            <h2>填写合作公告</h2>
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
                <asp:ListItem Value="7">校校合作</asp:ListItem>
                <asp:ListItem Value="8">校企合作</asp:ListItem>
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

