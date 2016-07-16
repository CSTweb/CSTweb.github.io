<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exchange-list.aspx.cs" Inherits="teacher_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>校外合作</header>
            <ul>
                <li><a href="cooperation-list.aspx?cooperation=1">校校合作</a></li>
                <li><a href="cooperation-list.aspx?cooperation=2">校企合作</a></li>
                <li><a href="app-list.aspx">企业招聘</a></li>
                <li><a href="exchange-list.aspx">国际交流生</a></li>
                
            </ul>
        </section>
        <section class="right-all  clearfix">
            <section class="right-content teacher-list-all box-shadow">
                <section class="teacher-list foreign-stu">
                    <header class="header-mid"><i class="icon-group"></i>国际交流生</header>
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <li><a href="#"><%#Eval("name")%></a><input type="hidden" value="<%#Eval("id")%>" /></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </section>
                <div class="right-time">更新时间：2016-06-19</div>
            </section>
        </section>
    </section>

    <div class="screen-bg">
        <div class="one-con">
            <div class="one-close">X</div>
            <section class="basicInfomation">
                <header class="border-dotted">
                    <span class="foreign-intro-head">基本信息</span>
                </header>
                <section class="clearfix">
                    <img id="pmg" src="images/default-photo.png">
                    <ul>
                        <li id="exname">姓名 : BOB BOOM</li>
                        <li id="exmajor">专业：软件工程</li>
                        <li id="exmail">邮箱 : ...@example.com</li>
                        <li id="exnation">邮箱 : ...@example.com</li>
                        <li id="exhome">邮箱 : ...@example.com</li>
                    </ul>
                </section>
            </section>
            <section class="personl-introduction">
                <header class="border-dotted">
                    <span class="foreign-intro-head">个人介绍</span>
                </header>
                <p id="exetc">
                    介绍介绍介绍
                </p>
            </section>
        </div>
    </div>
    <script src="js/jquery-v1.10.2.min.js"></script>
    <script src="js/index.js"></script>
    <script>
        $(document).ready(function () {
            var box = $('.screen-bg');
            var con = $('.one-con');
            $("section.foreign-stu>ul>li").click(function (event) {
                var i = $(this).index();
                var go = $("section.foreign-stu>ul>li>input")
                var num = $(go[i]).val();
                $.ajax({
                    type: "POST",
                    url: "exajax.ashx",
                    data: { id: num },
                    dataType: "text",
                    success: function (json) {
                        var data = JSON.parse(json);
                        $("#pmg").attr("src", data.exurl);
                        $("#exname").html("姓名 : " + data.exname);
                        $("#exmajor").html("专业 : " + data.exmajor);
                        $("#exnation").html("国籍 : " + data.exnation);
                        $("#exhome").html("毕业院校 : " + data.exhome);
                        $("#exmail").html("邮箱 : " + data.exemail);
                        $("#exetc").html(data.exetc);
                        //$("#lesname").html(data.lesname);
                        //$("#lesnum").html(data.lesetc);
                        //$("#lesfile").html("<span>了解更多：</span><a href=\"" + data.lesfile + "\">点击下载</a>");
                    }
                });
                box.fadeIn('fast');
            });
            $(".one-close").click(function (event) {
                box.fadeOut('fast');
            });
            box.click(function (event) {
                box.fadeOut('fast');
            });
            con.click(function (event) {
                event.stopPropagation();
            });
        });

    </script>
</asp:Content>

