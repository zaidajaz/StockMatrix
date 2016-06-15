<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="salesvoucher.aspx.cs" Inherits="salesvoucher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
<div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sales Voucher</h1>
                    <div class="form-group">
                        <label>Particulars</label>
                        <asp:TextBox ID="txtparticulars" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Sales Type</label>
                        <asp:dropDownList ID="listSalestype" runat="server" CssClass="form-control">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Credit</asp:ListItem>
                        </asp:dropDownList>
                        </div>
                    <div class="form-group">
                        <label>Sales Location</label>
                        <asp:DropDownList CssClass="form-control" ID="listSaleslocation" runat="server" DataSourceID="dsSalesLocation" DataTextField="location_name" DataValueField="location_id"></asp:DropDownList>
                        <asp:SqlDataSource ID="dsSalesLocation" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [location_id], [location_name] FROM [location]"></asp:SqlDataSource>
                        <asp:Button runat="server" ID="btnsaveSales" OnClick="btnsaveSales_Click" text="SAVE" CssClass="btn btn-default"/>
                    </div>
                        
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <asp:GridView OnDataBound="GridView1_DataBound" CssClass="table table-responsive" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsSalesVoucher" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ITEM" HeaderText="ITEM" SortExpression="ITEM" />
                            <asp:BoundField DataField="qty" HeaderText="QUANTITY" SortExpression="qty" />
                            <asp:BoundField DataField="amount" HeaderText="AMOUNT" SortExpression="amount" />
                            <asp:BoundField DataField="rate" HeaderText="RATE" SortExpression="rate" />
                            <asp:BoundField DataField="vatp" HeaderText="VAT(%)" SortExpression="vatp" />
                            <asp:BoundField DataField="vatamt" HeaderText="VAT AMT" SortExpression="vatamt" />
                            <asp:BoundField DataField="extra" HeaderText="EXTRA" SortExpression="extra" />
                            <asp:BoundField DataField="discount" HeaderText="DISCOUNT" SortExpression="discount" />
                            <asp:BoundField DataField="total" HeaderText="TOTAL" SortExpression="total" />
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
                    <asp:SqlDataSource ID="dsSalesVoucher" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT s.item_name AS ITEM, ts.qty, ts.amount, ts.rate, ts.vatp, ts.vatamt, ts.extra, ts.discount, ts.total FROM tempSales AS ts INNER JOIN stock AS s ON ts.stock_id = s.stock_id"></asp:SqlDataSource>
               
                 <label class="h2">Grand Total: </label><asp:Label CssClass="h3" ID="lblgrandTotal" runat="server"></asp:Label> 
                  </div>
            </div>
            <!-- /.row -->
         </form>
        </div>
</asp:Content>

