<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="GUCera.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Student Home </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
    <link href="styleStudent.css" rel="stylesheet" />
</head>
<body>
    <div class="studentbox">
        <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
       <asp:Label ID="lblwelcome" Text="Welcome" CssClass="lblwelcome" runat="server" />
       <asp:Label ID="Label1" Text="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" CssClass="lblwelcome" runat="server" />
        <form id="form1" runat="server">
            
            
        <asp:Button ID="Button6" runat="server" CssClass="button1" OnClick="Button6_Click" Text="View your profile" />
        <asp:Button ID="Button10" runat="server" CssClass="button2" OnClick="Button10_Click" Text ="Add a new telephone number" />
        <asp:Button ID="Button7" runat="server" CssClass="button3" OnClick="Button7_Click" Text="View available courses" />
        <asp:Button ID="Button8" runat="server" CssClass="button4" OnClick="Button8_Click" Text="Enroll in a course" />
        <asp:Button ID="Button1" runat="server" CssClass="button5" OnClick="Button1_Click" Text="View Assignments" />
        <asp:Button ID="Button2" runat="server" CssClass="button6" OnClick="Button2_Click" Text="Submint An Assignment" />
        <asp:Button ID="Button3" runat="server" CssClass="button7" OnClick="Button3_Click" Text="View Your Grades" />
        <asp:Button ID="Button4" runat="server" CssClass="button8" OnClick="Button4_Click" Text="Add Feedback" />
        <asp:Button ID="Button5" runat="server" CssClass="button9" OnClick="Button5_Click" Text="View My Certificates " />
        <asp:Button ID="Button9" runat="server" CssClass="button10" OnClick="Button9_Click" Text="Add a credit card " />
        <asp:Button ID="Button11" runat="server" CssClass="button11" OnClick="Button11_Click" Text="View your promo codes " />
        <br />
        <asp:Button ID="logout" runat="server" CssClass="btnlogout" OnClick="logOut" Text="Log out"/>

        </form>
    </div>
</body>
</html>