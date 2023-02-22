<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeAssignment.aspx.cs" Inherits="GUCera.GradeAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	    <title>Grade Assignments </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

 <link href="Style.css" rel="stylesheet" />
    
</head>
<body>
     <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />


	    <div class="box">
        <img src="Stock/grades.jpg"  alt="Alternate Text" class="addcourse" />
			<asp:Label ID="error"  runat="server"  CssClass="lbl"  />
         <h2>Grade Assignments</h2>
    <form id="form1" runat="server">
    	
		<!------->
		 <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Student ID" />
		 <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="StudentIDtoGrade">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="StudentIDtoGrade" TextMode="Number" runat="server"  placeholder="Enter ID of The Student" CssClass="txt" />

		 <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Course ID" />
		 <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="CourseIDtoGrade">
        </asp:RequiredFieldValidator>
         <asp:TextBox   ID="CourseIDtoGrade" TextMode="Number" runat="server"  placeholder="Enter ID of The Course" CssClass="txt" />

		 <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Assignment Number" />
		 <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="AssignmentNumberToGrade">
        </asp:RequiredFieldValidator>
         <asp:TextBox   ID="AssignmentNumberToGrade" TextMode="Number" runat="server"  placeholder="Enter Assignment Number" CssClass="txt" />

			<!---	<fieldset style="width:35%">
			<legend>Assignment Type</legend>
			<br />
		<asp:RadioButton ID="Assignment" runat="server" Text="Assignment" GroupName="type" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:RadioButton ID="Project" runat="server" Text="Project" GroupName="type" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:RadioButton ID="Exam" runat="server" Text="Exam" GroupName="type" />
			<br />
			<br />

		</fieldset>-->
		<asp:Label ID="Label4" runat="server" CssClass="lbl" Text="The Grade" />
		<asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="gradeTostudent">
        </asp:RequiredFieldValidator>
        <asp:TextBox   ID="gradeTostudent"  MaxLength="6" runat="server"  placeholder="Enter The Grade" CssClass="txt" />

		<asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" InitialValue="-1" ControlToValidate="typeAssignment">
        </asp:RequiredFieldValidator>
		<asp:DropDownList ID="typeAssignment" runat="server" CssClass="txt">
        <asp:ListItem Text="Select Assignment Type" Value="-1"> </asp:ListItem>
        <asp:ListItem Text="Quiz" Value="Quiz"></asp:ListItem>
        <asp:ListItem Text="Project" Value="Project"></asp:ListItem>
        <asp:ListItem Text="Exam" Value="Exam"></asp:ListItem>
        </asp:DropDownList>
		
		<asp:Button ID="gradeButtonID" runat="server" OnClick="GradeAssignmentToStudent" Text="Set the Grade" class="button" />
		<asp:Button ID="HomePageGradeAssignmnets" runat="server" OnClick="HomePage" CausesValidation="false"  Text="Home Page" CssClass="button" />
    </form>
	</div>
</body>
</html>
