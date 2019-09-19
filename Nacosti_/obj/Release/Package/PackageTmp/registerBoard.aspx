<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerBoard.aspx.cs" Inherits="Nacosti_.registerBoard" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <title>Register - NACOSTI</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <form id="registerForm" runat="server">
        <div class="main-wrapper">
			<div class="account-page">
				<div class="container">
					<h3 class="account-title">E-Board Registration</h3>
					<div class="account-box">
						<div class="account-wrapper">
							<div class="account-logo">
								<a href="Login.aspx"><img src="assets/img/logo.png" alt="nacosti logo"></a>
							</div>
							
								<div class="form-group form-focus">
									<label class="control-label">ID Number</label>
								    <input class="form-control floating" type="text" runat="server"/>
								</div>
								<div class="form-group form-focus">
									<label class="control-label">Email</label>
								    <input class="form-control floating" type="text" runat="server"/>
								</div>
								<div class="form-group text-center">
									<asp:Button class="btn btn-primary btn-block account-btn" type="submit" runat="server" Text="Create Account"></asp:Button>
								</div>
								<div class="text-center">
									<a href="Login.aspx">Already have an account?</a>
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
