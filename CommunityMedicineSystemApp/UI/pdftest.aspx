<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pdftest.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.pdftest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <asp:Button runat="server" ID="pdfGeerated" Text="PDF genrate" CssClass="btn btn-primary" OnClick="pdfGeerated_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
