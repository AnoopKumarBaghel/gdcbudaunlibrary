<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="WebApplication5.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <form id="ff" runat="server">
        <div>
        <h4>Books To Download</h4>
    </div>
        <div class="form-group">
    <asp:Label runat="server" ID="lls" for="exampleInputEmail1">Search By Title</asp:Label>
    <asp:TextBox runat="server" class="form-control" ID="TextBox1" aria-describedby="emailHelp" placeholder="Book Title"/>
   <asp:Button ID="search" class="btn btn-primary mb-2" runat="server" Text="Search" OnClick="srch_Click"  />
            <asp:Button ID="cncl" class="btn btn-primary mb-2" runat="server" Text="Cancel" OnClick="cncl_Click"  />
  </div>

        <div class="justify-content-center">
    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CellPadding="4" PageSize="10" AllowPaging="true" CssClass="table table-responsive" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnPageIndexChanging="GridView2_PageIndexChanging">  
            <Columns>  
                <asp:BoundField DataField="title" HeaderText="Book Title"/>  
                <asp:BoundField DataField="Author" HeaderText="Author"/>  
                <asp:BoundField DataField="publisher" HeaderText="Publisher House"/>  
                
                         <asp:CommandField HeaderText="Select To Download" ShowSelectButton="True" />
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        


    </asp:GridView>
            </div>
          </form>
</asp:Content>
