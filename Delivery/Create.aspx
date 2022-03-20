<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="MyBusiness.Delivery.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <table class="dataentry">
        <tr>
            <td class="FieldName">
                <asp:Label runat="server" Text="运单号" AssociatedControlID="BillCodeCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="BillCodeCtrl" MaxLength="20" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label runat="server" Text="车号/厢号/车牌号" AssociatedControlID="CarriageCode" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="CarriageCode" MaxLength="20" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="品名" runat="server" AssociatedControlID="GoodsNameCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="GoodsNameCtrl" MaxLength="10" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="数量（吨）" runat="server" AssociatedControlID="QuantityCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="QuantityCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="发站/始发地" runat="server" AssociatedControlID="SourceCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="SourceCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="到站/目的地" runat="server" AssociatedControlID="DestinationCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="DestinationCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="发货人" runat="server" AssociatedControlID="ProviderCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="ProviderCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="发出日期" runat="server" AssociatedControlID="LeaveDateCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="LeaveDateCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="收货人" runat="server" AssociatedControlID="ReceiverCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="ReceiverCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="到货日期" runat="server" AssociatedControlID="ArriveDateCtrl" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="ArriveDateCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="上传运单图片" runat="server" AssociatedControlID="FileUploadCtrl" />
            </td>
            <td>
                <asp:FileUpload runat="server" ID="FileUploadCtrl" />
            </td>
        </tr>
        <tr>
            <td class="FieldName">
                <asp:Label Text="运单图片" runat="server" AssociatedControlID="ImageCtrl" />
            </td>
            <td>
                <asp:Image runat="server" ID="ImageCtrl" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button Text="提交" runat="server" ID="CommitCtrl" OnClick="CommitCtrl_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
