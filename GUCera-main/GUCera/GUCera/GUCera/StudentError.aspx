<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentError.aspx.cs" Inherits="GUCera.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Freestyle Script" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#CC0000" Text="THE DATA YOU ENTERED IS INVALID"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Font-Names="Freestyle Script" Font-Size="XX-Large" Text="Main Page" OnClick="Button1_Click" />
    </form>
</body>
</html>
