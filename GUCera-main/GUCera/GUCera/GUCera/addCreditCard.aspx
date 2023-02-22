<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCreditCard.aspx.cs" Inherits="GUCera.addCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <title>Add CreditCard </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="styleCredit.css" rel="stylesheet" />
</head>
<body>
    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
     <div class="creditbox">
            <img src="Stock/creditcard.png"  alt="Alternate Text" class="credit" />
            
         <form id="form1" runat="server">
             <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="ADD<br/>CREDIT CARD" Font-Size="30px" runat="server" />
            <br />
            <br />
            <asp:Label Text="Credit card number" CssClass="lblnumber" runat="server" />
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="numberTextBox">
            </asp:RequiredFieldValidator>

            <asp:TextBox ID="numberTextBox" TextMode="Number"  CssClass="txtnumber" placeholder="Enter the card number " runat="server" />

            <asp:Label Text="Card holder name" CssClass="lblname" runat="server" />
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="cardHolderNameTextBox">
            </asp:RequiredFieldValidator>

            <asp:TextBox ID="cardHolderNameTextBox" MaxLength="16" CssClass="txtname" placeholder="Enter the card holder's name" runat="server" />
            
            <asp:Label Text="Expiry date" CssClass="lbldate" runat="server" />
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="numberTextBox">
            </asp:RequiredFieldValidator>

            <asp:TextBox ID="expiryDateTextBox" TextMode="Date" CssClass ="txtnumber" placeholder="Enter the card expiry date" runat="server" />

            <asp:Label Text="CVV number" CssClass="lblcvv" runat="server" />
            <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="cvvTextBox">
            </asp:RequiredFieldValidator>

            <asp:TextBox ID="cvvTextBox" MaxLength="3" TextMode="Password" CssClass="txtname" placeholder="Enter the card CVV number" runat="server" />
            <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" Font-Bold="True" />
                <br/>
            <asp:Button ID="enrollButton" Text="Add" CssClass="btnsubmit" runat="server" OnClick="addCredit" />
            <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="backbtn" CausesValidation="false" />

             </form>
        </div>
    
</body>
</html>
