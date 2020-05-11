<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="WebApplication5.Gr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <form runat="server" id="pp">
        <div class="form-group"> 
        <asp:Label ID="upm" runat="server"  for="exampleInputEmail1" Text="Upload Type:  "></asp:Label>
        <asp:DropDownList ID="dd" AutoPostBack = "true" runat="server" class="form-control" OnSelectedIndexChanged="dd_SelectedIndexChanged">
 <asp:ListItem Value="0" Selected="True">Provide Select</asp:ListItem>
                     <asp:ListItem Value="g">Provide Link</asp:ListItem>
                   <asp:ListItem Value="m">Upload on Server</asp:ListItem>
        </asp:DropDownList>
           </div>
        <div class="form-group">
    <asp:Label runat="server" ID="lls" for="exampleInputEmail1">Title or Issue</asp:Label>
    <asp:TextBox runat="server" class="form-control" ID="TextBox1" aria-describedby="emailHelp" placeholder="Book Title"/>
    <small id="emailHelp" class="form-text text-muted">Provide Book Title or Issue</small>
  </div>
          <div class="form-group">
    <asp:Label runat="server" ID="Label1" for="exampleInputEmail1">Author or Writer</asp:Label>
    <asp:TextBox runat="server" class="form-control" ID="TextBox2" aria-describedby="emailHelp" placeholder="Author or Writer"/>
   </div>
          <div class="form-group">
    <asp:Label runat="server" ID="Label2" for="exampleInputEmail1">Publisher House</asp:Label>
    <asp:TextBox runat="server" class="form-control" ID="TextBox3" aria-describedby="emailHelp" placeholder="Publisher House/Editor"/>
   
  </div>
          <div class="form-group">
    <asp:Label runat="server" ID="Label3" for="exampleInputEmail1">Link of other Location</asp:Label>
    <asp:TextBox runat="server" class="form-control" ID="TextBox4" aria-describedby="emailHelp" placeholder="Google/OneDrive Other Link"/>
 
  </div>
   <div class="form-group">
    <asp:Label runat="server" ID="Label5" for="exampleInputEmail1">File Upload</asp:Label>
       <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
         </div>
        <div class="form-group">
            <asp:Button ID="Button2" class="btn btn-primary mb-2" runat="server" Text="Upload" OnClick="Button2_Click" OnClientClick="check();" />
        <asp:Button ID="Button3" class="btn btn-primary mb-2" runat="server" Text="Delete" OnClick="Button3_Click" />
        <asp:Label ID="Label4" class="col-form-label" runat="server" Text=""></asp:Label>
        </div>

         
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">  
            <Columns>  
                <asp:BoundField DataField="title" HeaderText="Book Title"/>  
                <asp:BoundField DataField="Author" HeaderText="Author"/>  
                <asp:BoundField DataField="publisher" HeaderText="Publisher House"/>  
                <asp:CommandField HeaderText="Select To change" ShowSelectButton="True" /> 
    
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        
          


    </asp:GridView>
           </form>
       
      </asp:Content>
