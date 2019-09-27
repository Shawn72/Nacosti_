<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Nacosti_.Profile" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
   <% var odataconn = WsConfig.ReturnNavObj(); %>
    <div class="content container-fluid">

    
        <div class="panel panel-default" style="margin-top:10px;" >
            <div class="row">  
            <div class="col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel-heading">Profile Details</div>
            <div class="panel-body">
            <div runat="server" id="feedback"></div>  

            <div id="user-profile-2" class="user-profile">
		    <div class="tabbable">
			    <ul class="nav nav-tabs padding-18">
				    <li class="active">
					    <a data-toggle="tab" href="#home">
						    <i class="green ace-icon fa fa-user bigger-120"></i>
						    Profile
					    </a>
				    </li>

				    <li>
					    <a data-toggle="tab" href="#passwordmanage">
						    <i class="orange ace-icon fa fa-lock bigger-120"></i>
						    Change Password
					    </a>
				    </li>
				   
			    </ul>

                    <%
                        var alldetails = odataconn.Vendors.Where(r => r.No == (string)Session["directorNo"]);
                        foreach (var detail in alldetails)
                        {
                     %>

			        <div class="tab-content no-border padding-24">
				        <div id="home" class="tab-pane in active">
					        <div class="row">
						        <div class="col-xs-12 col-sm-3 center">
							        <span class="profile-picture">
                                        <%-- <%
                                            WsConfig.ObjNav.GetItemImage((string) Session["directorNo"]);
                                          %>
                                         <img src="images/<%= (string) Session["directorNo"] + ".PNG" %>" class="editable img-responsive" alt=" Avatar" id="avatar2"/>--%>

								        <img class="editable img-responsive" alt=" Avatar" id="avatar2" src="http://bootdey.com/img/Content/avatar/avatar6.png">
							        </span>

							        <div class="space space-4"></div>

							        <a href="#" class="btn btn-sm btn-block btn-success">
								        <i class="ace-icon fa fa-plus-circle bigger-120"></i>
								        <span class="bigger-110">Change Photo</span>
							        </a>
							       
						        </div><!-- /.col -->

						        <div class="col-xs-12 col-sm-9">
							        <h4 class="blue">
								        <span class="middle"><%=detail.Name %></span>

								        <span class="label label-purple arrowed-in-right">
									        <i class="ace-icon fa fa-circle smaller-80 align-middle"></i>
									        online
								        </span>
							        </h4>

							        <div class="profile-user-info">
								        <div class="profile-info-row">
									        <div class="profile-info-name"> Director Number </div>

									        <div class="profile-info-value">
										        <span><%=detail.No %></span>
									        </div>
								        </div>

                                         <div class="profile-info-row">
									        <div class="profile-info-name"> Email Address </div>

									        <div class="profile-info-value">
										        <span><%=detail.E_Mail %></span>
									        </div>
								        </div>

								        <div class="profile-info-row">
									        <div class="profile-info-name"> Address </div>

									        <div class="profile-info-value">
										        <i class="fa fa-map-marker light-orange bigger-110"></i>
										        <span><%=detail.Address_2 %></span>
									        </div>
								        </div>
								        

								        <div class="profile-info-row">
									        <div class="profile-info-name"> Last Online </div>

									        <div class="profile-info-value">
										        <span><%=DateTime.Now.ToLongTimeString() %></span>
									        </div>
								        </div>
							        </div>

							        <div class="hr hr-8 dotted"></div>

							        <div class="profile-user-info">
								       <%-- <div class="profile-info-row">
									        <div class="profile-info-name"> Website </div>

									        <div class="profile-info-value">
										        <a href="#" target="_blank">www.alexdoe.com</a>
									        </div>
								        </div>--%>


								       
							        </div>
						        </div><!-- /.col -->
					        </div><!-- /.row -->

					        <div class="space-20"></div>
					        
				        </div><!-- /#home -->

				        <div id="passwordmanage" class="tab-pane">
					        <div class="profile-feed row">
						        <div class="col-sm-6">
							        <div class="profile-activity clearfix">
                                          <div class="lead">
                                              <label>Current Password:</label>
                                                <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                                                          <%--<asp:Textbox runat="server" ID="txtPassword" placeholder="Current Password" CssClass="form-control" type="password" required="required"/>--%>
                                                    
                                                    <input  data-toggle="password"  id="oldpassword"  class="form-control"  type="password"  maxlength="12"  placeholder="Enter the password" runat="server"/>    
                                                    <span class="input-group-btn">
                                                        <button id= "show_password0" class="btn btn-secondary" type="button" onclick="myTest()">
                                                            <span class="glyphicon glyphicon-eye-open" id="gly1"></span>
                                                        </button>
                                                    </span>
                                                </div>
                  
                                          </div>
                                          <div class="lead">
                                              <label>New Password:</label>
                                                <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                                                         <%-- <asp:Textbox runat="server" ID="newPassord" placeholder="New Password" CssClass="form-control" type="password" required="required"/>
                                                     --%>
                                                    <input  data-toggle="password"  id="newpassword"  class="form-control"  type="password"  maxlength="12"  placeholder="Enter the password" runat="server"/>    
                                                    <span class="input-group-btn">
                                                        <button id= "show_password1" class="btn btn-secondary" type="button">
                                                            <span class="glyphicon glyphicon-eye-open"></span>
                                                        </button>
                                                    </span>
                                                </div>
                  
                                          </div>
                                          <div class="lead">
                                              <label>Confirm Password:</label>
                                                <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                                                         
                                                    <%-- <asp:Textbox runat="server" ID="confirmPassword" placeholder="Confirm Password" CssClass="form-control" type="password" required="required"/>--%>
                                                        
                                                    <input  data-toggle="password"  id="confirmnewpassword"  class="form-control"  type="password"  maxlength="12"  placeholder="Enter the password" runat="server"/>    
                                                 
                                                    <span class="input-group-btn">
                                                            <button id= "show_password3" class="btn btn-secondary" type="button">
                                                                <span class="glyphicon glyphicon-eye-open"></span>
                                                            </button>
                                                        </span>
                                                        
                                                </div>
                  
                                          </div>
                                          <div class="lead">
                                              <p></p>
                                             <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
                                                  <ContentTemplate>--%>

                                                    <asp:Button runat="server" ID="btnResetPasss" CssClass="btn btn-block btn-success" Text="Reset Password" OnClick="btnResetPasss_OnClick"  />
                                          
                                             <%-- </ContentTemplate>
                                              <Triggers>
                                                 <asp:AsyncPostBackTrigger ControlID = "btnResetPasss" EventName = "Click"/>
                                              </Triggers>
                                              </asp:UpdatePanel>--%>
                                          </div>							       

								     
							        </div>
						        </div>
						     
					        </div>

					        <div class="space-12"></div>
					       
				        </div><!-- /#passwordchange -->
			        </div>

                    <%} %>
		            </div>
	            </div>           
             </div>
            </div>
          </div>
         </div>
        </div>
    </div>
