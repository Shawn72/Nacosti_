<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Nacosti_.Login" %>

<!DOCTYPE html>

<html lang="en-US">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0"/>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <title>Login - NACOSTI</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet"   type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	
</head>
 <body>
 <form id="loginForm" runat="server">
        <div class="main-wrapper">
			<div class="account-page">
				<div class="container">
					<h3 class="account-title">NACOSTI E-BOARD LOGIN</h3>
					<div class="account-box">
						<div class="account-wrapper">
							<div class="account-logo">
								<a href="Login.aspx"><img src="assets/img/logo.png" alt="nacosti logo"></a>
							</div>
                            <div id="feedback" runat="server"></div>
							
								<div class="form-group form-focus">
									<label class="control-label">Director Number</label>
								    <input class="form-control floating" type="text" runat="server" id="txtUsername"/>
								</div>
								<div class="form-group form-focus">
									<label class="control-label">Password</label>
								    <input class="form-control floating" type="password" id="txtPassword" runat="server"/>
								</div>
								<div class="form-group text-center">
								    <span  class="btn btn-primary btn-block account-btn">
								          <i class="fas fa-sign-in-alt"></i>&nbsp;<asp:Button runat="server"  ID="btnLogin" style="background-color: #01af58; border: none" Text="Login" OnClick="btnLogin_OnClick"></asp:Button>
								    </span>
								</div>
								<div class="text-center">
									<a href="ResetPassword.aspx">Forgot your password?</a>
								</div>
						    <div class="text-center">
						        <p><% =DateTime.Now.Year%> -Powered By&nbsp;<a href="http://www.dynasoft.co.ke/" target="_blank">Dynasoft Business Solutions</a></p>
						    </div>
							
						</div>
					</div>
				</div>
			</div>
        </div>

	    <div class="sidebar-overlay" data-reff="#sidebar"></div>
        <script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/app.js"></script>
     </form>
    </body>
</html>
