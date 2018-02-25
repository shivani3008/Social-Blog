<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="view_more_details.aspx.cs" Inherits="registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="120000"></asp:Timer>
    
   <div class="container">
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        <blockquote>
                            <div class="media">
                                <div class="media-left media-top">
                                    <asp:Image ID="profile_photo" CssClass="img-rounded media-object" runat="server" ImageUrl='<%# Bind("friend_profile_photo") %>' Height="60px" Width="60px" />
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <b><asp:Label ID="lbl_fn" runat="server" Text='<%#Bind("friend_fn") %>'></asp:Label>&nbsp;
                                        <asp:Label ID="lbl_ln" runat="server" Text='<%#Bind("friend_ln") %>'></asp:Label></b>
                                    </h4>
                                    <asp:LinkButton ID="lnk_send" CssClass="btn btn-success" runat="server" Text="Send" CommandName="onSend" CommandArgument='<%#Bind("friend_reg_id") %>'><span class="glyphicon glyphicon-ok"></span> Send</asp:LinkButton>
                                    <asp:LinkButton ID="lnk_cancel" CssClass="btn btn-danger" runat="server" Text="Cancel" CommandName="onCancel" CommandArgument='<%#Bind("friend_reg_id") %>'><span class="glyphicon glyphicon-remove"></span> Cancel</asp:LinkButton>
                                    <br />
                                    <asp:LinkButton ID="lnk_timeline" runat="server" CommandName="onTimeline" CommandArgument='<%#Bind("friend_reg_id") %>' Font-Size="Medium">Timeline</asp:LinkButton>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                            Gender:
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                             <asp:Label ID="Label10" runat="server" Text='<%#Bind("gender") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                            Date of Birth:
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                             <asp:Label ID="Label4" runat="server" Text='<%#Bind("dob") %>'></asp:Label>&nbsp;
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                            About:
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                             <asp:Label ID="Label12" runat="server" Text='<%#Bind("description") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </blockquote>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

