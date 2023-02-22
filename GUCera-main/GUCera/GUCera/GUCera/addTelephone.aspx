<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addTelephone.aspx.cs" Inherits="GUCera.addTelephone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Add Telephone </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="styleTelephone.css" rel="stylesheet" />
</head>
<body>
        <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
        <div class="telephonebox">
           
            <img src="Stock/phone.png"  alt="Alternate Text" class="phone" />

            
            
            <form id="form1" runat="server">
               <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="PLEASE ENTER YOUR PHONE NUMBER" Font-Size="30px" runat="server" />
                 <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator1" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="telephoneTextBox">
        </asp:RequiredFieldValidator>
                <asp:TextBox ID="telephoneTextBox" TextMode="Number" runat="server" CssClass="txtphone"  />
                <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" /><br\ />
                <asp:Button ID="add" runat="server" Text="Add" CssClass="btnadd" OnClick="addtelephone" /><br /><br />
            
                <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="backbtn" CausesValidation="false" />
                </form>
        </div>
    
</body>
</html>
