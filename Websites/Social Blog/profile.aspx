<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container">
        <h2 class="text-center">
            Profile
        </h2>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                <asp:TextBox ID="txt_dob" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" TargetControlID="txt_dob" WatermarkCssClass="font_gray" WatermarkText="Date of Birth"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txt_dob"></asp:CalendarExtender>
            <asp:RequiredFieldValidator ID="reqvaldob" runat="server" 
                    ErrorMessage="Enter Date of Birth" ControlToValidate="txt_dob" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-font"></i></span>
                <asp:TextBox ID="txt_age" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" TargetControlID="txt_age" WatermarkText="Age" WatermarkCssClass="font_gray" runat="server"></asp:TextBoxWatermarkExtender>
            </div>
            <asp:RequiredFieldValidator ID="reqvalage" runat="server" ControlToValidate="txt_age" ErrorMessage="Enter Age" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">   
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>          
                    <asp:TextBox ID="txt_designation" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txt_designation" WatermarkCssClass="font_gray" WatermarkText="Designation"></asp:TextBoxWatermarkExtender>
            </div>
        </div>
       <br />
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                <asp:TextBox ID="txt_qualification" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txt_qualification" WatermarkCssClass="font_gray" WatermarkText="Qualification"></asp:TextBoxWatermarkExtender>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                <asp:TextBox ID="txta_description" TextMode="MultiLine" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txta_description" WatermarkCssClass="font_gray" WatermarkText="Write something"></asp:TextBoxWatermarkExtender>
            </div>
        </div>
        <br />
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
            <ContentTemplate>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <asp:FileUpload ID="fu_profile_photo" runat="server"/>
            </div>
                </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="btn_submit" />
            </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="row padding text-right">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-lg btn-success" OnClick="btn_submit_Click"/>               
            </div>
        </div>
        <br/>
        <br/>
    </div>
    
</asp:Content>

