<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CenterCreateSuccessUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.CenterCreateSuccessUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-3" style="margin-top: 20px;">
                     <asp:Label runat="server" ID="successAlertLabel" CssClass="alert alert-success" role="alert"></asp:Label>
                </div>
               
            </div>
        </div>
    </div>
</asp:Content>
