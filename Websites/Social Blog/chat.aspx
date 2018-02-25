<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="message" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="6000"></asp:Timer>
    <div class="row container">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
            <asp:UpdatePanel runat="server"><ContentTemplate>
            <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg-12">
                            <blockquote style="border-left:none">
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <asp:Image ID="profile_photo" CssClass="img-circle media-object" runat="server" ImageUrl='<%# Bind("friend_profile_photo") %>' Height="40px" Width="40px" />
                                    </div>
                                    <div class="media-body">
                                        <asp:UpdatePanel runat="server"><ContentTemplate>
                                        <asp:LinkButton ID="lnk_open_chat" runat="server" CommandName="onOpenChat" CommandArgument='<%#Bind("friend_reg_id") %>' Font-Size="Medium">
                                            <h4 class="media-heading">
                                                <asp:Label ID="lbl_fn" runat="server" Text='<%#Bind("friend_fn") %>' ForeColor="Black"></asp:Label>&nbsp;
                                                <asp:Label ID="lbl_ln" runat="server" Text='<%#Bind("friend_ln") %>' ForeColor="Black"></asp:Label>
                                            </h4>
                                        </asp:LinkButton>
                                        </ContentTemplate></asp:UpdatePanel>
                                    </div>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <h3 class="text-center">
                <asp:Label ID="no_friends" runat="server" Text="Make new friends!" Visible="false"></asp:Label>
            </h3>
            </ContentTemplate></asp:UpdatePanel>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
            <asp:UpdatePanel runat="server"><ContentTemplate>
            <asp:DataList ID="DataListHeader" runat="server">
                <ItemTemplate>
                    <div class="row" style="background-color:teal;color:White;">
                        <div class="col-lg-12">
                            <blockquote style="border-left:none">
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <asp:Image ID="profile_hphoto" CssClass="img-rounded media-object" runat="server" ImageUrl='<%# Bind("friend_profile_photo") %>' Height="40px" Width="40px" />
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">
                                            <asp:Label ID="lbl_hfn" runat="server" Text='<%#Bind("friend_fn") %>' ForeColor="White"></asp:Label>&nbsp;
                                            <asp:Label ID="lbl_hln" runat="server" Text='<%#Bind("friend_ln") %>' ForeColor="White"></asp:Label>
                                        </h4>
                                    </div>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            </ContentTemplate></asp:UpdatePanel>
            <asp:UpdatePanel runat="server"><ContentTemplate>
            <asp:DataList ID="DataListMain" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-lg-6">
                            <blockquote style="border-left:none">
                                <div class="media">
                                    <div class="media-left">
                                                <asp:Image ID="profile_photo" CssClass="img-circle media-object" runat="server" ImageUrl='<%# Bind("profile_photo") %>' Height="40px" Width="40px" />
                                            </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">
                                            <asp:Label ID="lbl_fn" runat="server" Text='<%#Bind("fn") %>' ForeColor="Black"></asp:Label>&nbsp;
                                            <asp:Label ID="lbl_ln" runat="server" Text='<%#Bind("ln") %>' ForeColor="Black"></asp:Label>
                                        </h4>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("msg") %>' CssClass="text-justify" ForeColor="Black"></asp:Label>&nbsp;
                                        <br /><asp:Label Font-Size="Small" ID="Label2" runat="server" Text='<%#Bind("date_time") %>' CssClass="text-right" ForeColor="Black"></asp:Label>
                                    </div>
                                </div>    
                            </blockquote>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            </ContentTemplate></asp:UpdatePanel>
            <div class="row">
                <div class="col-lg-11 col-md-10 col-sm-9 col-xs-9" style="padding:0">
                    <asp:UpdatePanel runat="server"><ContentTemplate>
                    <asp:TextBox ID="txt_msg" CssClass="input-lg" Visible="false" runat="server" Height="45px" TextMode="MultiLine" Font-Size="Large" Width="100%"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txt_msg" WatermarkCssClass="font_gray" WatermarkText="Type new message"></asp:TextBoxWatermarkExtender>
                    </ContentTemplate></asp:UpdatePanel>
                </div>
                <div class="col-lg-1 col-md-2 col-sm-3 col-xs-3" style="padding:0">
                    <asp:UpdatePanel runat="server"><ContentTemplate>
                    <asp:Button ID="btn_send" CausesValidation="false" runat="server" Visible="false" OnClick="btn_send_Click" Text="Send" CssClass="btn btn-lg btn-success"/>
                    </ContentTemplate></asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div><br /><br /><br /><br />
</asp:Content>