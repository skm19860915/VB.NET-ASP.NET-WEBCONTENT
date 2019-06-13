
Partial Class formsanddocsOfBridgeHaven
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Dim DocAndFormsPath As String = Nothing
        Dim _Folders() As String = Nothing
        Dim showFormsAndDocs As Boolean = True
        Dim site As String = Request.Path

        Try
            site = site.Split(CChar("/"))(1)
            DocAndFormsPath = System.IO.Path.Combine(Request.PhysicalApplicationPath(), site & "\Content\documents\")
            _Folders = IO.Directory.GetDirectories(DocAndFormsPath)
        Catch ex As System.IO.DirectoryNotFoundException
            showFormsAndDocs = False
        Catch ex As System.IO.PathTooLongException
            showFormsAndDocs = False
        End Try

        If showFormsAndDocs AndAlso _Folders.Count > 0 Then
            Dim FormsAndDocsFolderList As New ListItemCollection

            For Each folderName As String In _Folders
                Dim folderItem As ListItem = New ListItem
                Dim folderInfo As IO.DirectoryInfo = New IO.DirectoryInfo(folderName)
                Dim filepath As String = folderName
                Dim _files() As String = System.IO.Directory.GetFiles(filepath)

                If _files.Count > 0 Then
                    folderItem.Text = folderInfo.Name
                    folderItem.Value = folderName
                    FormsAndDocsFolderList.Add(folderItem)
                End If
            Next

            If FormsAndDocsFolderList.Count > 0 Then
                With groupsRep
                    .DataSource = FormsAndDocsFolderList
                    .DataBind()
                End With
            End If
        End If
    End Sub

    Protected Sub groupsRep_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles groupsRep.ItemDataBound
        Dim groupLI As ListItem = e.Item.DataItem
        If groupLI IsNot Nothing Then
            Dim docsRep As Repeater = CType(e.Item.FindControl("docsRep"), Repeater)
            Dim _files() As String = IO.Directory.GetFiles(groupLI.Value)
            Dim fileList As ListItemCollection = getDocList(_files)

            With docsRep
                .DataSource = fileList
                .DataBind()
            End With

        End If
    End Sub

    Protected Function getDocList(ByVal files() As String) As ListItemCollection
        Dim FormsAndDocs As New ListItemCollection
        Dim fileTypeToAdd As String = ".pdf"

        For Each file As String In files
            Dim fileItem As New ListItem
            Dim itemInfo As System.IO.FileInfo = New System.IO.FileInfo(file)
            Dim fileSize As String = Nothing

            If itemInfo.Extension.ToLower = fileTypeToAdd Then
                fileItem.Text = itemInfo.Name
                fileSize = Math.Round(itemInfo.Length / 1024)
                fileItem.Value = fileSize
                FormsAndDocs.Add(fileItem)
            End If
        Next
        Return FormsAndDocs
    End Function

End Class
