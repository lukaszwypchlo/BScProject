<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="WebApplication4.Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="mainDiv">
    <div style="display: inline; float:left; width: 300px;">
        <asp:Image ID="movieImage" runat="server" Width="70%" />
    </div>
    <div style="display: block; float: left;">
        <br/>
        <asp:Label ID="movieTitle" runat="server" Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
        <br/><br/>
        <asp:Label ID="Director" runat="server" Font-Bold="true" Font-Size="Large">Reżyser</asp:Label>
        <br/>
        <asp:Label ID="movieDirector" runat="server" Font-Size="Large"></asp:Label>
        <br/><br/>
        <asp:Label ID="Genre" runat="server" Font-Bold="true" Font-Size="Large">Gatunek</asp:Label>
        <br/>
        <asp:Label ID="movieGenre" runat="server" Font-Size="Large"></asp:Label>
        <br/><br/>
        <asp:Label ID="mTime" runat="server" Font-Bold="true" Font-Size="Large">Czas trwania</asp:Label>
        <br/>
        <asp:Label ID="movieTime" runat="server" Font-Size="Large"></asp:Label><asp:Label ID="Label2" runat="server" Font-Size="Large"> minut</asp:Label>
    </div>
    <div style="display: block; clear: both;">
        <br/><br/>
        <asp:Label ID="movieDesc" runat="server" Font-Size="Large"></asp:Label>
    </div>
       <div style="margin-left: 90%;">
           <asp:Label ID="Label1" runat="server" Font-Size="XX-Small">www.filmweb.pl</asp:Label>
       </div>
   </div>
</asp:Content>
