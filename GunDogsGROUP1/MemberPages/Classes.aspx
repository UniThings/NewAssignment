<%@ Page Title="Class schedules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="GunDogs.MemberPages.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="ClassesDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        onselecting="SqlDataSource1_Selecting" 
        SelectCommand="SELECT * FROM [TrainingClass]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="classID" DataSourceID="ClassesDS">
        <Columns>
            <asp:BoundField DataField="classID" HeaderText="classID" ReadOnly="True" 
                SortExpression="classID" />
            <asp:BoundField DataField="className" HeaderText="className" 
                SortExpression="className" />
            <asp:BoundField DataField="memID" HeaderText="memID" SortExpression="memID" />
            <asp:BoundField DataField="classType" HeaderText="classType" 
                SortExpression="classType" />
            <asp:BoundField DataField="startTime" HeaderText="startTime" 
                SortExpression="startTime" />
            <asp:BoundField DataField="endTime" HeaderText="endTime" 
                SortExpression="endTime" />
        </Columns>
    </asp:GridView>
    </asp:Content>
