<%@ Page Title="" Language="C#" MasterPageFile="~/CenterSite.Master" AutoEventWireup="true" CodeBehind="DoctorEntryUI.aspx.cs" Inherits="CommunityMedicineApp.WebUI.DoctorEntryUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-3" style="margin-top: 10px;">
                    <div class="form-horizontal">
  <div class="form-group">
      <label for="nameTextBox" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
        <asp:TextBox runat="server" ID="nameTextBox" CssClass="form-control" placeholder="Centre Name"></asp:TextBox>
    </div>
  </div>
  <div class="form-group">
      <label for="degreeTextBox" class="col-sm-2 control-label">Degree</label>
    <div class="col-sm-10">
        <asp:TextBox runat="server" ID="degreeTextBox" CssClass="form-control" placeholder="Centre Name"></asp:TextBox>
    </div>
  </div>
  
                        <div class="form-group">
      <label for="specificationTextBox" class="col-sm-2 control-label">Specialization</label>
    <div class="col-sm-10">
        <asp:TextBox runat="server" ID="specificationTextBox" CssClass="form-control" placeholder="Centre Name"></asp:TextBox>
    </div>
  </div>
                   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <asp:Button runat="server" ID="saveBuntton" CssClass="btn btn-default" Text="Save" OnClick="saveButton_Click"/>
        <asp:Label runat="server" ID="noticeLabel" CssClass="alert-success"></asp:Label>
    </div>
  </div>
     </div>
            </div>
        </div>
    </div>
 
</asp:Content>
