<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="GUCera.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
  .lblgucera1, .lblgucera2, .lblgucera3 {
	width: 75px;
	height: 32px;
	overflow: hidden;
	left: 75px;
	position: relative;
	font-size: 75px;
	font-family: Bahnschrift;
	font-weight: bold;
	font-kerning: auto;
	font-display: auto;
	font-style: italic;
}
.lblgucera1{
	color:#000000;
}
.lblgucera2 {
	color:#ed1c24;
}
.lblgucera3 {
	color: #ffcb08;
}

	.box {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		width: 350px;
		height: 550px;
		padding: 80px 40px;
		box-sizing: border-box;
		background: rgba(0,0,0,0.5);
	}
.box2 {
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate(-50%,-50%);

	padding: 80px 40px;
	box-sizing: border-box;

}


.user {
	width: 75px;
	height: 75px;
	overflow: hidden;
	top: 0;
	left: 0px;
	position: absolute;
}
    </style>
    
    <title></title>
</head>
<body>
		<img src="Stock/GUCERA.png"  alt="Alternate Text" class="user" />
        <asp:Label Text="GU" CssClass="lblgucera1" runat="server" />
        <asp:Label Text="CE" CssClass="lblgucera2" runat="server" />
        <asp:Label Text="RA" CssClass="lblgucera3" runat="server" />
    <form id="form1" runat="server">
        <div>
        <h1 style="color:aqua">hello</h1></div>
        <asp:Image ID="Image1" runat="server" Width="291px" />
	
    </form>
	
</body>
</html>
