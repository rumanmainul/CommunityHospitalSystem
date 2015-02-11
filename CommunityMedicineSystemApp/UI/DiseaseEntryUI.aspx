<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiseaseEntryUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.DiseaseEntryUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class=" col-lg-offset-3" style="margin-top: 10px;">
                     <div class="form-horizontal">
                        <div class="form-group">
                            <label for="medicineNameTextBox" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="deseaseNameTextBox" CssClass="form-control" placeholder="Desease Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descriptionTextBox" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="descriptionTextBox" CssClass="form-control" placeholder="Description"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="treatmentProcedureTextBox" class="col-sm-2 control-label">Treatment Procedure</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="treatmentProcedureTextBox" CssClass="form-control" placeholder="Treatment Procedure" Rows="3"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="preparedDrugTextBox" class="col-sm-2 control-label">Prepared Drug</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="preparedDrugTextBox" CssClass="form-control" placeholder="Prepared Drug"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button runat="server" ID="deseaseSaveBuntton" CssClass="btn btn-default" Text="Save" OnClick="deseaseSaveBuntton_Click" />
                                <asp:Label runat="server" ID="saveAlertlabel" CssClass="alert-success"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
