<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" Inherits="spectrumprops.formsanddocsOfArborHills" Codebehind="formsanddocs.aspx.vb" %>
<%@ Register src="ContentLabel.ascx" tagname="ContentLabel" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="content/css/mainsite.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="pageheader">Forms and Documents</div>
    <hr />
    <div id="content">
	    <uc2:contentlabel ID="cl1" filename="_formsanddoc_top.htm" runat="server" />
        <asp:Repeater ID="groupsRep" runat="server">
            <HeaderTemplate>
                <div id="groupsMainDiv">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="documentList">
                    <h2><%# Eval("text")%></h2>
                    <asp:Repeater ID="docsRep" runat="server">
                        <HeaderTemplate>
                            <ul id="documents">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href='<%#Eval("text", "content/documents/{0}")%>' target="_blank"><%#Eval("text")%></a> - file size (<%#Eval("value")%> KB)</li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>            
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

