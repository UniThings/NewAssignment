<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="Assignment2013SP5.Default" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Welcome to The Gun Dog Club of SA</h1>
    <p>
        Please modify the contents of this web application to suit your needs. this includes:</p>
    <ul style="margin-left:20px">
        <li>This page and any others</li>
        <li>the Site Master</li>
        <li>the Web.sitemap</li>
        <li>And the site.css file found in the styles folder</li>
    </ul>
    <asp:HyperLink runat="server" NavigateUrl="~/Example">View Example use of Sessions</asp:HyperLink>
    <br />
    <asp:HyperLink runat="server" NavigateUrl="~/Login.aspx" ID="HyperLink1">Initial Login page</asp:HyperLink>
    <br />
    <asp:HyperLink runat="server" NavigateUrl="~/RegisterMember.aspx">Example register user page</asp:HyperLink>
</asp:Content>
