<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication4.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .personData {
            margin-left: 40%;
            height: 200px;
            
        }

        .personaDataDiv {
            display: block;
            width: 300px;
            height: 50px;
        }

        .center {
            float: right;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <input type="hidden" id="hidIsCommitted" runat="server" />
    <div class="marg">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large">Dane osobowe</asp:Label>
     </div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
    <br />
    <div class="personData">
        <div class="personaDataDiv">
            <asp:Label ID="labName" runat="server" Font-Size="Large">Imię: </asp:Label>
            <asp:TextBox ID="tbName" runat="server" CssClass="center"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredName" runat="server"
              ControlToValidate="tbName"
              ErrorMessage="Pole imię musi być wypełnione."
                ValidationGroup="valGroup"  
                CssClass="center"
              ForeColor="Red">
            </asp:RequiredFieldValidator>         
        </div>
        <div class="personaDataDiv">
            <asp:Label ID="labSurmane" runat="server" Font-Size="Large">Nazwisko: </asp:Label>
            <asp:TextBox ID="tbSurname" runat="server" CssClass="center"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredSurname" runat="server"
              ControlToValidate="tbSurname"
              ErrorMessage="Pole nazwisko musi być wypełnione."
              ValidationGroup="valGroup"  
                CssClass="center"
              ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
        <div class="personaDataDiv">
            <asp:Label ID="labPhone" runat="server" Font-Size="Large">Nr. tel: </asp:Label>
            <asp:TextBox ID="tbPhone" runat="server" CssClass="center" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbPhone" runat="server" ValidationGroup="valGroup"  
                CssClass="center" ErrorMessage="Niepoprawy numer telefonu." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
        <div class="personaDataDiv">
            <asp:Label ID="labMail" runat="server" Font-Size="Large">E-mail: </asp:Label>
            <asp:TextBox ID="tbMail" runat="server" CssClass="center"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationGroup="valGroup"  
                CssClass="center" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                 ControlToValidate="tbMail" ForeColor="Red" ErrorMessage="Niepoprawny adres e-mail."></asp:RegularExpressionValidator>
        </div>
    </div>
    <div style="clear: left;"></div>
    <br />
    <hr style="margin-left: 5%; margin-right: 5%; border: dashed; border-width: 1px;" />
    <br />
    <div class="buttNStepDiv">

            <asp:Button ID="Button1" runat="server" Text="WSTECZ" CssClass="btnNStep" onClick="ClickBack" />
            <asp:Button ID="Button2" runat="server" Text="DALEJ" ValidationGroup="valGroup" CssClass="btnNStep" Height="50px" Width="120px" OnClick="ClickRes" />

        </div>
        <br />
        <br />
        <br />
</asp:Content>
