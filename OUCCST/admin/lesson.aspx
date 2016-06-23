<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="lesson.aspx.cs" Inherits="lesson1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <title>课程</title>
     <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <asp:FileUpload ID="FileUploadControl" runat="server" />
            <asp:Button ID="UploadButton" runat="server" Text="上传" OnClick="UploadButton_Click" />
            <asp:Label runat="server" id="StatusLabel" text="上传文件结果: " />
            <asp:Label runat="server" id="LblFilename" style="display:none" Text=""></asp:Label>
        </div>
        <div class="grid_16">
            <p>
                <label>先修课程</label>
                <asp:Label ID="Label1" runat="server" Visible="false" Text="0"></asp:Label>
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

