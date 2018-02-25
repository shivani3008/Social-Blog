<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container well">
       
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
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
                                </div>
                            </div>
                        </blockquote>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <h3 class="text-center">
            <asp:Label ID="no_record" runat="server" Text="No Record Found" Visible="false"></asp:Label>
        </h3>
    </div>
</asp:Content>