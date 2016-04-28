<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" validateRequest="false" AutoEventWireup="true" CodeFile="newsadd.aspx.cs" Inherits="admin_newsadd1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <title>新闻添加</title>
    <link href="../umeditor1_2_2-utf8-net/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../umeditor1_2_2-utf8-net/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor1_2_2-utf8-net/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor1_2_2-utf8-net/umeditor.min.js"></script>
    <script type="text/javascript" src="../umeditor1_2_2-utf8-net/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content" class="container_16 clearfix">
        <div class="grid_16">
            <h2>Submit News Article</h2>
            <p class="error">Something went wronk.</p>
        </div>
        <div class="grid_16">
            <p>
                <label>标题 </label>
                <asp:TextBox runat="server" ID="TxtTitle"></asp:TextBox>
            </p>
        </div>
        <div class="grid_16">
            <p>
                <label>正文 </label>
                <textarea id="myEditor" runat="server" onblur="setUeditor()"></textarea>
                <%--<textarea id="myEditor" runat="server" ></textarea>--%>
            </p>
        </div>
        <asp:Button ID="BtnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
        <script type="text/javascript">
            //实例化编辑器
            var um = UM.getEditor('<%=myEditor.ClientID %>');
        </script>
        <script type="text/javascript">
            function setUeditor() {
                var myEditor = document.getElementById("<%=myEditor.ClientID %>");
                myEditor.value = editor.getContent();
            }
        </script>
        <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
    </div>
</asp:Content>

