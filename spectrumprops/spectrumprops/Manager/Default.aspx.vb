Imports System.IO
Imports System.Configuration.ConfigurationManager
Imports System.Web.Security

Partial Class ContentManager
    Inherits System.Web.UI.Page
    Dim sr As StreamReader

    Protected Sub lnkLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogOut.Click
        FormsAuthentication.SignOut()
        Response.Redirect("/Login.aspx")
    End Sub

    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
        Dim filepath, content As String
        Dim root As String = Request.PhysicalApplicationPath() & "\"

        If TreeView1.SelectedNode.Depth > 0 Then
            root = root & createPath(TreeView1.SelectedNode, TreeView1.SelectedNode.Depth)
        End If

        filepath = root & TreeView1.SelectedValue & ".htm"
        Try
            sr = File.OpenText(filepath)
            content = sr.ReadToEnd()
            sr.Close()
        Catch FileNotFoundException As Exception
            content = ""
            If TreeView1.SelectedNode.ChildNodes.Count > 0 Then
                TreeView1.SelectedNode.Expand()
            End If
        End Try

        FreeTextBox1.Text = content

    End Sub

    Public Function createPath(ByVal node As TreeNode, ByVal depth As Integer, Optional ByVal path As String = "") As String
        If depth = 0 Then
            path = ""
        Else
            depth -= 1
            path = createPath(node.Parent, depth, path)
            If depth < TreeView1.SelectedNode.Depth - 1 Then
                path &= node.Text & "\"
            End If
        End If

        Return path
    End Function

    Protected Sub lnkSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSave.Click
        Dim filepath As String
        Dim root As String = Request.PhysicalApplicationPath() & "\"

        If TreeView1.SelectedNode.Depth > 0 Then
            root = root & createPath(TreeView1.SelectedNode, TreeView1.SelectedNode.Depth)
        End If

        filepath = root & TreeView1.SelectedValue & ".htm"
        Try
            File.WriteAllText(filepath, FreeTextBox1.Text)
        Catch FileNotFoundException As Exception
            FreeTextBox1.Text = FileNotFoundException.Message
        End Try
    End Sub

    Public Sub createChildNodes(ByVal node As TreeNode, ByVal root As String)
        Dim folders As IEnumerable(Of String) = My.Computer.FileSystem.GetDirectories(root)
        Dim nodeCounter As Integer = 0
        Dim rootfiles As IEnumerable(Of String) = My.Computer.FileSystem.GetFiles(root, FileIO.SearchOption.SearchTopLevelOnly, "*.htm")


        For Each folder As String In folders
            Dim subfiles As IEnumerable(Of String) = My.Computer.FileSystem.GetFiles(folder, FileIO.SearchOption.SearchAllSubDirectories, "*.htm")
            If subfiles.Count > 0 Then
                node.ChildNodes.Add(New TreeNode(My.Computer.FileSystem.GetDirectoryInfo(folder).Name))
                createChildNodes(node.ChildNodes(nodeCounter), My.Computer.FileSystem.CombinePath(root, My.Computer.FileSystem.GetDirectoryInfo(folder).Name))
                nodeCounter += 1
            End If

        Next
        For Each file As String In rootfiles
            Dim filename As String = System.IO.Path.GetFileName(file)
            Dim thisfile As FileInfo = New FileInfo(filename)
            If thisfile.Extension.ToLower = ".htm" Then node.ChildNodes.Add(New TreeNode(Replace(filename.ToString(), ".htm", "")))
        Next
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Page.IsPostBack Then
            Dim root As String = Request.PhysicalApplicationPath() & "\"
            TreeView1.Nodes.Clear()
            Dim folders As Collections.ObjectModel.ReadOnlyCollection(Of String) = My.Computer.FileSystem.GetDirectories(root)
            Dim invalidfolders() As String = {"aspnet_client"}

            If folders.Count > 0 Then
                If Not (folders.Count = 1 AndAlso My.Computer.FileSystem.GetDirectoryInfo(folders(0)).Name.ToLower = "images") Then
                    TreeView1.Nodes.Add(New TreeNode("Website"))
                End If
            End If

            Dim nodeCounter As Integer = 0
            For Each folder As String In folders
                Dim rootfiles As Collections.ObjectModel.ReadOnlyCollection(Of String) = My.Computer.FileSystem.GetFiles(folder, FileIO.SearchOption.SearchAllSubDirectories, "*.htm")
                If rootfiles.Count > 0 And Not invalidfolders.Contains(My.Computer.FileSystem.GetDirectoryInfo(folder).Name) Then
                    TreeView1.Nodes(0).ChildNodes.Add(New TreeNode(My.Computer.FileSystem.GetDirectoryInfo(folder).Name))
                    createChildNodes(TreeView1.Nodes(0).ChildNodes(nodeCounter), My.Computer.FileSystem.CombinePath(root, My.Computer.FileSystem.GetDirectoryInfo(folder).Name))
                    nodeCounter += 1
                End If
            Next

            'TreeView1.Nodes.Add(New TreeNode("Testing"))
            'TreeView1.Nodes(0).ChildNodes.Add(New TreeNode("01"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes.Add(New TreeNode("11"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes(0).ChildNodes.Add(New TreeNode("21"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes.Add(New TreeNode("12"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes(1).ChildNodes.Add(New TreeNode("22"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes(1).ChildNodes(0).ChildNodes.Add(New TreeNode("31"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes(1).ChildNodes.Add(New TreeNode("23"))
            'TreeView1.Nodes(0).ChildNodes(0).ChildNodes.Add(New TreeNode("13"))
            'TreeView1.Nodes(0).ChildNodes.Add(New TreeNode("02"))
            'TreeView1.Nodes(0).ChildNodes(1).ChildNodes.Add(New TreeNode("14"))



            'For Each file As String In rootfiles
            '    Dim filename As String = System.IO.Path.GetFileName(file)
            '    TreeView1.Nodes.Add(New WebControls.TreeNode(Replace(filename.ToString(), ".htm", "")))
            'Next

            FreeTextBox1.Text = "Please Select A File To Edit"
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FreeTextBox1.ImageGalleryPath = "../"
    End Sub
End Class
