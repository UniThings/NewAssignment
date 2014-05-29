<%@ Page Title="Class managment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassManagment.aspx.cs" Inherits="GunDogs.MemberPages.Trainers.ClassManagment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="Class1DS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        SelectCommand="SELECT * FROM [TrainingClass]" 
        InsertCommand="INSERT INTO [TrainingClass] ([classID], [className], [memID], [classType], [startTime], [endTime]) VALUES (@classID, @className, @memID, @classType, @startTime, @endTime)" 
        UpdateCommand="UPDATE [TrainingClass] SET [className] = @className, [classType] = @classType, [startTime] = @startTime, [endTime] = @endTime">
        <InsertParameters>
            <asp:Parameter Name="classID" />
            <asp:Parameter Name="className" />
            <asp:Parameter Name="memID" />
            <asp:Parameter Name="classType" />
            <asp:Parameter Name="startTime" />
            <asp:Parameter Name="endTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="className" />
            <asp:Parameter Name="classType" />
            <asp:Parameter Name="startTime" />
            <asp:Parameter Name="endTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="classID" DataSourceID="Class1DS" Height="50px" Width="125px" 
        DefaultMode="Insert">
        <Fields>
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
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
