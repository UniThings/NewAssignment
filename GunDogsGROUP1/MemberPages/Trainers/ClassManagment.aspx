<%@ Page Title="Class managment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassManagment.aspx.cs" Inherits="GunDogs.MemberPages.Trainers.ClassManagment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="Class1DS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        SelectCommand="SELECT * FROM [TrainingClass]" 
        InsertCommand="INSERT INTO [TrainingClass] ([className], [memID], [classType], [startTime], [endTime]) VALUES (@className, (SELECT [memberID] FROM [People] WHERE [Username] = @Username), @classType, @startTime, @endTime)
" 
        
        UpdateCommand="UPDATE [TrainingClass] SET [className] = @className, [memID] = @memID, [classType] = @classType, [startTime] = @startTime, [endTime] = @endTime WHERE [classID] = @classID" 
        DeleteCommand="DELETE FROM [TrainingClass] WHERE [classID] = @classID">
        <DeleteParameters>
            <asp:Parameter Name="classID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="className" Type="String" />
            <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
            <asp:Parameter Name="classType" Type="String" />
            <asp:Parameter Name="startTime" Type="DateTime" />
            <asp:Parameter Name="endTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="className" Type="String" />
            <asp:Parameter Name="memID" Type="String" />
            <asp:Parameter Name="classType" Type="String" />
            <asp:Parameter Name="startTime" Type="DateTime" />
            <asp:Parameter Name="endTime" Type="DateTime" />
            <asp:Parameter Name="classID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
        <asp:FormView ID="FVNewClass" runat="server" DataKeyNames="classID" 
        DataSourceID="Class1DS" DefaultMode="Insert">
            <EditItemTemplate>
                classID:
                <asp:Label ID="classIDLabel1" runat="server" Text='<%# Eval("classID") %>' />
                <br />
                className:
                <asp:TextBox ID="classNameTextBox" runat="server" 
                    Text='<%# Bind("className") %>' />
                <br />
                memID:
                <asp:TextBox ID="memIDTextBox" runat="server" Text='<%# Bind("memID") %>' />
                <br />
                classType:
                <asp:TextBox ID="classTypeTextBox" runat="server" 
                    Text='<%# Bind("classType") %>' />
                <br />
                startTime:
                <asp:TextBox ID="startTimeTextBox" runat="server" 
                    Text='<%# Bind("startTime") %>' />
                <br />
                endTime:
                <asp:TextBox ID="endTimeTextBox" runat="server" Text='<%# Bind("endTime") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                className:
                <asp:TextBox ID="classNameTextBox" runat="server" 
                    Text='<%# Bind("className") %>' />
                <br />
                classType:
                <asp:TextBox ID="classTypeTextBox" runat="server" 
                    Text='<%# Bind("classType") %>' />
                <br />
                startTime:
                <asp:TextBox ID="startTimeTextBox" runat="server" 
                    Text='<%# Bind("startTime") %>' />
                <br />
                endTime:
                <asp:TextBox ID="endTimeTextBox" runat="server" Text='<%# Bind("endTime") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                classID:
                <asp:Label ID="classIDLabel" runat="server" Text='<%# Eval("classID") %>' />
                <br />
                className:
                <asp:Label ID="classNameLabel" runat="server" Text='<%# Bind("className") %>' />
                <br />
                memID:
                <asp:Label ID="memIDLabel" runat="server" Text='<%# Bind("memID") %>' />
                <br />
                classType:
                <asp:Label ID="classTypeLabel" runat="server" Text='<%# Bind("classType") %>' />
                <br />
                startTime:
                <asp:Label ID="startTimeLabel" runat="server" Text='<%# Bind("startTime") %>' />
                <br />
                endTime:
                <asp:Label ID="endTimeLabel" runat="server" Text='<%# Bind("endTime") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
    </asp:FormView>
        <br />
    </asp:Content>
