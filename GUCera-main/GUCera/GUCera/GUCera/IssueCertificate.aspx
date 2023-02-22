<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueCertificate.aspx.cs" Inherits="GUCera.IssueCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <title>Issue Certificate </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

<link href="Style.css" rel="stylesheet" />
  
</head>
<body>
		    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />


	    <div style="height:500px" class="box" >
        <img src="Stock/certificate.png"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error"  runat="server"  CssClass="lbl"  />
         <h2>Issue Certificate To Student</h2>
    <form id="form1" runat="server">
		<asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Student ID" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="StudentIDtoIssue">
         </asp:RequiredFieldValidator> 
         <asp:TextBox  ID="StudentIDtoIssue"  TextMode="Number" runat="server"  placeholder="Enter ID of The Student" CssClass="txt" />

		<asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Course ID" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="CourseIDtoIssue" >
         </asp:RequiredFieldValidator> 
         <asp:TextBox ID="CourseIDtoIssue"  TextMode="Number" runat="server"  placeholder="Enter ID of The Course" CssClass="txt" />
>
         <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Issue Date" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="IssueDate">
         </asp:RequiredFieldValidator> 
         <asp:TextBox ID="IssueDate" TextMode="Date" runat="server"  CssClass="txt" />

		<asp:Button ID="IssueButtonID" runat="server" OnClick="issueCer" Text="Issue Certificate" class="button" />
		<asp:Button ID="HomePageGradeAssignmnets" runat="server" OnClick="HomePage" CausesValidation="false" Text="Home Page" CssClass="button" />

    </form>
	</div>
</body>
</html>
