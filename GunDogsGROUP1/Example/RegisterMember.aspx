﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RegisterMember.aspx.cs" Inherits="GunDogs.Example.RegisterMember" %>

<asp:Content ID="CMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Register new user</h3>
    <p>
        Use this page to help you register a new user. There are several important controls
        on this page that you will need to use if you want to implement access control:</p>
    <ul style="margin-left:20px">
        <li>The FormView used to record your new members details must be called &quot;FVRegisterUser&quot;</li>
        <li>The FormView must have TextBoxes called TBUsername and TBPassword</li>
        <li>If you want to assign users roles for access control, the FVRegisterUser must contain
            a DropDownList called &quot;DDLRoles&quot;.&nbsp; Otherwise all new accounts will
            be considered members.</li>
        <li>If you want to store a copy of the given role in your own database you will need
            to bind the selectedValue of DDLRoles to your database attribute using the databaindings
            link on DDLRoles inside FVRegisterUser</li>
    </ul>
    <p>This page currently works as a demo page.  A backup copy can be found under the Example folder where you may copy the .aspx page code to paste here should you require it.</p>
    <asp:FormView ID="FVRegisterUser" runat="server" DataKeyNames="Username" DataSourceID="SDSNewMember"
        DefaultMode="Insert" OnItemInserted="FVRegisterUser_Inserted" 
        RenderOuterTable="False" oniteminserting="FVRegisterUser_Inserting">
        <InsertItemTemplate>
            <p>
                Username:<br />
                <asp:TextBox ID="TBUsername" runat="server" Text='<%# Bind("Username") %>' />
                <asp:RequiredFieldValidator ID="RFVUsername" runat="server" ControlToValidate="TBUsername"
                    ErrorMessage="Username Required" class="darkRed" />
            </p>
            <p>
                Password:<br />
                <asp:TextBox ID="TBPassword" runat="server" />
                <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="TBPassword"
                    ErrorMessage="Password Required" class="darkRed" />
            </p>
            <p>
                Confirm Password:
                <br />
                <asp:TextBox ID="TBConfirmPassword" runat="server" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TBPassword"
                    ControlToValidate="TBConfirmPassword" ErrorMessage="Passwords must match" class="darkRed" />
            </p>
            <p>
                Role:<br />
                <asp:DropDownList ID="DDLRoles" runat="server">
                </asp:DropDownList>
            </p>
            <p>
                Name:<br />
                <asp:TextBox ID="TBName" runat="server" Text='<%# Bind("Name") %>' />
            </p>
            <asp:LinkButton ID="LBInsert" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Register" />
        </InsertItemTemplate>
    </asp:FormView>
    <p>
    <asp:Label ID="LPageMsg" runat="server" EnableViewState="False" class="darkRed" />
    </p>
    <asp:SqlDataSource ID="SDSNewMember" runat="server" ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>"
        DeleteCommand="DELETE FROM [People] WHERE [Username] = @Username" InsertCommand="INSERT INTO [People] ([Username], [Name]) VALUES (@Username, @Name)"
        SelectCommand="SELECT * FROM [People]" UpdateCommand="UPDATE [People] SET [Name] = @Name WHERE [Username] = @Username">
        <DeleteParameters>
            <asp:Parameter Name="Username" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Username" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
