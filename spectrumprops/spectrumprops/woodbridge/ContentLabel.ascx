<%@ Control Language="VB" ClassName="ContentLabel" Explicit="true" Strict="true" %>
<script runat="server">
'TODO: Implement Ascyronouns sfjsdjflsdjflds
    Dim _filename As String = ""
    
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim sr As System.IO.StreamReader
        Dim content As String
        'Dim filepath As String = System.IO.Path.Combine(EDS.EWRO.Web.Configuration.ContentDirectory, _filename)
        Dim site As String = Request.Path
        Dim filepath As String = Nothing
        
        site = site.Split(CChar("/"))(1)
        filepath = System.IO.Path.Combine(Request.PhysicalApplicationPath() & site & "\content\", _filename)
        
        Dim header As Web.UI.HtmlControls.HtmlHead
        header = TryCast(Me.Page.Header, Web.UI.HtmlControls.HtmlHead)
        If header IsNot Nothing Then
            Dim link As New HtmlLink
            link.Attributes.Add("href", "/Content/Css/Content.css")
            link.Attributes.Add("rel", "stylesheet")
            link.Attributes.Add("type", "text/css")
            header.Controls.Add(link)
        End If
        
        Try
            sr = System.IO.File.OpenText(filepath)
            content = sr.ReadToEnd()
            sr.Close()
        Catch FileNotFoundException As Exception
            content = ""
        End Try
        ContentLabel.Text = content
    End Sub
    
    Public Property filename() As String
        Get
            Return _filename
        End Get
        Set(ByVal value As String)
            _filename = value
        End Set
    End Property
    
    Public Property text() As String
        Get
            Return ContentLabel.Text
        End Get
        Set(ByVal value As String)
            ContentLabel.Text = value
        End Set
    End Property
</script>

<asp:Label ID="ContentLabel" runat="server"></asp:Label>