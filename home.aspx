<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta http-equiv="refresh" content="30">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
     <form id="form1" runat="server">
     <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-money fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblTotalSale" runat="server"></asp:Label></div>
                                    <div>Today's Sale!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                   <i class="fa fa-money fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lbltotalPurchase" runat="server"></asp:Label></div>
                                    <div>Today's Purchases!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-long-arrow-left fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblTotalDebts" runat="server"></asp:Label></div>
                                    <div>Debts!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-long-arrow-right fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:label ID="lblTotalLiabilities" runat="server"></asp:label></div>
                                    <div>Liabilities!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Recent Transactions
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="panel-default">
                                <div class="panel-heading">
                                   Sales
                                </div>
                                <div class="panel-body">
                                     <asp:GridView ID="GridView1" CssClass="table table-responsive"  runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsRecentSales" ForeColor="#333333" GridLines="None">
                                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                         <Columns>
                                             <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                                             <asp:BoundField DataField="Sale value" HeaderText="Sale value" SortExpression="Sale value" />
                                             <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                         </Columns>
                                         <EditRowStyle BackColor="#999999" />
                                         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                         <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                         <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                         <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                         <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                         <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                     </asp:GridView>
                                     <asp:SqlDataSource ID="dsRecentSales" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand=" (select top 5 s.particulars as 'Customer', t.trans_amount as 'Sale value',l.location_name as 'Location'  from sales s join
transDetails t on t.trans_id = s.trans_id join location l on
l.location_id = t.location_id) order by t.trans_id desc"></asp:SqlDataSource>
                                </div>
                            </div>
                                                        <div class="panel-default">
                                <div class="panel-heading">
                                   Purchases
                                </div>
                                <div class="panel-body">
                                    <asp:GridView CssClass="table table-responsive"  ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsRecentPurchases" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="Seller" HeaderText="Seller" SortExpression="Seller" />
                                            <asp:BoundField DataField="Purchase value" HeaderText="Purchase value" SortExpression="Purchase value" />
                                            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="dsRecentPurchases" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="(select top 5 s.particulars as 'Seller', t.trans_amount as 'Purchase value',l.location_name as 'Location'  from purchase s join
transDetails t on t.trans_id = s.trans_id join location l on
l.location_id = t.location_id) order by t.trans_id desc"></asp:SqlDataSource>
                                </div>
                            </div>
                                                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <a id="chat"></a>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
                            Messages
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <asp:linkButton ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Text="Refresh"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <asp:Label ID="chatLabel" runat="server"></asp:Label>
                            </ul>
                            
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <div class="input-group">
                                <asp:TextBox runat="server" id="btn_input" type="text" cssCclass="form-control input-sm" placeholder="Type your message here..." />
                                <span class="input-group-btn">
                                    <asp:Button ID="btnChat" cssClass="btn btn-warning btn-sm" runat="server" OnClick="btnChat_Click" Text="Send"/>
                                </span>
                            </div>
                        </div>
                        <!-- /.panel-footer -->
                    </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    
                    
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
     </form>
</asp:Content>

