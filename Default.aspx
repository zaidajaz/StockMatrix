<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>StockMatrix v1.0</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="includes/styles/layout.css" />
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <img src="includes/images/logo.png" />
                    <div class="panel panel-default">
                                           <div class="panel-heading">
                        <h3 class="panel-title">Sign in</h3>
                   </div>
                      <div class="panel-body">
                        <form id="Form1" runat="server">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                            <asp:Button ID="loginButton" runat="server" CssClass="btn btn-success form-control" Text="Login" OnClick="loginButton_Click" />
                            <asp:Label ID="status_msg" runat="server"></asp:Label>
                        </form>
                      </div>
                    </div>
            </div>
            <div class="col-sm-4">
            </div>
        </div>
    </div>
    <div id="row">
        <div class="col-sm-12">
            <div id="footer">
                <h2>Copyright &copy; 2015. All rights reserved!</h2>
            </div>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

