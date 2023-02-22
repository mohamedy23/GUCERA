<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GUCera.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleAdmin.css" rel="stylesheet" />
    <title>Home</title>
    <link rel="icon" href="Stock/GUCERA.png" type="image/x-icon" />
</head>
<body>
     
    <div style="height:500px" class="box">
    	<img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />
    <form id="form1" runat="server">
            <asp:Button ID="Button1" runat="server" OnClick="List_Courses" Text="Courses" CssClass="button" />
            <asp:Button ID="Button2" runat="server" OnClick="List_Not_Accepted_Courses" Text="Non Accepted Courses" CssClass="button"  />
            <asp:Button ID="Button3" runat="server" OnClick="List_Requested_Courses" Text="Requested Courses" CssClass="button"  />
            <asp:Button ID="Button4" runat="server" OnClick="Create_Promo_Code" Text="Create Promo Code" CssClass="button"  />
            <asp:Button ID="Button5" runat="server" OnClick="Issue_Promo_Code" Text="Issue Promo Code" CssClass="button"  />
           <asp:Button ID="Button6" runat="server" OnClick="addMob"  Text="Add a new telephone number" CssClass="button"  />
           <asp:Button  runat="server" OnClick="logout"   Text="Logout" CssClass="button3"  />
    </form>
        </div>
        
</body>
</html>
