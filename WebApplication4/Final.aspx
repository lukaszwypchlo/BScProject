<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="WebApplication4.Final" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="marg">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Podsumowanie</asp:Label>
        </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
    <div id="seanceData" runat="server" class="marg">
        <br />
        <asp:Label runat="server" ID="movieTitle" Font-Size="X-Large" Font-Bold="true"></asp:Label><br /><br />
        data: <asp:Label ID="movieDate" runat="server" Font-Bold="true"></asp:Label>
        / godzina: <asp:Label ID="movieHour" runat="server" Font-Bold="true"></asp:Label>
        / sala: <asp:Label ID="movieRoom" runat="server" Font-Bold="true"></asp:Label>       
    </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
    <br />
    <div id="seatsData" runat="server" style="margin-left: 40%; display: inline; float: left; padding-right: 10px;">
        
    </div>
    <div id="seatsData1" runat="server" style="display: inline; float: left;">
        
    </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px; clear: left;" />
    <br />
    <div id="clientData" runat="server" style="margin-left: 40%;">
        <br />
        <asp:Label ID="Label2" runat="server" >Imię i nazwisko :</asp:Label>
        <asp:Label ID="nameSurmname" runat="server" Font-Bold="true"></asp:Label>
        <br /><br />
        <asp:Label ID="Label3" runat="server" >Nr. telefonu    :</asp:Label>
        <asp:Label ID="phoneNumber" runat="server" Font-Bold="true"></asp:Label>
        <br /><br />
        <asp:Label ID="Label4" runat="server" >Adres e-mail    :</asp:Label>
        <asp:Label ID="e_mailAddress" runat="server" Font-Bold="true"></asp:Label>       
    </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px; clear: left;" />
    <br />
    <div id="resNum" runat="server" style="margin-left: 40%;">
        <br />
        <asp:Label ID="Label5" runat="server" >Numer rezerwacji :</asp:Label>
        <asp:Label ID="resNumber" runat="server" Font-Bold="true"></asp:Label>  
    </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px; clear: left;" />
    <br />
    <div class="buttNStepDiv">

            <asp:Button ID="Button1" runat="server" Text="Zakończ" Font-Bold="true" Font-Size="Large" CssClass="btnNStep" onClick="ClickFin" Width="180px" Height="50px" />

        </div>
    <br /><br /><br />
</asp:Content>
