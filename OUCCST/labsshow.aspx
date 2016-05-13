<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="labsshow.aspx.cs" Inherits="labsshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container clearfix">
        <section class="left-list box-shadow">
            <header>科学研究</header>
            <ul>
                <li><a href="#">研究方向</a></li>
                <li><a href="#">科研动态</a></li>
            </ul>
        </section>
        <section class="right-all  clearfix">
            <div class="container-fluid">
                <div class="text-content">
                    <ul class="note">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <li>
                                    <h4><%#Eval("labname") %><i class="icon-chevron-down"></i></h4>
                                </li>
                                <div class="noteHide">
                                    <%#Eval("labbody") %>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </section>
    </section>
    <script src="js/jquery-v1.10.2.min.js"></script>
<script src="js/index.js"></script>
<script>
    $(document).ready(function ($) {
        $(".noteHide").css('display', 'none');
        $(".note li").click(function (event) {
            $(this).next('div.noteHide').stop(true, false).slideToggle();
            $(this).toggleClass('toggleNote');
        });
    });
</script>
</asp:Content>

