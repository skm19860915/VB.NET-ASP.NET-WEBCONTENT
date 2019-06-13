<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/test/Site1.Master" CodeBehind="Default.aspx.vb" Inherits="spectrumprops._Default1" %>

<%@ Register Src="~/test/ContentLabel.ascx" TagPrefix="uc1" TagName="ContentLabel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <script type="text/javascript">
<!--
window.location = "content/default.aspx"
//-->
</script>
    <uc1:ContentLabel runat="server" ID="ContentLabel" filename="default.htm" />
</asp:Content>
