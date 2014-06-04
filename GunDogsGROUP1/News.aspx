<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="GunDogs.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Latest NEWS
    <p> 
        <asp:SqlDataSource ID="SDSNews" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WebsiteDBConnectionString %>" 
            SelectCommand="SELECT * FROM [NewsArticle]"></asp:SqlDataSource>
    <p> 
        &nbsp;</asp:Content>