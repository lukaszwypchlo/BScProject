<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="WebApplication4.Confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #seanceData {
                margin-left: 100px;
                margin-top: 50px;
            }

        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="marg">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Potwierdzenie</asp:Label>
        </div>
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
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px; clear: left;" />
    <br />
    <div class="buttNStepDiv">

            <asp:Button ID="Button1" runat="server" Text="WSTECZ" CssClass="btnNStep" onClick="ClickWstecz" />
            <asp:Button ID="Button2" runat="server" Text="DALEJ" CssClass="btnNStep" Height="50px" Width="120px" OnClick="ClickDalej" />

        </div>
        <br />
        <br />
        <br />
</asp:Content>
