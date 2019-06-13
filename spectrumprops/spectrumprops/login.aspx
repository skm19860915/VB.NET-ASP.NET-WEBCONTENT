<%@ Page Title="" Language="VB" MasterPageFile="~/specprop.master" AutoEventWireup="false" Inherits="spectrumprops.login" Codebehind="Login.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
 <div id="main">

 <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
        <AnonymousTemplate>
        <h2>
            Log In To Your Association Website
        </h2>
        <p>
            Please enter your username and password.
        </p>
        <div id="login">
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnAuthenticate="LoginUser_Authenticate">
            <LayoutTemplate>
                <span class="failureNotification">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                </span>
                <div id="customFailureNotification" runat="server" visible="false" class="failureNotification">
                    <p>
                        The account entered has been authenticated, but it cannot be automatically redirected.<br />
                        If you know the address for the site that you wish to access then enter it into the address bar and please try again.<br />
                        Thank you.
                    </p>
                </div>
                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                     ValidationGroup="LoginUserValidationGroup"/>
                <div class="accountInfo">
                    <fieldset class="login">
                        <legend>Account Information</legend>
                        <p>
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                 CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                 ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                 CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                 ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:CheckBox ID="RememberMe" runat="server"/>
                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                        </p>
                    </fieldset>
                    <p class="submitButton">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>
                    </p>
                </div>
            </LayoutTemplate>
        </asp:Login>
        </div>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div>
                Welcome <asp:LoginName ID="HeadLoginName" runat="server" />
                [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" OnLoggingOut="HeadLoginStatus_LoggingOut" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
   </div>
</asp:Content>

