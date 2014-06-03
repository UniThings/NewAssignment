<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RegisterMember.aspx.cs" Inherits="GunDogs.RegisterMember" %>

<asp:Content ID="CMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Register new user</h3>
    <p>
        Use this page to help you register a new user. There are several important controls
        on this page that you will need to use if you want to implement access control:</p>
    <ul>
        <li>The FormView used to record your new members details must be called &quot;FVRegisterUser&quot;</li>
        <li>The FormView must have TextBoxes called TBUsername and TBPassword</li>
        <li>If you want to assign users roles for access control, the FVRegisterUser must contain
            a DropDownList called &quot;DDLRoles&quot;.&nbsp; Otherwise all new accounts will
            be considered members.</li>
        <li>If you want to store a copy of the given role in your own database you will need
            to bind the selectedValue of DDLRoles to your database attribute using the databaindings
            link on DDLRoles inside FVRegisterUser</li>
    </ul>
    <p>This page currently works as a demo page.  A backup copy can be found under the Example folder. Two 
        optional folders have been provided (AdminPages and MemberPages) should you wish to group access related pages in the same location.</p>
    <asp:FormView ID="FVRegisterUser" runat="server" DataKeyNames="memberID" DataSourceID="SDSNewMember"
        DefaultMode="Insert" OnItemInserted="FVRegisterUser_Inserted" 
        RenderOuterTable="False" oniteminserting="FVRegisterUser_Inserting" 
        onprerender="FVRegisterUser_PreRender">
        <EditItemTemplate>
            memberID:
            <asp:Label ID="memberIDLabel1" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            Username:
            <asp:TextBox ID="UsernameTextBox" runat="server" 
                Text='<%# Bind("Username") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            position:
            <asp:TextBox ID="positionTextBox" runat="server" 
                Text='<%# Bind("position") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            dateOfBirth:
            <asp:TextBox ID="dateOfBirthTextBox" runat="server" 
                Text='<%# Bind("dateOfBirth") %>' />
            <br />
            memberFrom:
            <asp:TextBox ID="memberFromTextBox" runat="server" 
                Text='<%# Bind("memberFrom") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Username:
            <asp:TextBox ID="UsernameTextBox" runat="server" 
                Text='<%# Bind("Username") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            position:
            <asp:TextBox ID="positionTextBox" runat="server" 
                Text='<%# Bind("position") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            dateOfBirth:
            <asp:TextBox ID="dateOfBirthTextBox" runat="server" 
                Text='<%# Bind("dateOfBirth") %>' />
            <br />
            memberFrom:
            <asp:TextBox ID="memberFromTextBox" runat="server" 
                Text='<%# Bind("memberFrom") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            memberID:
            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            Username:
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Bind("Username") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            position:
            <asp:Label ID="positionLabel" runat="server" Text='<%# Bind("position") %>' />
            <br />
            address:
            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
            <br />
            dateOfBirth:
            <asp:Label ID="dateOfBirthLabel" runat="server" 
                Text='<%# Bind("dateOfBirth") %>' />
            <br />
            memberFrom:
            <asp:Label ID="memberFromLabel" runat="server" 
                Text='<%# Bind("memberFrom") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <p>
    <asp:Label ID="LPageMsg" runat="server" EnableViewState="False" class="darkRed" />
    </p>
    <asp:SqlDataSource ID="SDSNewMember" runat="server" ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>"
        DeleteCommand="DELETE FROM [People] WHERE [Username] = @Username" InsertCommand="INSERT INTO [People] ([Username], [Name], [address]) VALUES (@Username, @Name, @address)"
        SelectCommand="SELECT * FROM [People]" 
        UpdateCommand="UPDATE [People] SET [Name] = @Name WHERE [Username] = @Username">
        <DeleteParameters>
            <asp:Parameter Name="Username" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="address" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
