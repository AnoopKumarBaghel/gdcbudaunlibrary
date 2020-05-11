<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication5.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="breadcrumb">
        <div class="container">
            <a class="breadcrumb-item" href="index.html">Home</a>
            <span class="breadcrumb-item active">Login</span>
        </div>
    </div>
    <section class="static about-sec">
        <div class="container">
            <h1>My Account / Login</h1>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's printer took a galley of type and scrambled it to make a type specimen book. It has survived not only fiveLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem </p>
            
            <form runat="server" id="llo">
  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <asp:TextBox  Width="30%"  class="form-control" id="user" runat="server"  placeholder="Enter Username"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Password</label>
    <asp:TextBox  Width="30%"  TextMode="Password" class="form-control" id="pass" runat="server" placeholder="Enter Password"/>
     </div>
              <div class="form-group mb-2">
     <asp:Button  runat="server" ID ="Button1" OnClick="Button1_Click1"  Text="Login" class ="btn btn-primary mb-2"></asp:Button>

<//div>
</form>
            
            
               
            
            
            
            
            
            
            
            
              </div>
    </section>
</asp:Content>
