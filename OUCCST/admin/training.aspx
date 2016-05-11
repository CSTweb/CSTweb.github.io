<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" validateRequest="false" AutoEventWireup="true" CodeFile="training.aspx.cs" Inherits="admin_introduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" Runat="Server">
    <title>本系简介</title>
    <link href="../umeditor1_2_2-utf8-net/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul id="navigation2">
            <li><a href="training.aspx">培养方案</a></li>
            <li><a href="lessons.aspx">课程</a></li>
            <li><a href="games.aspx">学生竞赛</a></li>
            <li><a href="competionnews.aspx">竞赛公告</a></li>
        </ul>
    <div id="content" class="container_16 clearfix">
        <div class="grid_16">
            <h2>本科生培养方案</h2>
            <p class="error">Something went wronk.</p>
        </div>
        <div class="grid_10">
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
        <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
            </div>
    </div>
</asp:Content>

