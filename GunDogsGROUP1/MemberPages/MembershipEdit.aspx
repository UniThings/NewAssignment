<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembershipEdit.aspx.cs" Inherits="GunDogs.MemberPages.MembershipEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SDSMemberEdit" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        DeleteCommand="DELETE FROM [People] WHERE [memberID] = @memberID" 
        InsertCommand="INSERT INTO [People] ([Username], [Name], [position], [address], [dateOfBirth], [memberFrom]) VALUES (@Username, @Name, @position, @address, @dateOfBirth, @memberFrom)" 
        onselecting="SqlDataSource1_Selecting" 
        SelectCommand="SELECT * FROM [People] WHERE ([Username] = @Username)" 
        UpdateCommand="UPDATE [People] SET [Username] = @Username, [Name] = @Name, [position] = @position, [address] = @address, [dateOfBirth] = @dateOfBirth, [memberFrom] = @memberFrom WHERE [memberID] = @memberID">
        <DeleteParameters>
            <asp:Parameter Name="memberID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter DbType="Date" Name="dateOfBirth" />
            <asp:Parameter DbType="Date" Name="memberFrom" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter DbType="Date" Name="dateOfBirth" />
            <asp:Parameter DbType="Date" Name="memberFrom" />
            <asp:Parameter Name="memberID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FVEditMember" runat="server" DataSourceID="SDSMemberEdit">
    </asp:FormView>
    <br />
</asp:Content>
