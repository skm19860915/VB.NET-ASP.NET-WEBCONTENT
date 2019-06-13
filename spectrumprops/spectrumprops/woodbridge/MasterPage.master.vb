
Partial Class MasterPageOfWoodBridge
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim req As HttpRequest = HttpContext.Current.Request
        Dim site As String = Request.Path
        site = site.Split(CChar("/"))(1)
        base.Text = "<base href='" & String.Format("{0}://{1}{2}{3}", req.Url.Scheme, req.Url.Authority, req.ApplicationPath, site) & "/'/></base>"
    End Sub

End Class

