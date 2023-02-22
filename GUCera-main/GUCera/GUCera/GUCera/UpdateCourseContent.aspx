<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCourseContent.aspx.cs" Inherits="GUCera.UpdateCourseContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

      <title>Update Course Content </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="Style.css" rel="stylesheet" />
    
</head>
<body>
	     <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />


	    <div style="height:550px" class="box">
        <img src="Stock/content.png"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error" runat="server"  CssClass="lbl"  />
         <h2>Update Course Content</h2>
    
    <form id="form1" runat="server">
		 <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Course ID" />
                 <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="CourseIDtoUpdate">
         </asp:RequiredFieldValidator> 
         <asp:TextBox  ID="CourseIDtoUpdate" TextMode="Number" runat="server" placeholder="Enter Course ID" CssClass="txt" />

		 <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Course Content" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="CourseContenttoUdate" >
         </asp:RequiredFieldValidator> 
         <asp:TextBox  ID="CourseContenttoUdate" runat="server"  Height="120px" TextMode="MultiLine" Rows="8" maxlength="200" style="resize:none" placeholder="Enter Course Content" CssClass="txt" />

		<asp:Button ID="UpdateContentID" runat="server" OnClick="updateContent" Text="Update Content" CssClass="button" />
         <asp:Button ID="HomePage" runat="server" OnClick="goHomePage" CausesValidation="false" Text="Home page" class="button" />

    </form>
			</div>
</body>
</html>
