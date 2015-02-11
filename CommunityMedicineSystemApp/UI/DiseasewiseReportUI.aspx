<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="DiseasewiseReportUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.DiseasewiseReportUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-3">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Select Disease</label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="diseaseDropDownList" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Date Between</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="fromDateTextBox" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">to</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="toDateTextBox" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button runat="server" ID="searchButton" Text="Show" CssClass="btn btn-primary" OnClick="searchButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div style="margin-top: 10px;">
                    <asp:GridView runat="server" ID="ReportGridview" CssClass="display" cellspacing="0" width="100%" AutoGenerateColumns="False" ClientIDMode="Static">
                        <Columns>
                            <asp:TemplateField HeaderText="District">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="district" Text='<%#Bind("DistrictName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number Of Patient">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="district" Text='<%#Bind("NumberOfPatient") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="% Over Population">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="district" Text='<%#Bind("PercentageOfTotal") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>

            </div>
        </div>
    
     <!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
  
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
  
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.js"></script>

    <script>
        $(document).ready(function () {
            $('#ReportGridview').DataTable();
        });
    </script>
        </div>
</asp:Content>
