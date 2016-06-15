<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="manageusers.aspx.cs" Inherits="manageusers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Users</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Registered Users
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="dsUnits">
                                <ItemTemplate>
                                        <ul class="list-group">
                                          <li class="list-group-item"><%#Eval("name") %> (<%#Eval("username") %>)</li>
                                        </ul>
                                </ItemTemplate>
                            </asp:ListView>                                 
                            <asp:SqlDataSource ID="dsUnits" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT username, [name] FROM [users]"></asp:SqlDataSource>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Add New User
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                        <div class="form-group">
                                            <label>Name</label>
                                            <asp:TextBox runat="server" ID="txtName" Cssclass="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>username</label>
                                            <asp:TextBox runat="server" ID="txtUseranme" Cssclass="form-control"/>
                                        </div>
                                         <div class="form-group">
                                            <label>Password</label>
                                            <asp:TextBox runat="server" ID="txtPassword" Cssclass="form-control"/>
                                        </div>
                                          <div class="form-group">
                                            <label>User Type</label>
                                            <asp:dropDownList runat="server" ID="listUserlevel" Cssclass="form-control">
                                                <asp:ListItem Value="1">Admin</asp:ListItem>
                                                <asp:ListItem Value="2">Store Manager</asp:ListItem>
                                            </asp:dropDownList>
                                        </div>
                                         <div class="form-group">
                                            <label>Location</label>
                                            
                                        </div>
                                        <asp:Button ID="btnadduser" runat="server" Cssclass="btn btn-default" Text="Register" OnClick="btnadduser_Click"/>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                                                </ContentTemplate>
                                                
                                            </asp:UpdatePanel>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    
                    
                    
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
         </form>
        </div>
</asp:Content>
