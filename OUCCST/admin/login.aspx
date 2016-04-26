<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1.0,width=device-width" />
    <title>登录</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            font: 14px "微软雅黑",Arial,"宋体",sans-serif;
            width: 100%;
            min-height: 480px;
            height: 660px;
            background: url("./images/login-bg.png") no-repeat left bottom;
            background-color: #f8f8f8;
            position: relative;
        }

        .login {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 520px;
            height: 280px;
            margin-left: -300px;
            margin-top: -160px;
            padding: 20px 40px;
            box-shadow: 0 1px 3px 1px #cccccc;
            -webkit-box-shadow: 0 1px 3px 1px #cccccc;
            -o-box-shadow: 0 1px 3px 1px #cccccc;
            -ms-box-shadow: 0 1px 3px 1px #cccccc;
            -moz-box-shadow: 0 1px 3px 1px #cccccc;
        }

            .login:after {
                content: "";
                clear: both;
            }

            .login > header {
                font-size: 24px;
                color: #333333;
                line-height: 150%;
                padding: 0 0 20px;
                text-align: center;
            }

        .username, .password {
            display: block;
            font-size: 20px;
            width: 94%;
            padding: 5px 3%;
            margin-bottom: 20px;
            border: 2px solid rgba(144,144,144,0.3);
            border-radius: 3px;
            background-color: #f8f8f8;
        }

        .submit {
            float: right;
            font-family: "Microsoft YaHei";
            font-size: 20px;
            width: 100px;
            height: 36px;
            border-radius: 3px;
            background-color: #ccc;
            border: 0;
        }
    </style>
</head>
<body>
    <form id="form1" class="login" runat="server">
        <header>计算机科学与技术系 - 登录</header>
        <asp:TextBox ID="TxtAccount" class="username" runat="server" placeholder="用户名"></asp:TextBox>
        <asp:TextBox ID="TxtPassword" class="password" runat="server" placeholder="密码"></asp:TextBox>
        <asp:Button ID="BtnSubmit" class="submit" runat="server" Text="登录" OnClick="BtnSubmit_Click" />
    </form>

</body>
</html>
