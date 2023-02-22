<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Submit_Assignments.aspx.cs" Inherits="GUCera.Submit_Assignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Submit Assignment </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
    <link href="styleSubmitAssignment.css" rel="stylesheet" />

</head>
<body>
    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
     <div class="submitbox">
         <img src="Stock/assignment.png"  alt="Alternate Text" class="assignment" />
            
         <form id="form1" runat="server"> 
             <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="SUBMIT ASSIGNMENTS" Font-Size="30px" runat="server" />
            <br />
            <br />
             <asp:Label Text="Course ID" CssClass="lblcid" runat="server" />
             <asp:RequiredFieldValidator 
             ID="RequiredFieldValidator1" runat="server" 
             forecolor="Red" Errormessage="*" ControlToValidate="CourseID">
             </asp:RequiredFieldValidator>

             <asp:TextBox ID="CourseID" TextMode="Number" CssClass="txtcid" placeholder="Enter the course id " runat="server" />

             <asp:Label Text="Assignment number" CssClass="lblassnumber" runat="server" />
             <asp:RequiredFieldValidator 
             ID="RequiredFieldValidator2" runat="server" 
             ForeColor="Red" Errormessage="*" ControlToValidate="AssNumber">
             </asp:RequiredFieldValidator>

             <asp:TextBox ID="AssNumber" TextMode="Number" CssClass="txtassnumber" placeholder="Enter the assignment number" runat="server" />

              <asp:Label  runat="server" CssClass="lbltype" Text="Type"/>
              <asp:RequiredFieldValidator 
              ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
              forecolor="Red" InitialValue="-1" ControlToValidate="AssignType">
              </asp:RequiredFieldValidator>
               <br />
               <br />
            <asp:DropDownList ID="AssignType" runat="server" CssClass="AssignType">
            <asp:ListItem Text="Select the assignment number" Value="-1"> </asp:ListItem>
            <asp:ListItem Text="QUIZ" Value="quiz"></asp:ListItem>
            <asp:ListItem Text="EXAM" Value="exam"></asp:ListItem>
            <asp:ListItem Text="PROJECT" Value="project"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" Font-Bold="True" Font-Names="Bahnschrift" />

             <asp:Button ID="SubmitButton" Text="Submit" CssClass="btnsubmit" runat="server" OnClick="Button1_Click" />
            <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="BackButton_Click" CausesValidation="false" />
         </form>
     </div>
    
</body>
</html>
