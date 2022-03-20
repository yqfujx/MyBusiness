<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="MyBusiness.Partner.Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <div>
        <p>
            <span class="DataEntry">
                <b>*</b>
                <asp:Label Text="合作方名称" runat="server" AssociatedControlID="NameCtrl" />
                <asp:TextBox runat="server" ID="NameCtrl" />
                <asp:RequiredFieldValidator ID="Name_ReqValid" ControlToValidate="NameCtrl" runat="server"
                    ErrorMessage="合作方名称不可为空" Display="None" />
            </span>
            <span class="DataEntry">
                <b>*</b>
                <asp:Label Text="联系人" runat="server" AssociatedControlID="ContactCtrl" />
                <asp:TextBox runat="server" ID="ContactCtrl" />
                <asp:RequiredFieldValidator ID="Contact_ReqValid" ControlToValidate="ContactCtrl" runat="server"
                    ErrorMessage="联系人不可为空" Display="None" />
            </span>
            <span class="DataEntry">
                <b>*</b>
                <asp:Label Text="电话" runat="server" AssociatedControlID="PhoneCtrl" />
                <asp:TextBox runat="server" ID="PhoneCtrl" />
                <asp:RegularExpressionValidator ID="ExpValid" ControlToValidate="PhoneCtrl" runat="server"
                    ErrorMessage="电话不合理" Display="None" ValidationExpression="^1[3456789]\d{9}$" />
            </span>
        </p>
        <p>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UploadCtrl" Text="上传" runat="server" OnClick="UploadCtrl_Click" />
            <asp:Repeater ID="Repeater1" runat="server" >
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PathName") %>' CssClass="Thumbnail" />
                </ItemTemplate>
            </asp:Repeater>
        </p>
    </div>
    <div>
        <asp:Button Text="删除" runat="server" ID="DeleteCtrl" OnClick="DeleteCtrl_Click" />
        <asp:Button Text="提交" runat="server" ID="CommitCtrl" OnClick="CommitCtrl_Click" />
    </div>
</asp:Content>
