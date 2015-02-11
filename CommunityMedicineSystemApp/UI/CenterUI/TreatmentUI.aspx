<%@ Page Title="" Language="C#" MasterPageFile="~/CenterSite.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="TreatmentUI.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.CenterUI.TreatmentUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" ng-app="myApp">
        <div class="row" ng-controller="myController">
            <div class="col-lg-12">
                <div style="margin-top: 10px;">
                    <div class="page-header">
                        <h1>Treatement Give</h1>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group form-inline">
                            <label for="voterIdTextBox" class="col-sm-2 control-label">Voter Id</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="voterIdTextBox" CssClass="form-control"></asp:TextBox>
                                <asp:Button runat="server" ID="showDetail" Text="Show" CssClass="btn btn-success" OnClick="showDetail_Click"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="nameTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="addressTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Age</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="ageTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="timesOfServiceLabel" class="col-sm-2 control-label">Service Given</label>
                            <div class="col-sm-10">
                                <asp:Label runat="server" ID="timesOfServiceLabel" CssClass="alert alert-info" role="alert"></asp:Label>
                                Times
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button runat="server" ID="showAllHistoryButton" Text="Show All History" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="observetionTextBox">Observation</label>
                            <asp:TextBox runat="server" ID="observetionTextBox" CssClass="form-control" Height="64px" TextMode="MultiLine" Width="209px"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">Date</label>
                            <asp:TextBox runat="server" ID="dateTextBox" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">Doctor</label>
                            <asp:DropDownList ID="doctorDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="observetionTextBox">Disease</label>
                           <asp:DropDownList runat="server" ID="diseaseDropDownList" CssClass="form-control" ng-model="diesease" ClientIDMode="Static"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">Medicine</label>
                            <asp:DropDownList ID="MedicineDropDownList" runat="server" CssClass="form-control" ng-model="medicine" ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail2">Dose</label>
                            <asp:DropDownList ID="doseDropDownList" runat="server" CssClass="form-control" ng-model="dose" ClientIDMode="Static">
                                <asp:ListItem Value="Select">Select</asp:ListItem>
                                <asp:ListItem>1+1+1+1</asp:ListItem>
                                <asp:ListItem>1+1+1</asp:ListItem>
                                <asp:ListItem>0+1+1</asp:ListItem>
                                <asp:ListItem>1+0+1</asp:ListItem>
                                <asp:ListItem>1+1+0</asp:ListItem>
                                <asp:ListItem>0+0+1</asp:ListItem>
                                <asp:ListItem>0+1+0</asp:ListItem>
                                <asp:ListItem>1+0+0</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="radio">
                            <label>
                                 <asp:RadioButtonList runat="server" ID="doseTypeRadioButton" CssClass="radio-inline" ng-model="doseType">
                                     <asp:ListItem>Before Meal</asp:ListItem>
                                     <asp:ListItem>After Meal</asp:ListItem>
                                 </asp:RadioButtonList>
                            </label>
                        </div>
                         <div class="form-group">
                            <label for="quantityGivenTextbox">Quantity Given</label>
                            <asp:TextBox runat="server" ID="quantityGivenTextbox" CssClass="form-control" ng-model="quantity"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="noteTextBox">Note</label>
                            <asp:TextBox runat="server" ID="noteTextBox" CssClass="form-control" ng-model="note"></asp:TextBox>
                        </div>
                        <button type="button" ng-click="AddRoutine(diesease,medicine,dose,doseType,quantity,note)" class="btn btn-success">Add</button>
                    </div>
                    <table class="table table-bordered" id="tbl" runat="server">
                        <thead>
                            <tr>
                                <td>Disease</td>
                                <td>Medicine</td>
                                <td>Dose</td>
                                <td>Before/After Meal</td>
                                <td>Quantity Given</td>
                                <td>Note</td>
                            </tr>
                        </thead>
                       <tbody>
                            <tr ng-repeat="aRoutine in routine">
                                <td>{{aRoutine.Name}}</td>
                                <td>{{aRoutine.Medicine}}</td>
                                <td>{{aRoutine.Dose}}</td>
                                <td>{{aRoutine.Meal}}</td>
                                <td>{{aRoutine.Quantity}}</td>
                                <td>{{aRoutine.Note}}</td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:Button runat="server" ID="saveTreatement" Text="Save" CssClass="btn btn-success" OnClick="saveTreatement_Click"/>
                </div>
            </div>
        </div>
        <input type="hidden" id="dieseaseName" runat="server" ClientIDMode="Static"/>
        <input type="hidden" id="medicineQuantity" runat="server" clientidmode="Static"/>
        <input type="hidden" id="doseTxt" runat="server" clientidmode="Static"/>
        <input type="hidden" id="mealTxt" runat="server" clientidmode="Static"/>
        <input type="hidden" id="quantityTxt" runat="server" clientidmode="Static"/>
        <input type="hidden" id="noteTxt" runat="server" clientidmode="Static"/>
        <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
        <script>
            var myApplication = angular.module("myApp", []);
            myApplication.controller("myController", function ($scope) {
                $scope.routine = [];
                $scope.AddRoutine = function (diesease, medicine, dose, doseType, quantity, note) {
                    $scope.routine.push({ Name: diesease, Medicine: medicine, Dose: dose, Meal: doseType, Quantity: quantity, Note: note });
                    document.getElementById("dieseaseName").value += diesease + ",";
                    document.getElementById("medicineQuantity").value += medicine + ",";
                    document.getElementById("doseTxt").value += dose + ",";
                    document.getElementById("mealTxt").value += doseType + ",";
                    document.getElementById("quantityTxt").value += quantity + ",";
                    document.getElementById("noteTxt").value += note + ",";
                };
            });
        </script>
    </div>
</asp:Content>
