<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="SendMedicineUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.SendMedicineUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" ng-app="myApp">
        <div class="row" ng-controller="myController">
            <div class="col-md-12">
                <div class="col-md-offset-3" style="margin-top: 10px;">
                   <div class="form-horizontal">
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
                                <asp:DropDownList runat="server" ID="thanaDropDownList" AutoPostBack="True" OnSelectedIndexChanged="thanaDropDownList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                       <div class="form-group">
                            <label for="centerNameTextBox" class="col-sm-2 control-label">Center Name:</label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="centerNameDropDownList">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group form-inline">
                            <label for="thanaDropDownList" class="col-sm-2 control-label">Medicine</label>
                            <div class="col-sm-10">
                                <asp:DropDownList runat="server" ID="medicineDropDownList" ng-model="name" ClientIDMode="Static">
                                </asp:DropDownList>
                                Quantity:<asp:TextBox runat="server" ID="quantityTextBox" CssClass="form-control" ng-model="quantity" ClientIDMode="Static"></asp:TextBox>
                                
                                <button type="button" ng-click="AddMedicine(name,quantity)" class="btn btn-success">Add</button>
                            </div>
                        </div>
                       <div class="form-group">
                            <div class="col-sm-10">
                                <table id="tbl" runat="server" class="table table-hover">
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Quantity</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="aMedicine in medicines">
                                <td>{{aMedicine.Name}}</td>
                                <td>{{aMedicine.Quantity}}</td>
                            </tr>
                        </tbody>
                    </table>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                             
                                <asp:Button runat="server" ID="sendMedicineButton" CssClass="btn btn-default" Text="Send" OnClick="sendMedicineButton_Click"/>
                                <asp:Label runat="server" ID="saveAlertlabel" CssClass="alert-success"></asp:Label>
                            </div>
                        </div>
                   </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="medicineName" runat="server" ClientIDMode="Static"/>
        <input type="hidden" id="medicineQuantity" runat="server" ClientIdMode="Static"/>
        <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
        <script>
            var myApplication = angular.module("myApp", []);
            myApplication.controller("myController", function ($scope) {
                $scope.medicines = [];
                $scope.AddMedicine = function (name, quantity) {
                    $scope.medicines.push({ Name: name, Quantity: quantity });
                    document.getElementById("medicineName").value += name + ",";
                    document.getElementById("medicineQuantity").value += quantity + ",";
                };
            });
        </script>
    </div>
</asp:Content>
