<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage_after.master" AutoEventWireup="true" CodeFile="timeline.aspx.cs" Inherits="AutoSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .height_auto{
            height: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick"></asp:Timer>
    <div class="container">
        <h2 class="text-center">
            Timeline
        </h2>
        <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
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
                                    <asp:Label ID="lbl_caption" runat="server" Text='<%#Bind("friend_caption") %>'></asp:Label></b>
                    
                                </div>
                            </div>
                        </blockquote>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Image ID="img" runat="server" CssClass="height_auto" Width="100%" ImageUrl='<%# Bind("friend_image") %>' />  
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <asp:LinkButton ID="lnk_likes" runat="server" CommandName="onLike" CommandArgument='<%#Bind("friend_post_id") %>'><span class="glyphicon glyphicon-heart-empty"></span></asp:LinkButton>
                    </div>
                    <div class="col-lg-9">
                        <asp:Label Font-Size="Small" ID="lbl_date_time" runat="server" Text='<%#Bind("friend_date_time") %>' CssClass="text-right" ForeColor="Black"></asp:Label>
                    </div>
                </div>              
            </ItemTemplate>
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <h3 class="text-center">
            <asp:Label ID="no_request" runat="server" Text="No new Requests" Visible="false"></asp:Label>
        </h3>
    </div>
</asp:Content>

