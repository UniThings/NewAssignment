<%@ Page Title="Class schedules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="GunDogs.MemberPages.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="ClassesDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        onselecting="SqlDataSource1_Selecting" 
        
        
        SelectCommand="SELECT TrainingClass.className, TrainingClass.classType, TrainingClass.startTime, TrainingClass.endTime, People.Name + ' (MemID: ' + CAST(People.memberID AS VARCHAR) + ')' AS fulldetails FROM TrainingClass INNER JOIN People ON People.memberID = TrainingClass.memID"></asp:SqlDataSource>
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ClassesDS">
        <Columns>
            <asp:BoundField DataField="className" HeaderText="className" 
                SortExpression="className" />
            <asp:BoundField DataField="classType" HeaderText="classType" 
                SortExpression="classType" />
            <asp:BoundField DataField="startTime" HeaderText="startTime" 
                SortExpression="startTime" />
            <asp:BoundField DataField="endTime" HeaderText="endTime" 
                SortExpression="endTime" />
            <asp:BoundField DataField="fulldetails" HeaderText="Full Name" 
                SortExpression="Name" />
        </Columns>
    </asp:GridView>
    </asp:Content>
