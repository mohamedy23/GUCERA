<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="GUCera.Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	 <title>Instructor Home </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

	<link href="styleInstructor.css" rel="stylesheet" />

</head>
<body>
	<div class="instructorbox">

		<img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />
		  <asp:Label ID="lblwelcome" Text="Welcome" CssClass="lblwelcome" runat="server" />
       <asp:Label ID="Label1" Text="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" CssClass="lblwelcome" runat="server" />
    <form id="form1" runat="server">
		<asp:Button ID="InstAddCourse" runat="server" OnClick="InsAddCourse" Text="Add Course" CssClass="button" />
				<asp:Button ID="UpdateCourseContent" runat="server" OnClick="updatecontent" Text="Update Course Content" CssClass="button" />
		<asp:Button ID="UpdateCourseDescription" runat="server" OnClick="updatedescription" Text="Update Course Description" CssClass="button" />
    	<asp:Button ID="InstDefineAssignments" runat="server" OnClick="InsDefineAssignments" Text="Define Assignments " CssClass="button" />
		<asp:Button ID="InstViewAssignments" runat="server" OnClick="InsViewAssignments" Text="View Assignments" CssClass="button" />
	    <asp:Button ID="InstGradeAssignments" runat="server" OnClick="InsGradeAssignments" Text="Grade Assignments" CssClass="button" />
		<asp:Button ID="InstViewfeedback" runat="server" OnClick="InsViewfeedback" Text="View the feedback" CssClass="button" />
		<asp:Button ID="InstIssueCertificate" runat="server" OnClick="InsIssueCertificate" Text="Issue Certificate" CssClass="button" />
		<asp:Button ID="profileInstructor" runat="server"  Text="View My Profile" OnClick="viewProfile" CssClass="button" />
		<asp:Button ID="newMobile" runat="server" OnClick="addMob"  Text="Add a new telephone number" CssClass="button"  />
		<asp:Button  runat="server" OnClick="logout"   Text="Logout" CssClass="button2"  />

    </form>
		</div>
</body>
</html>
