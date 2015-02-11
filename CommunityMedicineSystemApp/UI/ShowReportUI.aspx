<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowReportUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.ShowReportUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="" class="col-sm-3">Voter Id</label>
                        <asp:TextBox runat="server" ID="voterIdTextBox" CssClass="form-control"></asp:TextBox>
                        <asp:Button runat="server" ID="searchButton" Text="Search" CssClass="btn btn-primary" OnClick="searchButton_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
