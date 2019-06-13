Public Class EmailForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pageId As String = Request.QueryString("form")
        Dim nameOfAssociation As String = Request.Form("NameOfAssocication")
        Dim associationAddress As String = Request.Form("AssociationAddress")
        Dim yourName As String = Request.Form("YourName")
        Dim yourEmail As String = Request.Form("YourEmail")
        Dim dayPhone As String = Request.Form("DayPhone")
        Dim description As String = Request.Form("Description")

        SendEmailViaOffice365(nameOfAssociation, associationAddress, yourName, yourEmail, dayPhone, description)
    End Sub

    Private Sub SendEmailViaOffice365(title As String, address As String, name As String, email As String, phone As String, message As String)
        Dim subject As String = "Maintenance Request Form"
        Dim body As String = "Name of Association: " + Request("NameOfAssocication") + vbCrLf + vbCrLf
    End Sub
End Class