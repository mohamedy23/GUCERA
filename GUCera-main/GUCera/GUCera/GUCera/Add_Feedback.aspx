<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Feedback.aspx.cs" Inherits="GUCera.Add_Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <title>Add Feedback </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="styleFeedback.css" rel="stylesheet" />
</head>
<body>
    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
      <div class="feedbackbox">
          <img src="Stock/feedback.png"  alt="Alternate Text" class="feedback" />
           
       <form id="form1" runat="server">
           <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="ADD<br/>FEEDBACK" Font-Size="30px" runat="server" />
            <br />
            <br />
             <asp:Label Text="Course ID" CssClass="lblcid" runat="server" />
             <asp:RequiredFieldValidator 
             ID="RequiredFieldValidator1" runat="server" 
             ForeColor ="Red" Errormessage="*" ControlToValidate="CourseID">
             </asp:RequiredFieldValidator>
             
              <asp:TextBox ID="CourseID" TextMode="Number" CssClass="txtcid" placeholder="Enter the course id " runat="server" />

              <asp:Label Text="Feedback" CssClass="lblfeedback" runat="server" />
              <asp:RequiredFieldValidator 
              ID="RequiredFieldValidator2" runat="server" 
              ForeColor="Red" Errormessage="*" ControlToValidate="Feedback">
              </asp:RequiredFieldValidator>

              <asp:TextBox ID="Feedback" MaxLength="100" CssClass="txtfeedback" placeholder="Enter your feedback" runat="server" />
              
              <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" />
                
              <br/>
              <asp:Button ID="Button1" Text="Submit" CssClass="btnsubmit" runat="server" OnClick="Button1_Click" />
              <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="backbtn" CausesValidation="false" />

           </form>
      </div>

           
    
</body>
</html>
