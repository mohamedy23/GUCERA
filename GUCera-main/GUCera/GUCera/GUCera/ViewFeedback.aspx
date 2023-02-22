<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="GUCera.ViewFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>View Feedbacks </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
<link href="Style.css" rel="stylesheet" />
    
</head>
<body>
    	 <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />

        

    <form id="form1" runat="server">
          <div style="height:400px "  id="tobehidden" runat="server" class="box">
        <img src="Stock/feedback.png"  alt="Alternate Text" class="addcourse" />
            <asp:Label ID="error"  runat="server"  CssClass="lbl"  />
         <h2>View Feedbacks of Courses</h2>

    	<asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Course ID" />
        <asp:RequiredFieldValidator  runat="server" forecolor="Red" Errormessage="*"  ControlToValidate="CourseIDtoView" >
         </asp:RequiredFieldValidator>
        <asp:TextBox  ID="CourseIDtoView" TextMode="Number" runat="server"  placeholder="Enter ID of The Course" CssClass="txt" />

		<asp:Button ID="viewFeedbacks" runat="server"  OnClick="viewFeed" Text="View Feedbacks" CssClass="button" />
        <asp:Button ID="HomePageViewFeed" runat="server" CausesValidation="false" OnClick="HomePage" Text="Home Page"   CssClass="button" />
       </div>
        <div id="tobehidden2" runat="server" class="box2">
         <asp:Button  runat="server" OnClick="HomePage" CausesValidation="false"  Text="Home Page" CssClass="button" />
        <asp:Button  runat="server" OnClick="next" CausesValidation="false"  Text="Another course" CssClass="button" />
        <h2>Feedbacks of Students</h2>
        <asp:GridView ID="GridView1" runat="server"  CssClass="grid"  CellPadding="4" ForeColor="#333333" GridLines="None" onrowdatabound="GridView1_RowDataBound">
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

</body>
</html>
