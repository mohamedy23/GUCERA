<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Assignments.aspx.cs" Inherits="GUCera.View_Assignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>View Your Assignments </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
    <link href="styleViewAssignment1.css" rel="stylesheet" />
</head>
<body>

    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />
    
     <div class="assginmentbox" id="assginmentbox" runat="server" >
           
            <img id="img" src ="Stock/assignment.png"  alt="Alternate Text" class="assignment" runat="server" />
           <form id="form1" runat="server">
                <asp:Label id="welcome"  ForeColor="Black" CssClass="lblwelcome"   Text="VIEW ASSGINMENTS" Font-Size="30px" runat="server" />
                <br />
                <br />
                <div id="tobehidden" runat="server">
                <asp:Label Text="Courseid" CssClass="lblcid"  runat="server" />
                <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                forecolor="Red" Errormessage="*" ControlToValidate="courseID">
                </asp:RequiredFieldValidator>

                <asp:TextBox ID="courseID" TextMode="Number" placeholder="Enter the course id" runat="server" CssClass="txtcid"  />
                
                <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" />
                <br />
                <br/> 
                
                <asp:Button ID="view" runat="server" Text="View" CssClass="btnview" OnClick="Button1_Click" /><br /><br />
                <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="backbtn" CausesValidation="false" />
                </div>
               <div class="box2">
                <asp:Button ID="Button2" runat="server" Text="Back" CssClass="button" OnClick="backbtn" CausesValidation="false" /> 
                <asp:Button ID="Button1" runat="server" Text="Another course" CssClass="button" OnClick="another" CausesValidation="false" />
                <asp:GridView ID="viewAss" runat="server" CssClass="grid2" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White"  ForeColor="#284775"></AlternatingRowStyle>

                   <EditRowStyle BackColor="#999999"></EditRowStyle>

                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                   <HeaderStyle BackColor="#000000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                   <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                   <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                   <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                   <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                   <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
               </asp:GridView>

                   </div>

               </form>

            
               
        </div>
    
         
</body>
</html>
