<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="mainDiv">

        <div>
            <div style="float: left; width: 73%; height:350px;overflow:hidden; background-image: url(../Images/baner1.png);background-size:100%;">
                <asp:HyperLink runat="server" NavigateUrl="~\\Info.aspx?val=6" Text="Drive" CssClass="banText" />
            </div>
            
            <div style="float: left; width: 27%;height:350px;overflow:hidden;">
                <div style="background-image: url(../Images/baner2.jpeg);background-size:100%; height: 175px;">
                    <asp:HyperLink runat="server" NavigateUrl="~\\Info.aspx?val=7" Text="Pingwiny z Madagaskaru" CssClass="banText" />
                </div>
                
                <div style="background-image: url(../Images/baner3.jpg);background-size:100%; height: 175px;">
                    <asp:HyperLink runat="server" NavigateUrl="~\\Info.aspx?val=5" Text="Furia" CssClass="banText" />
                </div>
                
            </div>
            
        </div>

        <div id="day" runat="server" style="margin-top: 410px;">
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Repertuar</asp:Label>
        <asp:Label ID="RepData" runat="server" Font-Size="Medium">Poniedziałek, 1 czerwca</asp:Label>
        </div>

        <br />
        <br />

        <asp:ListView runat="server" ID="lista" OnItemDataBound="ListaItemDataBound">
            <ItemTemplate>
                <div class="prime">
                    <div class="godz1">
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Info.aspx?val="+Eval("idfilm") %>' Text='<%# Eval("Tytul") %>' CssClass="hlg1"/>
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
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~\\Info.aspx?val="+Eval("idfilm") %>' Text='<%# Eval("Tytul") %>' CssClass="hlg1"/>
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
        <br />

    </div>
    
</asp:Content>
