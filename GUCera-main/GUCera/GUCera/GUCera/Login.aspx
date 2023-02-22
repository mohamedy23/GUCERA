<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUCera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 

    <link href="styleLogin.css" rel="stylesheet" />
</head> 
<body>
    
       <div class="loginbox"> 
           <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
           <h2>Welcome to GUCERA</h2>
           <h2>Log in here</h2>
           <form id="form1" runat="server">
               <asp:Label Text="ID" CssClass="lblid" runat="server" />
               <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                forecolor="Red" Errormessage="*" ControlToValidate="username">
                </asp:RequiredFieldValidator>

               <asp:TextBox ID="username" runat="server" TextMode="Number" CssClass="txtid" placeholder="Enter your ID" /> 
               <asp:Label  Text="Password" CssClass="lblpass" runat="server" />
                <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2" runat="server" 
                forecolor="Red" Errormessage="*" ControlToValidate="password">
                </asp:RequiredFieldValidator>
               
               <br /> 
               <asp:TextBox ID="password" TextMode="Password" MaxLength="10"  runat="server" CssClass="txtpass" placeholder="************" /><br />
               <asp:Label  ID="msg" CssClass="lbmsg" runat="server"  Font-Bold="True" />
               <asp:Button ID="signin" runat="server" Text="Login" CssClass="btnlogin" OnClick="login" /><br />
               <asp:LinkButton Text="Register" CssClass="btnregister" CausesValidation="false" runat="server" OnClick="register" />
           </form>
       </div> 
    
</body>
</html>
