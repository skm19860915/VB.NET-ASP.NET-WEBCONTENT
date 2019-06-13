<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/test/Site1.Master" CodeBehind="formsanddocs.aspx.vb" Inherits="spectrumprops.formsanddocs" %>

<%@ Register Src="~/test/ContentLabel.ascx" TagPrefix="uc1" TagName="ContentLabel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="content">
        <div id="pageheader">Forms and Documents</div>
        <hr />
	    <uc1:contentlabel ID="ContentLabel" filename="_formsanddoc_top.htm" runat="server" />
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
                            <li><a href='<%#Eval("text", "content/documents/{0}")%>' target="_blank"><%#Eval("text")%></a> - file size (<%#Eval("value")%>KB)</li>
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
