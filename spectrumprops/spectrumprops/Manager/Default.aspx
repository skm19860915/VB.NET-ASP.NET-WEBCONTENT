<%@ Page Language="VB" AutoEventWireup="false"
    Inherits="spectrumprops.ContentManager" ValidateRequest="false" Codebehind="Default.aspx.vb" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expert Data Solutions Content Manager</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" width="980">
                <tr>
                    <td>
                        <table cellpadding="3" cellspacing="0" border="0" width="100%">
                            <tr bgcolor="#396DA5">
                                <td style="padding-left: 10px; padding-right: 10px; border-right: solid thin white;border-bottom: solid thin white;">
                                    <asp:LinkButton ID="lnkSave" runat="server" ForeColor="White" Font-Bold="True">Save</asp:LinkButton>
                                </td>
                                <td width="100%" style="text-align: center; font-weight: bold; color: white;border-bottom: solid thin white;">
                                    Expert Data Solutions Content Manager
                                </td>
                                <td style="padding-left: 10px; padding-right: 10px; border-left: solid thin white;border-bottom: solid thin white;">
                                    <asp:LinkButton ID="lnkLogOut" runat="server" ForeColor="white" Font-Bold="True">LogOut</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="200" valign="top" style="border-left: solid thin #9CBEF7;border-bottom: solid thin #9CBEF7;border-top: solid thin #9CBEF7;">
                                    <asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer"
                                        NodeIndent="10" ExpandDepth="1">
                                        <ParentNodeStyle Font-Bold="False" />
                                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                            VerticalPadding="0px" />
                                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                            NodeSpacing="0px" VerticalPadding="2px" />
                                        <DataBindings>
                                            <asp:TreeNodeBinding DataMember="SiteMapNode" TextField="Title" />
                                        </DataBindings>
                                    </asp:TreeView>                                    
                                    &nbsp; &nbsp;
                                    &nbsp; &nbsp;
                                </td>
                                <td>


    	
    	<div>		
			<FTB:FreeTextBox ID="FreeTextBox1" runat="Server" Width="794px" Height="500px" ToolbarLayout="paragraphmenu, fontfacesmenu, fontsizesmenu, fontforecolorpicker, fontbackcolorpicker, bold, italic, underline, strikethrough, superscript, subscript, selectall; justifyleft, justifycenter, justifyright, justifyfull; bulletedlist, numberedlist; outdent, indent,symbolsmenu,
| cut, copy, paste, print, undo, redo; iespellcheck, createlink, unlink, insertimagefromgallery, insertrule, inserttime, insertdate;inserttable, edittable, inserttablerowafter, inserttablerowbefore, inserttablecolumnafter, inserttablecolumnbefore, deletetablerow, deletetablecolumn"
        ImageGalleryUrl="ftb.imagegallery.aspx?rif={0}&cif={0}&page=default" />
		</div>


                                </td>

                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>