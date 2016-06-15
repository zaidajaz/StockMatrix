<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="sales.aspx.cs" Inherits="sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function reCalc() {
            var qty = document.getElementById('pageWrapper_txtsaleQty');
            var rate = document.getElementById('pageWrapper_txtsaleRate');
            var amt = document.getElementById('pageWrapper_txtsaleAmount');
            var vatp = document.getElementById('pageWrapper_txtsaleVatpercent');
            var vatamt = document.getElementById('pageWrapper_txtsaleVatamount');
            var extra = document.getElementById('pageWrapper_txtsaleExtra');
            var discount = document.getElementById('pageWrapper_txtsaleDiscount');
            var total = document.getElementById('pageWrapper_txtsaleTotal');


            if (qty.value != '' && rate.value != '') {
                amt.value = rate.value * qty.value;
            }
            if (amt.value != '' && vatp.value != '') {
                vatamt.value = 0.01 * vatp.value * amt.value;
            }
            if (amt.value != '' && vatamt.value != '' && extra.value != '' && discount.value != '') {
                total.value = parseFloat(amt.value) + parseFloat(vatamt.value) + parseFloat(extra.value) - parseFloat(discount.value);
            }
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageWrapper" Runat="Server">
    <div id="page-wrapper">
       <form id="Form1" role="form" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sales Voucher</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Add item to bill
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                                    <div class="form-group">
                                            <label>Item Group</label>
                                            <asp:dropDownList runat="server" ID="lstItemGroup" Cssclass="form-control" DataSourceID="dsItemGroup" DataTextField="group_name" DataValueField="group_id" AutoPostBack="true"/>
                                                        <asp:SqlDataSource ID="dsItemGroup" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [group_id], [group_name] FROM [stock_group]"></asp:SqlDataSource>
                                        </div>
                                         <div class="form-group">
                                            <label>Item Name</label>
                                            <asp:dropDownList runat="server" ID="lstItemName" Cssclass="form-control" DataSourceID="dsItemName" DataTextField="item_name" DataValueField="stock_id"/>
                                                        <asp:SqlDataSource ID="dsItemName" runat="server" ConnectionString="<%$ ConnectionStrings:conSM %>" SelectCommand="SELECT [stock_id], [item_name] FROM [stock] where group_id = @grid">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="lstItemGroup" DefaultValue="1" Name="grid" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                             </asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <asp:TextBox id="txtsaleQty" runat="server" CssClass="form-control" onchange="reCalc();" pattern="[0-9.]"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Rate</label>
                                            <asp:TextBox id="txtsaleRate" runat="server" CssClass="form-control" onchange="reCalc();"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Amount</label>
                                            <asp:TextBox id="txtsaleAmount" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>VAT(%)</label>
                                            <asp:TextBox id="txtsaleVatpercent" runat="server" CssClass="form-control" onchange="reCalc();"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>VAT amount</label>
                                            <asp:TextBox id="txtsaleVatamount" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Extra Charges</label>
                                            <asp:TextBox id="txtsaleExtra" runat="server" CssClass="form-control" Text="0" onchange="reCalc();"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Discount</label>
                                            <asp:TextBox id="txtsaleDiscount" runat="server" CssClass="form-control" Text="0" onchange="reCalc();"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Total</label>
                                            <asp:TextBox id="txtsaleTotal" runat="server" CssClass="form-control" onchange="reCalc();" Enabled="false"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnAnotherItem" runat="server" CssClass="btn btn-default" OnClick="btnAnotherItem_Click" Text="Add Item" />
                                        <asp:Button ID="btnShowBill" runat="server" Cssclass="btn btn-default"  Text="Show bill" PostBackUrl="salesvoucher.aspx"/>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                                    <asp:Label ID="msgLabel" runat="server"></asp:Label>
                                                </ContentTemplate>
                                                
                                            </asp:UpdatePanel>

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

