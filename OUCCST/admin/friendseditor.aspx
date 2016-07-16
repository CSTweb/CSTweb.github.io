<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" ValidateRequest="false"  AutoEventWireup="true" CodeFile="friendseditor.aspx.cs" Inherits="admin_teacher1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
    <title>交流生</title>
    
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content" class="container_16 clearfix">
        <div class="grid_16">
            <h2>更改/添加</h2>
            <p class="error">&nbsp;</p>
        </div>

        <div class="grid_16">
            <p>
                <asp:Image ID="ImgIco" runat="server" ImageUrl="/images/ico/index.jpg" Height="160px" Width="120px" />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="lbl_pic" runat="server" class="pic_text"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="上传照片" OnClick="Button1_Click" />
            </p>
        </div>



        <div class="grid_5">
            <p>
                <label for="title">姓名 </label>
                <asp:TextBox runat="server" ID="Txtname"></asp:TextBox>
            </p>
        </div>
        

        <div class="grid_5">
            <p>
                <label for="title">工作单位 </label>
                <asp:TextBox runat="server" ID="TxtWork"></asp:TextBox>
            </p>
        </div>
        <div class="grid_5">
            <p>
                <label for="title">联系电话 </label>
                <asp:TextBox runat="server" ID="TxtPhone"></asp:TextBox>
            </p>
        </div>
        
        <div class="grid_5">
            <p>
                <label for="title">出生年月 </label>
                <asp:TextBox runat="server" ID="TxtBirth"></asp:TextBox>
            </p>
        </div>
        <div class="grid_5">
            <p>
                <label for="title">邮箱 </label>
                <asp:TextBox runat="server" ID="TxtMail"></asp:TextBox>
            </p>
        </div>
        <div class="grid_6">
            <p>
                <label for="title">性别</label>
                <asp:DropDownList ID="DdlSex" runat="server">
                    <asp:ListItem Text="男" Value="1"></asp:ListItem>
                    <asp:ListItem Text="女" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </p>
        </div>
        <div class="grid_16">
            <p>
                <label>其他</label>
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

            <p class="submit">
                <asp:Button ID="BtnReset" runat="server" Text="返回" OnClick="BtnReset_Click" />
                <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
            </p>
        </div>
    </div>
</asp:Content>

