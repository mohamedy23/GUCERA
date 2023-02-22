<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GUCera.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Register </title>
     <link rel = "icon" href = "Stock/GUCERA.png" type = "image/x-icon"> 
    <link href="styleRegister.css" rel="stylesheet" />

</head>
<body>
     <div class="registerbox"> 
           <img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
           
           <form id="form1" runat="server">

          
               
            <asp:Label ID="Label1" runat="server" CssClass="lblfname" Text="First name" />
               <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator1" runat="server" 
            forecolor="Red" Errormessage="*" ControlToValidate="fname">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="fname" runat="server" MaxLength="10" placeholder="Enter your first name" CssClass="txtfname" ValidationGroup="Name Required " />
            <asp:Label ID="Label7" runat="server" CssClass="lbllname" Text="Last name" />
                <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
            forecolor="Red" ControlToValidate="lname">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="lname" runat="server" MaxLength="10" placeholder="Enter your last name" CssClass="txtlname"/>
            <asp:Label ID="Label2" runat="server" CssClass="lblpass" Text="Password" />
                <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            forecolor="Red" ControlToValidate="regPassword">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="regPassword" runat="server" MaxLength="10" placeholder="Choose your password" Cssclass="txtpass" TextMode="Password"/>
            <asp:Label ID="Label4" runat="server" CssClass="lblmail" Text="Email"/>
               <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
            forecolor="Red" ControlToValidate="mail">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="mail" runat="server" MaxLength="10" placeholder="Enter your Email" CssClass="txtmail" TextMode="Email" />
            <asp:Label ID="Label6" runat="server" CssClass="lblgender" Text="Gender"/>
            <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
            forecolor="Red" InitialValue="-1" ControlToValidate="ddlGender">
        </asp:RequiredFieldValidator>
               <br />
               <br />
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="ddlgender">
            <asp:ListItem Text="Select Your Gender" Value="-1"> </asp:ListItem>
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>

            </asp:DropDownList>


            <asp:Label ID="Label5" runat="server" CssClass="lbladdress" Text="Address"/>
                <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
            forecolor="Red" ControlToValidate="regaddress">
        </asp:RequiredFieldValidator>
            <asp:TextBox ID="Regaddress" runat="server" MaxLength="10" placeholder="Enter your address" CssClass="txtaddress"/>

            <asp:Label ID="Label3" runat="server" CssClass="lblentity" Text="You are a"/><asp:RequiredFieldValidator 
          ID="RequiredFieldValidator7" ErrorMessage="*" runat="server" forecolor="Red" InitialValue="-1" ControlToValidate="ddlInstructorStudent">
        </asp:RequiredFieldValidator>
            

               <br />
               <br />
            <asp:DropDownList ID="ddlInstructorStudent" CssClass="ddlis" runat="server" placeholder="select" OnSelectedIndexChanged="ddlInstructorStudent_SelectedIndexChanged">
            <asp:ListItem Text="Select your entity" Value="-1"  /> 
            <asp:ListItem Text="Student" Value="Student" /> 
            <asp:ListItem Text="Instructor" Value="Instructor" /> 
            </asp:DropDownList>
            <asp:Label  ID="msg" CssClass="lbmsg" runat="server"  Font-Bold="True" />
            
            <asp:Button ID="registerButton" runat="server" CssClass="btnregister" Text="Register" OnClick="registerButton_Click" />
            
        


           </form>
       </div> 
</body>
</html>
