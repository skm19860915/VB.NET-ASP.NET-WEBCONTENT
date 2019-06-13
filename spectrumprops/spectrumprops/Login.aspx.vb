
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub LoginUser_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) 'Handles LoginUser.Authenticate
        Dim user As WebControls.Login = DirectCast(sender, WebControls.Login)
        If FormsAuthentication.Authenticate(user.UserName, user.Password) Then
            If FormsAuthentication.GetRedirectUrl(user.UserName, user.RememberMeSet).Contains("Login.aspx") Then
                Dim user_redirectPath As String = ConfigurationManager.AppSettings(user.UserName)
                If Not String.IsNullOrEmpty(user_redirectPath) Then
                    FormsAuthentication.SetAuthCookie(user.UserName, user.RememberMeSet)
                    Response.Redirect(user_redirectPath)
                Else
                    Dim failureNotification As HtmlControl = DirectCast(user.FindControl("customFailureNotification"), HtmlControl)
                    failureNotification.Visible = True
                End If
            Else
                FormsAuthentication.RedirectFromLoginPage(user.UserName, user.RememberMeSet)
            End If
        End If
    End Sub

    Protected Sub HeadLoginStatus_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs)
        FormsAuthentication.SignOut()
    End Sub

End Class

