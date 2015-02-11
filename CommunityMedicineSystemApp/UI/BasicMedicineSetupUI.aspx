<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicMedicineSetupUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.BasicMedicineSetupUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-3" style="margin-top: 10px;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="medicineNameTextBox" class="col-sm-2 control-label">Genric Name:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="medicineNameTextBox" CssClass="form-control" placeholder="Gineric Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group form-inline">
                            <label for="inputPassword3" class="col-sm-2 control-label">Power(MG/ML)</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="powerMgMlTextBox" CssClass="form-control" placeholder="Gineric Name"></asp:TextBox>&nbsp;
        <asp:DropDownList runat="server" ID="mgMLDropdownList">
            <asp:ListItem>MG</asp:ListItem>
            <asp:ListItem>ML</asp:ListItem>
        </asp:DropDownList>MG/ML
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button runat="server" ID="medicineSaveBuntton" CssClass="btn btn-default" Text="Save" OnClick="medicineSaveBuntton_Click" />
                                <asp:Label runat="server" ID="saveAlertlabel" CssClass="alert-success"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
