<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create Promo Code.aspx.cs" Inherits="GUCera.Create_Promo_Code" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="Style.css" rel="stylesheet" />
    <title>Promo code</title>
    <link rel="icon" href="Stock/GUCERA.png" type="image/x-icon" />
</head>
<body>
        <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1"  runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2"  runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3"  runat="server" />


	    <div style="height:500px"   class="box">
        <img src="Stock/promo.png"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error" style="color:red" runat="server"  CssClass="lbl"  />
         <h2>Create Promo Code</h2>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter The Code" CssClass="lbl"  />
            <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="code">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="code" runat="server"  placeholder="Enter prome Code" CssClass="txt"  />

             <asp:Label ID="Label2" runat="server" Text="Enter The IssueDate" CssClass="lbl"  />
             <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="issueDate">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="issueDate" TextMode="Date" runat="server"   CssClass="txt"  />

            <asp:Label ID="Label3" runat="server" Text="Enter The ExpiryDate" CssClass="lbl"></asp:Label>  
            <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="expiryDate">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="expiryDate" runat="server" TextMode="Date"  CssClass="txt"></asp:TextBox>
     
            <asp:Label ID="Label4" runat="server" Text="Enter The Discount" CssClass="lbl"></asp:Label>
             <asp:RequiredFieldValidator id="Validator" runat="server" forecolor="Red" Errormessage="*" ControlToValidate="discount">
            </asp:RequiredFieldValidator>
            <asp:TextBox ID="discount" runat="server" TextMode="Number" placeholder="Enter Discount amount" CssClass="txt"></asp:TextBox>
            <asp:Label ID="msg" runat="server" CssClass="lbl" />
            <asp:Button ID="Button1" runat="server" OnClick="Create_PromoCode" Text="Create" CssClass="button" />
            <asp:Button ID="HomePage" runat="server" OnClick="Home" CausesValidation="false"  Text="Home page" class="button" />
        </div>
    </form>
            </div>
</body>
</html>
