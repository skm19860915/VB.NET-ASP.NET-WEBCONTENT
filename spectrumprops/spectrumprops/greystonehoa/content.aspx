<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>

<script runat="server">
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim sr As System.IO.StreamReader
        Dim content As String
        Dim filename As String = ""
        Dim site As String = Request.Path
        Dim filepath As String = Nothing

        site = site.Split(CChar("/"))(1)
        Dim targetPage = HttpContext.Current.Request.Url.AbsolutePath.Split("/").LastOrDefault
        If targetPage.EndsWith(".aspx") Then
            filename = targetPage.Split(".").FirstOrDefault
        End If

        filepath = System.IO.Path.Combine(Request.PhysicalApplicationPath() & site & "\content\", filename & ".htm")

        Try
            sr = System.IO.File.OpenText(filepath)
            content = sr.ReadToEnd()
            sr.Close()
        Catch FileNotFoundException As Exception
            content = ""
        End Try

        ContentLiteral.Text = content
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Css/Content.css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <asp:Literal ID="ContentLiteral" runat="server"></asp:Literal>
    </div>
</asp:Content>