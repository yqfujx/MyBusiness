<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MyBusiness.Partner.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <a href="Item.aspx">新合作伙伴</a>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource2" EmptyDataText="没有可显示的数据记录。"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
    <Columns>
        <asp:CommandField ShowSelectButton="True" ShowDeleteButton="true" SelectText="编辑" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:MyBusinessConnectionString1 %>"
    DeleteCommand="DELETE FROM [PartnerSet] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [PartnerSet] ([Name], [Contact], [Phone]) VALUES (@Name, @Contact, @Phone)"
    ProviderName="<%$ ConnectionStrings:MyBusinessConnectionString1.ProviderName %>" 
    SelectCommand="SELECT [Id], [Name], [Contact], [Phone] FROM [PartnerSet]" 
    UpdateCommand="UPDATE [PartnerSet] SET [Name] = @Name, [Contact] = @Contact, [Phone] = @Phone WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Contact" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Contact" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
