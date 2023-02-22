<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptReject Courses.aspx.cs" Inherits="GUCera.AcceptReject_Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style.css" rel="stylesheet" />
    <title>Pending courses</title>
    <link rel="icon" href="Stock/GUCERA.png" type="image/x-icon" />
</head>
<body>
         <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />

	    <div style="height:350px"  class="box">
        <img src="Stock/accept.png"  alt="Alternate Text" class="addcourse" />
         <h2>Accept and Reject Courses</h2>
        <form id="form1" runat="server">
        <div>

        <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Enter The Course Id" />
         <asp:RequiredFieldValidator ID="valid"  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="Cid" >
        </asp:RequiredFieldValidator>
        <asp:TextBox ID="Cid" runat="server"  placeholder="Enter Course ID" CssClass="txt"  />
        <asp:label id="msg" runat="server" CssClass="lbl" />

        <asp:Button ID="Button1" runat="server" OnClick="Accept_Reject" Text="Go" CssClass="button"/>
         <asp:Button ID="HomePage" runat="server" OnClick="Home" CausesValidation="false"  Text="Home page" class="button" />

        </div>
    </form>
          </div>
</body>
</html>
