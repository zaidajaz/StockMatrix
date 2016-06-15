<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="daybook.aspx.cs" Inherits="daybook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Daybook</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Transactions for the day
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
           
                            <asp:GridView cssClass="table table-responsive"  ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsDaybook" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                    <asp:BoundField DataField="Transaction Type" HeaderText="Transaction Type" SortExpression="Transaction Type" />
                                    <asp:BoundField DataField="Loocation" HeaderText="Loocation" SortExpression="Loocation" />
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
                                    
                                 
                            <asp:SqlDataSource ID="dsDaybook" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="select s.item_name as 'Item', ti.qty as 'Quantity' , td.trans_type as 'Transaction Type', l.location_name as 'Loocation' from transitems ti join stock s on ti.stock_id = s.stock_id join 
transDetails td on td.transitemsID = ti.transitemsID join location l
on td.location_id = l.location_id where Convert(date,trans_date) = CONVERT(date,getdate())"></asp:SqlDataSource>
                                    
                                 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
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

