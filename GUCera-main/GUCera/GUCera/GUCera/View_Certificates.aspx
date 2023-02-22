<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Certificates.aspx.cs" Inherits="GUCera.View_Certificates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>View Your Certificates </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
    <link href="styleCertificate.css" rel="stylesheet" />
</head>
<body>
    <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" ForeColor="Black" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" ForeColor="#cc0000" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" ForeColor="#ff9900" runat="server" />



         <form id="form1" runat="server">
                
        <div  class="certificatebox" id="assginmentbox" runat="server" >

         <img id="img" src ="Stock/certificate.png"  alt="Alternate Text" class="certificate" runat="server" />
               <asp:Label   ForeColor="Black" CssClass="lblwelcome"   Text="VIEW CERTIFICATES" Font-Size="30px" runat="server" />
                <br />
                <br />
                <asp:Label Text="Course Id" CssClass="lblcid"  runat="server" />
                <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                forecolor="Red" Errormessage="*" ControlToValidate="courseID">
                </asp:RequiredFieldValidator>
                <asp:TextBox ID="courseID" TextMode="Number" placeholder="Enter the course id" runat="server" CssClass="txtcid"  />
                <asp:Label  ID="msg" ForeColor="#009933" CssClass="lblmsg" runat="server" />
                <br />
                <br/>
                <asp:Button ID="view" runat="server" Text="View" CssClass="btnview" OnClick="Button1_Click" />
                <asp:Button ID="back" runat="server" Text="Back" CssClass="btnback" OnClick="Button2_Click" CausesValidation="false" />
               
             </div>
             <div id="tobehidden2" runat="server" class="box2">
		       <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Home" CssClass="button" Width="300"  />
                <asp:Image ID="Image1" Width="750" Height="500" runat="server" />
             </div>

                    


</form>
    

</body>
</html>