</div>
<script>

    function myTest() {
        var element = document.querySelector("password").value;

        //var el = document.querySelector("gly1");
        //        el.classList.remove("glyphicon-eye-open");
        //        // If my-class is set remove it, otherwise add it
        //        el.classList.toggle("glyphicon-eye-close");
        //document.querySelector("password").setAttribute('type', 'text');

      alert("clicked" + element);
    }

    function ConfirmPasswordChange() {
        var confirmValue = document.createElement("INPUT");
        confirmValue.type = "hidden";
        confirmValue.name = "confirm_value";
        if (confirm("Change Password?")) {
            confirmValue.value = "Yes";
        } else {
            confirmValue.value = "No";
        }
        document.forms[0].appendChild(confirmValue);
    }

    function passwordChangeMsg() {
        swal({
                title: "Are you sure?",
                text: "Your password will be changed!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, change it!",
                cancelButtonText: "No, cancel!",
                closeOnConfirm: false,
                closeOnCancel: false
            }
            
        ).then(function (isConfirm) {
                var confirmValue = document.createElement("INPUT");
                confirmValue.type = "hidden";
                confirmValue.name = "confirm_value";

                if (isConfirm) {
                     confirmValue.value = "Yes";
                    // swal("Password changed!", "Your password will be changed." + confirmValue.value, "success");
                } else {
                    confirmValue.value = "No";
                  //  swal("Cancelled", "You Cancelled the operation:" + confirmValue.value, "error");
                }
                document.forms[0].appendChild(confirmValue);
            }
        );
    }

    function passwordChangefailed() {
        document.getElementById("feedback").innerHTML = "<div class='alert alert-danger'>Password could not be changed, try again with right parameters <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //text = "This is working";
        if (window.swal) {
            swal("Password change failed", "Password could not be changed", "error");
        }
    }

    function passChangesuccessAlert() {
        swal({
            title: 'Password changed!',
            text: 'Your password changed successfully',
            type: 'success'
        });
    }

    function popSweetAlert(statusText) {
        var msgArray = statusText.split("*");
        var title = msgArray[1];
        var text1 = msgArray[2];
        var category = msgArray[0];
        var alertType = "danger";

        switch (category) {
            case "success":
                var alertType = "success";
                break;
            case "danger":
                var alertType = "danger";
                break;
        }

        if (category == "success") {
            alertType = "success";
        }
        document.getElementById("feedback").innerHTML = "<div class='alert alert-" +
            alertType +
            "'>" +
            text1 +
            " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //text = "This is working";
        if (window.swal) {
            swal(title, text1, category);
        } else {
            alert(text1);
        }
    }
</script>

 
</asp:Content>
