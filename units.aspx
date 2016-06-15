<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="units.aspx.cs" Inherits="units" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Units</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Units already added
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="dsUnits">
                                <ItemTemplate>
                                        <ul class="list-group">
                                          <li class="list-group-item"><%#Eval("unit_name") %></li>
                                        </ul>
                                </ItemTemplate>
                            </asp:ListView>                                 
                            <asp:SqlDataSource ID="dsUnits" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [unit_name] FROM [units]"></asp:SqlDataSource>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Add New
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                                    <div class="form-group">
                                            <label>Unit Symbol</label>
                                            <asp:TextBox runat="server" ID="newUnitname" Cssclass="form-control"/>
                                        </div>
                                        <asp:Button ID="unitAdd" runat="server" Cssclass="btn btn-default" OnClick="unitAdd_Click" Text="Save"/>
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

