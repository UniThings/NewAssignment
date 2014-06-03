<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDog.aspx.cs" Inherits="GunDogs.MemberPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SDSAddDog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Dogs]" 
        DeleteCommand="DELETE FROM [Dogs] WHERE [dogID] = @dogID" 
        InsertCommand="INSERT INTO [Dogs] ([memberID], [dogName], [pedigreeName], [breed], [vaccination], [microchipped], [desexed]) VALUES ((SELECT [memberID] FROM [People] WHERE [Username] = @Username), @dogName, @pedigreeName, @breed, @vaccination, @microchipped, @desexed)" 
        UpdateCommand="UPDATE [Dogs] SET [memberID] = @memberID, [dogName] = @dogName, [trainingLevel] = @trainingLevel, [pedigreeName] = @pedigreeName, [breed] = @breed, [vaccination] = @vaccination, [microchipped] = @microchipped, [desexed] = @desexed WHERE [dogID] = @dogID">
        <DeleteParameters>
            <asp:Parameter Name="dogID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
            <asp:Parameter Name="dogName" Type="String" />
            <asp:Parameter DefaultValue="False" Name="pedigreeName" Type="Boolean" />
            <asp:Parameter DefaultValue="" Name="breed" Type="String" />
            <asp:Parameter DefaultValue="False" Name="vaccination" Type="Boolean" />
            <asp:Parameter DefaultValue="False" Name="microchipped" Type="Boolean" />
            <asp:Parameter DefaultValue="False" Name="desexed" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="memberID" Type="Int32" />
            <asp:Parameter Name="dogName" Type="String" />
            <asp:Parameter Name="trainingLevel" Type="Byte" />
            <asp:Parameter Name="pedigreeName" Type="Boolean" />
            <asp:Parameter Name="breed" Type="String" />
            <asp:Parameter Name="vaccination" Type="Boolean" />
            <asp:Parameter Name="microchipped" Type="Boolean" />
            <asp:Parameter Name="desexed" Type="Boolean" />
            <asp:Parameter Name="dogID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <br />

        <asp:FormView ID="FVNewDog" runat="server" DataKeyNames="dogID" 
        DataSourceID="SDSAddDog" DefaultMode="Insert">
            <EditItemTemplate>
                dogID:
                <asp:Label ID="dogIDLabel1" runat="server" Text='<%# Eval("dogID") %>' />
                <br />
                memberID:
                <asp:TextBox ID="memberIDTextBox" runat="server" 
                    Text='<%# Bind("memberID") %>' />
                <br />
                dogName:
                <asp:TextBox ID="dogNameTextBox" runat="server" Text='<%# Bind("dogName") %>' />
                <br />
                trainingLevel:
                <asp:TextBox ID="trainingLevelTextBox" runat="server" 
                    Text='<%# Bind("trainingLevel") %>' />
                <br />
                pedigreeName:
                <asp:CheckBox ID="pedigreeNameCheckBox" runat="server" 
                    Checked='<%# Bind("pedigreeName") %>' />
                <br />
                breed:
                <asp:TextBox ID="breedTextBox" runat="server" 
                    Text='<%# Bind("breed") %>' />
                <br />
                vaccination:
                <asp:CheckBox ID="vaccinationCheckBox" runat="server" 
                    Checked='<%# Bind("vaccination") %>' />
                <br />
                microchipped:
                <asp:CheckBox ID="microchippedCheckBox" runat="server" 
                    Checked='<%# Bind("microchipped") %>' />
                <br />
                desexed:
                <asp:CheckBox ID="desexedCheckBox" runat="server" 
                    Checked='<%# Bind("desexed") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                dogName:
                <asp:TextBox ID="dogNameTextBox" runat="server" 
                    Text='<%# Bind("dogName") %>' />
                <br />
                pedigreeName:
                <asp:CheckBox ID="pedigreeNameCheckBox" runat="server" 
                    Checked='<%# Bind("pedigreeName") %>' />
                <br />
                breed:
                <asp:TextBox ID="breedTextBox" runat="server" Text='<%# Bind("breed") %>' />
                <br />
                vaccination:
                <asp:CheckBox ID="vaccinationCheckBox" runat="server" 
                    Checked='<%# Bind("vaccination") %>' />
                <br />
                microchipped:
                <asp:CheckBox ID="microchippedCheckBox" runat="server" 
                    Checked='<%# Bind("microchipped") %>' />
                <br />
                desexed:
                <asp:CheckBox ID="desexedCheckBox" runat="server" 
                    Checked='<%# Bind("desexed") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                dogID:
                <asp:Label ID="dogIDLabel" runat="server" Text='<%# Eval("dogID") %>' />
                <br />
                memberID:
                <asp:Label ID="memberIDLabel" runat="server" Text='<%# Bind("memberID") %>' />
                <br />
                dogName:
                <asp:Label ID="dogNameLabel" runat="server" Text='<%# Bind("dogName") %>' />
                <br />
                trainingLevel:
                <asp:Label ID="trainingLevelLabel" runat="server" 
                    Text='<%# Bind("trainingLevel") %>' />
                <br />
                pedigreeName:
                <asp:CheckBox ID="pedigreeNameCheckBox" runat="server" 
                    Checked='<%# Bind("pedigreeName") %>' Enabled="false" />
                <br />
                breed:
                <asp:Label ID="breedLabel" runat="server" Text='<%# Bind("breed") %>' />
                <br />
                vaccination:
                <asp:CheckBox ID="vaccinationCheckBox" runat="server" 
                    Checked='<%# Bind("vaccination") %>' Enabled="false" />
                <br />
                microchipped: <asp:CheckBox ID="microchippedCheckBox" runat="server" 
                    Checked='<%# Bind("microchipped") %>' Enabled="false" />
                <br />
                desexed:
                <asp:CheckBox ID="desexedCheckBox" runat="server" 
                    Checked='<%# Bind("desexed") %>' Enabled="false" />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
    </asp:FormView>
        
</asp:Content>
