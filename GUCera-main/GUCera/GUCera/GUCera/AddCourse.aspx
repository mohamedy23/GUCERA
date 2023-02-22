<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="GUCera.AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <title>Add Courses </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

	<link href="Style.css" rel="stylesheet" />
    
</head>
<body>
        <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1"  runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2"  runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3"  runat="server" />


	    <div style="height:450px" class="box">
        <img src="Stock/add.png"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error" runat="server"  CssClass="lbl"  />
         <h2>Add Course</h2>
    
        <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Name of The Course" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="CourseName">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="CourseName" runat="server" maxlength="10" placeholder="Enter Name of The Course" CssClass="txt" />

        <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="CreditHours of The Coure" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="CourseCreditHours">
        </asp:RequiredFieldValidator>
        <asp:TextBox ID="CourseCreditHours" TextMode="Number" runat="server" placeholder="Enter CreditHours of The Coure" CssClass="txt"  />
        
         <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Price of The Course" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="CoursePrice">
        </asp:RequiredFieldValidator>
        <asp:TextBox ID="CoursePrice" runat="server" MaxLength="7" placeholder="Enter Price of The Course" CssClass="txt"  />

		<asp:Button ID="InsAddCourse" runat="server" OnClick="InstAddCourse" Text="Add course" CssClass="button" />
        <asp:Button ID="HomePage" runat="server" OnClick="goHomePage" CausesValidation="false" Text="Home page" class="button" />

    </form>
	</div>
</body>
</html>
