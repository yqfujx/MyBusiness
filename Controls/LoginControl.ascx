<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="MyBusiness.Controls.LoginControl" %>
<div>
    用户名：<asp:TextBox runat="server" ID="UserName"></asp:TextBox>
</div>
<div>
    密码：<asp:TextBox runat="server" ID="Password" />
</div>
<div>
    <asp:Button runat="server" ID="Login" Text="登录" OnClick="Login_Click" />
</div>
