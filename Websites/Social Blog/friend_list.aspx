<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="friend_list.aspx.cs" Inherits="friend_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="5000"></asp:Timer>
    <div class="container">
        <h2 class="text-center">
            Friends
        </h2>
        <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
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
                                    <asp:LinkButton ID="lnk_more" runat="server" CommandName="onMore" CommandArgument='<%#Bind("friend_reg_id") %>' Font-Size="Medium">View More Details</asp:LinkButton>
                                    <br />
                                    <asp:LinkButton ID="lnk_unfriend" CssClass="btn btn-danger" runat="server" Text="Unfriend" CommandName="onUnfriend" CommandArgument='<%#Bind("friend_reg_id") %>'><span class="glyphicon glyphicon-ok"></span> Unfriend</asp:LinkButton>
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
    </div>
</asp:Content>