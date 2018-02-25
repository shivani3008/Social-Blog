<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_before.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="container">
            <h2 class="text-center">
                Login
            </h2>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <asp:TextBox ID="txt_email" runat="server" Width="100%" Font-Size="X-Large"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txt_email" WatermarkCssClass="font_gray" WatermarkText="Email"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Email" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_email"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid Email" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>   
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <asp:TextBox ID="txt_pswd" runat="server" width="100%" TextMode="Password" Font-Size="X-Large"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txt_pswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_pswd"></asp:RequiredFieldValidator>                
        </div>   
        <div class="row padding text-right">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-lg btn-success" OnClick="btn_login_Click"/>               
            </div>
        </div>
        <div class="row text-right padding">
             <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:LinkButton CausesValidation="false" ID="lnk_forget_pswd" runat="server" OnClick="lnk_forget_pswd_Click">Forget Password</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

