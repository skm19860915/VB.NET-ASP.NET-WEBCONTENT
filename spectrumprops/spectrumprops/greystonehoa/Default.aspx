<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" Inherits="spectrumprops.DefaultOfGreyStoneHoa" Codebehind="Default.aspx.vb" %>
<%@ Register src="ContentLabel.ascx" tagname="ContentLabel" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
<script type="text/javascript">
<!--
window.location = "content/default.aspx"
//-->
</script>
    <uc2:contentlabel ID="cl1" filename="default.htm" runat="server" />    
</asp:Content>

