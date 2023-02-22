<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineAssignment.aspx.cs" Inherits="GUCera.DefineAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <title>Define Course </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="Style.css" rel="stylesheet" />
   
</head>
<body>
	    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />


	    <div style="top:53% ; height:700px ; width:700px" class="box">
        <img src="Stock/assignment.png" style="left:300px"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error"  runat="server"  CssClass="lbl"  />
         <h2>Define Assignments of Your Courses</h2>
    <form id="form1" runat="server">

		
        <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Course ID" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="CourseIDtoDefine">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="CourseIDtoDefine" TextMode="Number" runat="server"  placeholder="Enter ID of The Course" CssClass="txt" />

	<!---	<asp:Label ID="Label2" runat="server" CssClass="lbl" Text="AssignmentType" />
		<asp:RadioButton ID="Assignment" runat="server" Text="Quiz" GroupName="type" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:RadioButton ID="Project" runat="server" Text="Project" GroupName="type" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:RadioButton ID="Exam" runat="server" Text="Exam" GroupName="type" />--->

		  <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Number of Assignment" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="AssignmentNumberToDefine">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="AssignmentNumberToDefine" TextMode="Number" runat="server" placeholder="Enter Number of Assignment" CssClass="txt" />
	
		 <asp:Label ID="Label4" runat="server" CssClass="lbl" Text="Full Grade of Assignment" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="AssignmentfullGradeToDefine">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="AssignmentfullGradeToDefine" TextMode="Number" runat="server"  placeholder="Enter Full Grade of Assignment" CssClass="txt" />

		 <asp:Label ID="Label5" runat="server" CssClass="lbl" Text="Weight of Assignment" />
         <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="AssignmentWeightToDefine">
        </asp:RequiredFieldValidator>
         <asp:TextBox  ID="AssignmentWeightToDefine" MaxLength="5" runat="server" placeholder="Enter Weight of Assignment" CssClass="txt" />

		<asp:Label ID="Label6" runat="server" CssClass="lbl" Text="Deadline of Assignment" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="AssignmentDeadlineToDefine">
        </asp:RequiredFieldValidator>
        <asp:TextBox  ID="AssignmentDeadlineToDefine" TextMode="Date" runat="server"  CssClass="txt" />

		<asp:Label ID="Label7" runat="server" CssClass="lbl" Text="Content of Assignment" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" ControlToValidate="AssignmentContentToDefine">
        </asp:RequiredFieldValidator>
        <asp:TextBox  ID="AssignmentContentToDefine" runat="server" TextMode="MultiLine" Rows="3" maxlength="200" Height="50px"  style="resize:none"  placeholder="Enter Content of Assignment" CssClass="txt" />
        
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*" InitialValue="-1" ControlToValidate="typeAssignment">
        </asp:RequiredFieldValidator>
        <asp:DropDownList ID="typeAssignment" runat="server" CssClass="txt">
        <asp:ListItem Text="Select Assignment Type" Value="-1"> </asp:ListItem>
        <asp:ListItem Text="Quiz" Value="Quiz"></asp:ListItem>
        <asp:ListItem Text="Project" Value="Project"></asp:ListItem>
        <asp:ListItem Text="Exam" Value="Exam"></asp:ListItem>
        </asp:DropDownList>


		<asp:Button ID="DefineTheAssignmentID" runat="server" OnClick="DefineTheAssignment" Text="Define The Assignment" class="button" />
		<asp:Button ID="HomePageDefineID" runat="server" OnClick="HomePageDefine" CausesValidation="false" Text="Home Page"  CssClass="button" />



    </form>
	</div>
</body>
</html>
