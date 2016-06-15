<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="transfer.aspx.cs" Inherits="transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Stock Transfer</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search by item
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                                    <div class="form-group">
                                            <label>Item Group</label>
                                             <asp:DropDownList runat="server" ID="itemGroup" CssClass="form-control" DataSourceID="dsItemGroup" DataTextField="group_name" DataValueField="group_id" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="dsItemGroup" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="select * from stock_group"></asp:SqlDataSource>
                                                        </div>
                                        <div class="form-group">
                                            <label>Item Name</label>
                                             <asp:DropDownList runat="server" ID="itemName" CssClass="form-control" DataSourceID="dsItemName" DataTextField="item_name" DataValueField="stock_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="dsItemName" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="select stock_id,item_name from stock where group_id = @grID">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="itemGroup" DefaultValue="1" Name="grID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">
                                            <label>Transfer From</label>
                                             <asp:DropDownList runat="server" ID="listFrom" CssClass="form-control" DataSourceID="dsLocation" DataTextField="location_name" DataValueField="location_id"></asp:DropDownList>
                                            <asp:SqlDataSource ID="dsLocation" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="select location_id, location_name from location ">
                                            </asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">
                                            <label>Transfer to
                                            </label>
                                             <asp:DropDownList runat="server" ID="listTo" CssClass="form-control" DataSourceID="dsLocation" DataTextField="location_name" DataValueField="location_id"></asp:DropDownList>
                                        </div>
                                        <div class="form_group">
                                            <lablel>Quantity</lablel>
                                            <asp:TextBox ID="txtTransferQty" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                           <div class="form-group">
                                               <br />
                                                <asp:Button ID="btnTransferStock" OnClick="btnTransferStock_Click"  runat="server" Cssclass="btn btn-default" Text="Transfer"/>
                                           </div>
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
