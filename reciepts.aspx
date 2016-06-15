<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="reciepts.aspx.cs" Inherits="reciepts" %>

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
                            <asp:GridView CssClass="table table-responsive"  ID="gvdebts" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="trans_id" DataSourceID="dsDebtors" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvdebts_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Mark Recieved" />
                                    <asp:BoundField DataField="particulars" HeaderText="particulars" SortExpression="particulars" />
                                    <asp:BoundField DataField="trans_amount" HeaderText="trans_amount" SortExpression="trans_amount" />
                                    <asp:BoundField DataField="trans_id" HeaderText="trans_id" InsertVisible="False" ReadOnly="True" SortExpression="trans_id" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    No Debts due!
                                </EmptyDataTemplate>
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
                            <asp:SqlDataSource ID="dsDebtors" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="select s.particulars,td.trans_amount,td.trans_id from transDetails td join sales s 
on
td.trans_id = s.trans_id where td.trans_type = 'sales' and s.sales_type = 'Credit'"></asp:SqlDataSource>
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

