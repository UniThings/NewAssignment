<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment2013SP5.Example.Default" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
            <h4>
                Using Membership Parameter Example:</h4>
            <p style="width:580px; margin:10px 0">
                Below is an ASP.NET Login control from the toolbox which sets the web site user
                properties of the logged in user.&nbsp; The logged in users username value is then assigned to the a <strong>Session</strong>
                parameter called <strong>Username</strong>.&nbsp; Have a look at the example SqlDataSource
                below to see how the parameters are configured for each of the SQL functions then
                look at the <strong>Page_Init</strong> event&nbsp; in the code behind (.cs) file of 
                the AnimalLovers.Master MasterPage to see how to the Session Username value was 
                set.&nbsp; You must make sure ALL your pages make use of the AnimalLovers.Master 
                MasterPage for this to work.</p>
                <div style="width:300px; padding:10px; border:1px dashed #cc0000">
            <asp:Login ID="Login1" runat="server" DestinationPageUrl="Default.aspx" DisplayRememberMe="False">
            </asp:Login>
            <div style="margin-top:10px"></div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Username"
                DataSourceID="SDSExample" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                </Columns>
            </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SDSExample" runat="server" ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>"
                DeleteCommand="DELETE FROM [People] WHERE [Username] = @Username" InsertCommand="INSERT INTO [People] ([Username], [Name]) VALUES (@Username, @Name)"
                ProviderName="<%$ ConnectionStrings:WebsiteDBConnectionString.ProviderName %>"
                SelectCommand="SELECT [Username], [Name] FROM [People] WHERE Username = @Username"
                UpdateCommand="UPDATE [People] SET [Name] = @Name WHERE [Username] = @Username">
                <DeleteParameters>
                    <asp:Parameter Name="Username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <p style="margin: 10px 0">
                To simplify
                your code, <strong>do not change the name of the Session parameter</strong> which matches the 
                Username attribute in the <strong>People</strong> table.<br /> 
                Using this method for your assignment, the <strong>Username</strong> of the current logged in user can be accessed via 
                    an SqlDataSource 
                    in <span style="text-decoration: underline">any page</span> that makes use 
                of the MasterPage by setting the <strong>Source</strong> of an SQL @parameter to &quot;<strong>Session</strong>&quot; and the 
            <strong>Session field</strong> to 
            &quot;<strong>Username</strong>&quot; as shown in the example below.&nbsp; This 
         example uses the <strong>Username</strong> to SELECT the 
         currently logged in Customer 
         details based on the ASP.NET membership database login controls.&nbsp; This requires the 
                    Username of new users to be recorded in both the ASP.NET membership database AND 
                    your People table:&nbsp; </p>

                <img alt="Using Membership Username"  src="ExampleSelect.jpg" />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Back to Homepage</asp:HyperLink>
</asp:Content>
