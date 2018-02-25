<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_before.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2 class="text-center">
            Registration
        </h2>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <asp:TextBox ID="txt_fn" CssClass="input-lg" runat="server" Height="45px" Font-Size="Large" Width="50%"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txt_fn" WatermarkCssClass="font_gray" WatermarkText="First Name"></asp:TextBoxWatermarkExtender>
                <asp:TextBox ID="txt_ln" CssClass="input-lg" runat="server"  Height="45px" Font-Size="Large" Width="50%"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="twm3" runat="server" TargetControlID="txt_ln" WatermarkCssClass="font_gray" WatermarkText="Last Name"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter First Name" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_fn"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Last Name" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_ln"></asp:RequiredFieldValidator>        
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="drp_country" CssClass="input-lg" Font-Size="Large" Width="100%" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="drp_country_SelectedIndexChanged"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select Country" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_country" InitialValue="0"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="drp_state" CssClass="input-lg" Font-Size="Large" Width="100%"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="drp_state_SelectedIndexChanged"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select State" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_state" InitialValue="0"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="drp_city" CssClass="input-lg" Font-Size="Large" Width="100%"  runat="server" AppendDataBoundItems="True"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Select City" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_city" InitialValue="0"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                <asp:DropDownList ID="drp_country_code" runat="server" CssClass="input-lg" Font-Size="Large" Width="30%"  AppendDataBoundItems="True"></asp:DropDownList>
                <asp:TextBox ID="txt_mob_no" CssClass="input-lg" Font-Size="Large" Width="70%" runat="server" Height="45px"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" TargetControlID="txt_mob_no" WatermarkCssClass="font_gray" WatermarkText="Mobile No."></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Select Country Code" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_country_code" InitialValue="0"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Mobile No." Font-Size="Small" ForeColor="Red" ControlToValidate="txt_mob_no"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_mob_no" ValidateRequestMode="Disabled" Font-Size="Small" ForeColor="Red" ValidationExpression="[0-9]{10}" ErrorMessage="Please Enter valid Mobile No."></asp:RegularExpressionValidator>   
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:RadioButtonList ID="rb_gender" CssClass="input-lg " Font-Size="Large" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Text="Male" Value="Male">Male&emsp;&emsp;</asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                <asp:TextBox ID="txt_email" Height="45px" CssClass="input-lg" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txt_email" WatermarkCssClass="font_gray" WatermarkText="Email"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Email" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_email"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid Email" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <asp:TextBox ID="txt_pswd" Height="45px" CssClass="input-lg" Font-Size="Large" Width="100%" runat="server" TextMode="Password"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txt_pswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_pswd"></asp:RequiredFieldValidator>                
            <asp:PasswordStrength ID="PasswordStrength1" runat="server" PreferredPasswordLength="8" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" TargetControlID="txt_pswd"></asp:PasswordStrength>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon">C <i class="glyphicon glyphicon-lock"></i></span>
                <asp:TextBox ID="txt_cpswd" Height="45px" CssClass="input-lg" Font-Size="Large" Width="100%" runat="server" TextMode="Password"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" TargetControlID="txt_cpswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Enter Confirm Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_cpswd"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pswd" ControlToValidate="txt_cpswd" ErrorMessage="Password and Confirm Passwod doesn't match" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
        </div>
        <div class="row padding text-right">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" CssClass="btn btn-lg btn-success"/>               
            </div>
        </div>
        <br/>
        <br/>
    </div>
</asp:Content>

