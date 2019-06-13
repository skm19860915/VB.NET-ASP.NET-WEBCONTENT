<%
OPTION EXPLICIT

dim objMail, strBody

set objMail = server.CreateObject("CDONTS.NEWMAIL")

'objMail.to = "wraven@spectrumprops.com"
objMail.to = "info@spectrumprops.com"
objMail.from = "noreply@spectrumprops.com"

if request("form") = "maint" then
	objMail.subject = "Maintenance Request Form"
elseif request("form") = "acct" then
	objMail.subject = "Accounting Request Form"
end if

strBody = "Name of Association: " + request("NameOfAssocication") + vbcrlf + vbcrlf
strBody = strBody + "Association Address: " + request("AssociationAddress") + vbcrlf + vbcrlf
strBody = strBody + "Your Name: " + request("YourName") + vbcrlf + vbcrlf
strBody = strBody + "Your E-mail Address: " + request("YourEmail") + vbcrlf + vbcrlf
strBody = strBody + "Day Time Phone: " + request("DayPhone") + vbcrlf + vbcrlf
strBody = strBody + "Description: " + request("Description")

objMail.Body = strBody

objMail.Send
set objMail = Nothing
response.Redirect("thanks.htm")
%>