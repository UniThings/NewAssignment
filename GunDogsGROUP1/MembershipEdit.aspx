<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembershipEdit.aspx.cs" Inherits="GunDogs.MemberPages.MembershipEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SDSMemberEdit" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        DeleteCommand="DELETE FROM [People] WHERE [memberID] = @memberID" 
        InsertCommand="INSERT INTO [People] ([Username], [Name], [position], [address], [dateOfBirth], [memberFrom]) VALUES (@Username, @Name, @position, @address, @dateOfBirth, @memberFrom)" 
         
        SelectCommand="SELECT * FROM [People] WHERE [Username] = @Username" 
        
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
            <asp:SessionParameter Name="Username" SessionField="Username" />
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
    <asp:GridView ID="GVMemEdit" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="memberID" DataSourceID="SDSMemberEdit">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="memberID" HeaderText="memberID" 
                InsertVisible="False" ReadOnly="True" SortExpression="memberID" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
            <asp:BoundField DataField="dateOfBirth" HeaderText="dateOfBirth" 
                SortExpression="dateOfBirth" />
            <asp:BoundField DataField="memberFrom" HeaderText="memberFrom" 
                SortExpression="memberFrom" />
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>
