<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="WebApplication4.Room" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #inne, #tytul, #wybor {
            margin-left: 100px;
        }

        

        .numOfPlaces {
            margin-left:40%;
        }

        .numOfSector {
            text-align: right;
            margin-right: 5px;
            margin-left: 5px;
        }

        .buttRes {
            width: 30px;
            height: 30px;
            margin: 4px 5px 4px 5px;
        }

    </style>

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div id="mainDiv">

        <input type="hidden" id="hidIsCommitted" runat="server" />
        <br /><br />
        <div id="wybor">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Wybór miejsca</asp:Label>
        </div>
        <br />
        <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
        <br />

        <div id="tytul">
            <asp:Label runat="server" ID="labTytul" Font-Size="X-Large" Font-Bold="true"></asp:Label>
        </div>
        <br />
        <div id="inne">
            data: <asp:Label runat="server" ID="labDate" Font-Size="Medium" Font-Bold="true"></asp:Label> / godzina: <asp:Label runat="server" ID="labHour" Font-Size="Medium" Font-Bold="true"></asp:Label> / sala: <asp:Label runat="server" ID="labSala" Font-Size="Medium" Font-Bold="true"></asp:Label>
            <br />
            
        </div>

        <br />
        <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
        <br />

        <div style="align-content: center; margin-left: 85px;">
            <asp:Table runat="server" Height="40px">
                <asp:TableRow>
                    <asp:TableCell Width="175px">               
                    </asp:TableCell>
                    <asp:TableCell Width="530px" BackColor="Blue" Style="text-align: center; font-size: 1.20em; font-weight: 900; color: #fff">    
                EKRAN            
                    </asp:TableCell>
                    <asp:TableCell Width="100px">         
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <br />
        <br />
        <br />

        <div style="align-content: center; ">
            <asp:UpdatePanel runat="server" ID="pnlColorSelect">
                <ContentTemplate>
                    <div id="myDiv" runat="server" style="margin-left: 11%; width: 700px; text-align: right;"></div>
                    
                    <br /><br />

                    <asp:Label runat="server" ID="Label2" Font-Size="Medium" Font-Bold="true" CssClass="numOfPlaces">Ilość wybranych miejsc: </asp:Label> <asp:Label runat="server" ID="labIloscMiejsc" Font-Size="Medium" Font-Bold="true">0</asp:Label>             
                            
                </ContentTemplate>
                
            </asp:UpdatePanel>
        </div>
        <br />
        <br />
        <br />

        <div style="align-content: center; margin-left: 100px;">
            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="110px">               
                    </asp:TableCell>
                    <asp:TableCell Width="40" Height="31">
                        <asp:Image runat="server" ImageUrl="~/Images/Free.png" Width="30" Height="30" />
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                Miejsca wolne.
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                    
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                
                    </asp:TableCell>
                    <asp:TableCell Width="40" Height="31">
                        <asp:Image runat="server" ImageUrl="~/Images/Res.png" Width="30" Height="30" />
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                Wybrane miejsca.
                    </asp:TableCell>

                    <asp:TableCell Width="31" Height="31">
                
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                
                    </asp:TableCell>
                    <asp:TableCell Width="40" Height="31">
                        <asp:Image runat="server" ImageUrl="~/Images/Occ.png" Width="30" Height="30" />
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                Miejsca zarezerwowane.
                    </asp:TableCell>
                    <asp:TableCell Width="31" Height="31">
                
                    </asp:TableCell>
                    <asp:TableCell Width="100px">               
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <br />
        <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
        <br />

        <div class="buttNStepDiv">

            <asp:Button ID="Button1" runat="server" Text="WSTECZ" CssClass="btnNStep" onClick="ClickWstecz" />
            <asp:Button ID="Button2" runat="server" Text="DALEJ" CssClass="btnNStep"  Height="50px" Width="120px" OnClick="ClickDalej" />

        </div>

        <br />
        <br />
        <br />

    </div>
</asp:Content>
