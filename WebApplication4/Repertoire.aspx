<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Repertoire.aspx.cs" Inherits="WebApplication4.Repertoire" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>

    </style>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <style>
        .img {
            margin-left: 30px;
        }

        .prime, .alt {
            overflow: hidden;
            height: 69px;
            position: relative;
            padding: 5px 0px 5px 5px;
        }

        .godz1 {
            height: 69px;
            overflow: hidden;
            display: inline;
            float: left;
            width: 300px;
        }

        .hlg1 {
            display: inline;
            float: left;
            padding-left: 1%;
        }
        .godz2 {
            padding-top: 2%;
            padding-right: 2%;
            display: inline;
            float: left;
        }

        .category {
            padding-left: 1%;
        }

    </style>

    <div class="mainDiv">

        <br />

        <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Repertuar</asp:Label>
        <asp:Label ID="RepData" runat="server" Font-Size="Medium">Poniedziałek, 1 czerwca</asp:Label>

        <div id="day" runat="server" style="margin-top: 30px;">
        </div>

        <br />

        <asp:ListView runat="server" ID="lista" OnItemDataBound="ListaItemDataBound">
            <ItemTemplate>
                <div class="prime">
                    <div class="godz1">
                    <asp:Image runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" CssClass="hlg1" />
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Info.aspx?val="+Eval("idfilm") %>' Text='<%# Eval("Tytul") %>' CssClass="hlg1" />
                        <br />
                    <span>
                        <asp:Label runat="server" Text='<%# Eval("Kategoria") %>' Font-Size="Medium" CssClass="category"/></span>
                    </div>
                    <div class="godz2">
                        <asp:Repeater runat="server" ID="seanse">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Room.aspx?val="+Eval("id") %>' Text='<%# Eval("godzina") %>' CssClass="hlg2"/>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div class="alt">
                    <div class="godz1">
                    <asp:Image runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50px" CssClass="hlg1" />
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Info.aspx?val="+Eval("idfilm") %>' Text='<%# Eval("Tytul") %>' CssClass="hlg1"/>
                        <br />
                    <span>
                        <asp:Label runat="server" Text='<%# Eval("Kategoria") %>' Font-Size="Medium" CssClass="category"/></span>
                    </div>
                    <div class="godz2">
                    <asp:Repeater runat="server" ID="seanse">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Room.aspx?val="+Eval("id") %>' Text='<%# Eval("godzina") %>' CssClass="hlg2"/>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </div>
            </AlternatingItemTemplate>
        </asp:ListView>

        <br />

    </div>
</asp:Content>
