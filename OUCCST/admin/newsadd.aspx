<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="newsadd.aspx.cs" Inherits="admin_newsadd" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Steal My Admin</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />

    <link href="../umeditor1_2_2-utf8-net/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../umeditor1_2_2-utf8-net/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor1_2_2-utf8-net/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../umeditor1_2_2-utf8-net/umeditor.min.js"></script>
    <script type="text/javascript" src="../umeditor1_2_2-utf8-net/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <h1 id="head">Steal My Admin Template</h1>
        <ul id="navigation">
            <li><span class="active">Overview</span></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Users</a></li>
        </ul>
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
                </p>
            </div>
            <asp:Button ID="BtnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
            <script type="text/javascript">
                //实例化编辑器
                var um = UM.getEditor('myEditor');
            </script>
            <script type="text/javascript">  
                function setUeditor() {  
                    var myEditor = document.getElementById("myEditor");
                    myEditor.value = editor.getContent();  
                }  
                </script>
            <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
            <div id="foot">
                <a href="#">爱特工作室2016年制作</a>
            </div>
        </div>
    </form>
</body>
</html>
