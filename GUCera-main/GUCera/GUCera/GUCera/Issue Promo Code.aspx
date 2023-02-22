<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issue Promo Code.aspx.cs" Inherits="GUCera.Issue_Promo_Code" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style.css" rel="stylesheet" />
    <title>Promo code</title>
    <link rel="icon" href="Stock/GUCERA.png" type="image/x-icon" />
</head>
<body>
                 <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />


	    <div style="height:400px" class="box">
        <img src="Stock/promo.png"  alt="Alternate Text" class="addcourse" />
         <h2>Issue Promo Code</h2>
       <form id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Student Id" CssClass="lbl"></asp:Label>
            <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="Sid">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="Sid" TextMode="Number" runat="server" placeholder="Enter The Student Id" CssClass="txt"></asp:TextBox>
           
           <asp:Label ID="Label2" runat="server" Text="Promo Code Id" CssClass="lbl"></asp:Label>
           <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="Pid">
           </asp:RequiredFieldValidator> 
           <asp:TextBox ID="Pid" runat="server" placeholder="Enter The Promo Code"  CssClass="txt"></asp:TextBox>
           <asp:Label ID="msg" runat="server" CssClass="lbl" />
           <asp:Button ID="Button1" runat="server" OnClick="Issue_PromoCode" Text="Go" CssClass="button" />
           <asp:Button ID="HomePage" runat="server"  Text="Home page" CausesValidation="false" OnClick="Home" class="button" />
    </form>
            </div>
</body>
</html>
