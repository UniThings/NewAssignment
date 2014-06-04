<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="GunDogs.AdminPages.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SDSNews" runat="server" 
        ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
        DeleteCommand="DELETE FROM [NewsArticle] WHERE [newsID] = @newsID" 
        InsertCommand="INSERT INTO [NewsArticle] ([NewsTitle], [NewsText], [FileLocation],  [Author]) VALUES (@NewsTitle, @NewsText, @FileLocation, (SELECT MemberID FROM People WHERE Username = @Author))" 
        SelectCommand="SELECT NewsArticle.newsID, NewsArticle.NewsTitle, NewsArticle.NewsText, NewsArticle.FileLocation, NewsArticle.DateCreated, People.Name FROM NewsArticle INNER JOIN People ON People.memberID = NewsArticle.Author" 
        
        UpdateCommand="UPDATE [NewsArticle] SET [NewsTitle] = @NewsTitle, [NewsText] = @NewsText, [FileLocation] = @FileLocation, [DateCreated] = @DateCreated, [Author] = @Author WHERE [newsID] = @newsID" 
        onselecting="SDSNews_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="newsID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NewsTitle" Type="String" />
            <asp:Parameter Name="NewsText" Type="String" />
            <asp:Parameter Name="FileLocation" Type="String" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:SessionParameter Name="Author" SessionField="Username" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NewsTitle" Type="String" />
            <asp:Parameter Name="NewsText" Type="String" />
            <asp:Parameter Name="FileLocation" Type="String" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="Author" Type="Int32" />
            <asp:Parameter Name="newsID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="newsID" DataSourceID="SDSNews">
        <Columns>
            <asp:BoundField DataField="newsID" HeaderText="newsID" InsertVisible="False" 
                ReadOnly="True" SortExpression="newsID" />
            <asp:BoundField DataField="NewsTitle" HeaderText="NewsTitle" 
                SortExpression="NewsTitle" />
            <asp:BoundField DataField="NewsText" HeaderText="NewsText" 
                SortExpression="NewsText" />
            <asp:BoundField DataField="FileLocation" HeaderText="FileLocation" 
                SortExpression="FileLocation" />
            <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" 
                SortExpression="DateCreated" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="newsID" 
        DataSourceID="SDSNews" DefaultMode="Insert">
        <EditItemTemplate>
            newsID:
            <asp:Label ID="newsIDLabel1" runat="server" Text='<%# Eval("newsID") %>' />
            <br />
            NewsTitle:
            <asp:TextBox ID="NewsTitleTextBox" runat="server" 
                Text='<%# Bind("NewsTitle") %>' />
            <br />
            NewsText:
            <asp:TextBox ID="NewsTextTextBox" runat="server" 
                Text='<%# Bind("NewsText") %>' />
            <br />
            FileLocation:
            <asp:TextBox ID="FileLocationTextBox" runat="server" 
                Text='<%# Bind("FileLocation") %>' />
            <br />
            DateCreated:
            <asp:TextBox ID="DateCreatedTextBox" runat="server" 
                Text='<%# Bind("DateCreated") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            NewsTitle:
            <asp:TextBox ID="NewsTitleTextBox" runat="server" 
                Text='<%# Bind("NewsTitle") %>' />
            <br />
            NewsText:
            <asp:TextBox ID="NewsTextTextBox" runat="server" Text='<%# Bind("NewsText") %>' 
                TextMode="MultiLine" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            newsID:
            <asp:Label ID="newsIDLabel" runat="server" Text='<%# Eval("newsID") %>' />
            <br />
            NewsTitle:
            <asp:Label ID="NewsTitleLabel" runat="server" Text='<%# Bind("NewsTitle") %>' />
            <br />
            NewsText:
            <asp:Label ID="NewsTextLabel" runat="server" Text='<%# Bind("NewsText") %>' />
            <br />
            FileLocation:
            <asp:Label ID="FileLocationLabel" runat="server" 
                Text='<%# Bind("FileLocation") %>' />
            <br />
            DateCreated:
            <asp:Label ID="DateCreatedLabel" runat="server" 
                Text='<%# Bind("DateCreated") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
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
