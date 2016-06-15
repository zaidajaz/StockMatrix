<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="newItem.aspx.cs" Inherits="newItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ContentPlaceHolderID="pageWrapper" runat="server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">New Item Creation</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Add new Stock group
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                                    <div class="form-group">
                                            <label>Group Name</label>
                                            <asp:TextBox runat="server" ID="newGroupName" Cssclass="form-control"/>
                                        </div>
                                        <asp:Button ID="btnAddnewGroup" runat="server" OnClick="btnAddnewGroup_Click" Cssclass="btn btn-default"  Text="Add"/>
                                                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                                                </ContentTemplate>
                                                
                                            </asp:UpdatePanel>
                                    
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Add New Stock Item
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    
                                        <div class="form-group">
                                            <label>Stock Group</label>
                                            <asp:DropDownList runat="server" ID="listGroup" Cssclass="form-control" DataSourceID="dsStockGroup" DataTextField="group_name" DataValueField="group_id"/>
                                            <asp:SqlDataSource ID="dsStockGroup" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [group_name], [group_id] FROM [stock_group]"></asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">
                                            <label>Item Name</label>
                                            <asp:TextBox runat="server" ID="txtItemName" Cssclass="form-control"/>
                                        </div>
                                         <div class="form-group">
                                            <label>Measured In (units)</label>
                                            <asp:DropDownList runat="server" ID="listUnits" Cssclass="form-control" DataSourceID="dsStockUnits" DataTextField="unit_name" DataValueField="unit_id"/>
                                             <asp:SqlDataSource ID="dsStockUnits" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [unit_id], [unit_name] FROM [units]"></asp:SqlDataSource>
                                        </div>
                                        <asp:Button ID="btnAddNewItem" OnClick="btnAddNewItem_Click" runat="server" Cssclass="btn btn-default"  Text="Add"/>
                                                    <asp:Label ID="msgLabel2" runat="server"></asp:Label>
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

