<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="admin_teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Steal My Admin</title>
    <link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8" />
    <!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
    <link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
    <link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
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
                <h2>教师更改/添加</h2>
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
                    <label for="title">教工号 </label>
                    <asp:TextBox runat="server" ID="TxtID"></asp:TextBox>
                </p>
            </div>
            <br />

            <div class="grid_5">
                <p>
                    <label for="title">职称</label>
                    <asp:DropDownList ID="DDLTitle" runat="server">
                    </asp:DropDownList>
                </p>

            </div>
            <div class="grid_5">
                <p>
                    <label for="title">导师资格</label>
                    <asp:DropDownList ID="DDLLevel" runat="server"></asp:DropDownList>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">邮箱 </label>
                    <asp:TextBox runat="server" ID="TxtMail"></asp:TextBox>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">办公室地址 </label>
                    <asp:TextBox runat="server" ID="TxtOffice"></asp:TextBox>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">办公室电话 </label>
                    <asp:TextBox runat="server" ID="TxtPhone"></asp:TextBox>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">研究领域 </label>
                    <asp:TextBox runat="server" ID="Txtfield"></asp:TextBox>
                </p>
            </div>

            <div class="grid_5">
                <p>
                    <label for="title">教授课程</label>
                    <asp:TextBox runat="server" ID="TxtCourse"></asp:TextBox>
                </p>
            </div>


            <div class="grid_5">
                <p>
                    <label for="title">个人主页<small>不填即为不显示</small> </label>
                    <asp:TextBox runat="server" ID="TxtHome"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label>个人简介<small>不填即为不显示</small></label>
                    <asp:TextBox ID="Txtetc" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label>社会兼职<small>不填即为不显示</small></label>
                    <asp:TextBox ID="TxtPartjob" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label for="title">科研项目<small>不填即为不显示</small> </label>
                    <asp:TextBox runat="server" ID="TxtProject" TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label>奖励荣誉<small>不填即为不显示</small></label>
                    <asp:TextBox ID="TxtReward" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label>论文成果<small>不填即为不显示</small></label>
                    <asp:TextBox ID="TxtPaper" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
            </div>

            <div class="grid_16">
                <p>
                    <label>学习经历<small>不填即为不显示</small></label>
                    <asp:TextBox ID="TxtStudy" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>

                <p class="submit">
                    <asp:Button ID="BtnReset" runat="server" Text="返回" OnClick="BtnReset_Click" />
                    <asp:Button ID="BtnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
                </p>
            </div>
        </div>

        <div id="foot">
            <a href="#">爱特工作室2016年制作</a>
        </div>
    </form>
</body>
</html>
