<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewCenterUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.AddNewCenterUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-3" style="margin-top: 10px;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="centerNameTextBox" class="col-sm-2 control-label">Center Name:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="centerNameTextBox" CssClass="form-control" placeholder="Center Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="districtDropdownList" class="col-sm-2 control-label">District</label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="districtDropdownList" AutoPostBack="True" OnSelectedIndexChanged="districtDropdownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="thanaDropDownList" class="col-sm-2 control-label">Thana</label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="thanaDropDownList">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button runat="server" ID="createCentertBuntton" CssClass="btn btn-default" Text="Save" OnClick="createCentertBuntton_Click"/>
                                <asp:Label runat="server" ID="saveAlertlabel" CssClass="alert-success"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
