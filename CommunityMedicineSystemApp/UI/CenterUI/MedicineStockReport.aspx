<%@ Page Title="" Language="C#" MasterPageFile="~/CenterSite.Master" AutoEventWireup="true" CodeBehind="MedicineStockReport.aspx.cs" Inherits="CommunityMedicineApp.WebUI.MedicineStockReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div style="margin-top: 20px;">
                    <asp:GridView ID="showMedicineGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Medicine Name">
                <ItemTemplate>                    
                    <asp:Label ID="medicineNameTextBox" runat="server" Text='<%# Eval("MedicineName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Present Stock">
                <ItemTemplate>
                    <asp:Label ID="presentStockTextBox" runat="server" Text='<%# Eval("PresentStock") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
