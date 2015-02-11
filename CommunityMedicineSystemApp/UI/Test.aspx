<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CommunityMedicineSystemApp.UI.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div ng-app="" ng-controller="personController">
                First Name:
                <asp:TextBox runat="server" ID="firstName" ng-model="firstName" ClientIDMode="Static"></asp:TextBox>
                Last Name:
                <asp:TextBox runat="server" ID="lastName" ng-model="lastName" ClientIDMode="Static"></asp:TextBox>
                <br>
                Full Name: {{fullName()}}
            </div>
        </div>
        <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
        <script>
            function personController($scope) {
                $scope.firstName = "John",
                $scope.lastName = "Doe",
                $scope.fullName = function () {
                    return $scope.firstName + " " + $scope.lastName;
                }
            }
        </script>
    </div>

</asp:Content>
