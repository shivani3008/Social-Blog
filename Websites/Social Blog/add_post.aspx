<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="add_post.aspx.cs" Inherits="add_post" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2 class="text-center">
            Add new Post
        </h2>
        <div class="row">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-text-size"></i></span>
                <asp:TextBox ID="txt_caption" Font-Size="Large" Width="100%" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" TargetControlID="txt_caption" WatermarkText="Caption" WatermarkCssClass="font_gray" runat="server"></asp:TextBoxWatermarkExtender>
            </div>
        </div>
        <br />
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <asp:FileUpload ID="fu_image" runat="server"/>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_add" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="row padding text-right">
            <div class="input-group col-lg-12 col-md-12 col-sm-12">
                <asp:Button ID="btn_add" runat="server" Text="Add" CssClass="btn btn-lg btn-success" OnClick="btn_add_Click"/>               
            </div>
        </div>
    </div>
</asp:Content>