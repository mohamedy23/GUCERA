<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="enrollInCourse.aspx.cs" Inherits="GUCera.enrollInCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Enroll in Courses </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="styleEnroll.css" rel="stylesheet" />
</head>
<body>
     <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
        
        <div class="enrollbox">
            <img src="Stock/enroll.png"  alt="Alternate Text" class="enroll" />
            
            <form id="form1" runat="server">
                <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="ENROLL IN A COURSE" Font-Size="30px" runat="server" />
            <br />
            <br />
            <asp:Label Text="Course ID" CssClass="lblcid" runat="server" />
                  <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator1" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="courseIdTextBox">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="courseIdTextBox" TextMode="Number" CssClass="txtcid" placeholder="Enter the course id " runat="server" />

            <asp:Label Text="Instructor ID" CssClass="lblinsid" runat="server" />
                <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator2" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="instructorIdTextBox">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="instructorIdTextBox" TextMode="Number" CssClass="txtinsid" placeholder="Enter the instructor id" runat="server" />
            <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" />
                
                <br/>
            <asp:Button ID="enrollButton" Text="Enroll" CssClass="btnsubmit" runat="server" OnClick="enrollaction" />
            <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="backbtn" CausesValidation="false" />

             </form>
        </div>
   
</body>

</html>
