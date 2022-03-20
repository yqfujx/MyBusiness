<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MyBusiness.Purchase.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <a href="/Purchase/Contract">新采购</a>
    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
            DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="没有可显示的数据记录。" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ShowEditButton="true"></asp:CommandField>
                <asp:BoundField DataField="Code" HeaderText="合同编号" SortExpression="Code"></asp:BoundField>
                <asp:BoundField DataField="SignDate" HeaderText="签约日期" SortExpression="SignDate" DataFormatString="{0:MM/dd}"></asp:BoundField>
                <asp:BoundField DataField="PartnerName" HeaderText="供应商" SortExpression="PartnerName"></asp:BoundField>
                <asp:BoundField DataField="Target" HeaderText="品名" SortExpression="Target" />
                <asp:BoundField DataField="Quantity" HeaderText="合同数量（吨）" SortExpression="Quantity" />
                <asp:BoundField DataField="DeliveryQuantity" HeaderText="已发货（吨）" SortExpression="DeliveryQuantity" />
                <asp:BoundField DataField="DeliveryProgress" HeaderText="发货进度" SortExpression="DeliveryProgress" />
                <asp:BoundField DataField="DeliveryEndDate" HeaderText="发货期限" SortExpression="DeliveryEndDate" DataFormatString="{0:yyyy/MM/dd}"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyBusinessConnectionString1 %>"
            DeleteCommand="DELETE FROM [PurchaseContractSet] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO [PurchaseContractSet] ([Code], [SignDate], [PartnerId], [DeliveryEndDate]) VALUES (@Code, @SignDate, @PartnerId, @DeliveryEndDate)"
            ProviderName="<%$ ConnectionStrings:MyBusinessConnectionString1.ProviderName %>" 
            SelectCommand="SELECT c.[Id], c.[Code], c.[SignDate], p.[Name] AS [PartnerName],
t.[Name] AS [Target], t.[Quantity], d1.[DeliveryQuantity],
d1.[DeliveryQuantity]/t.[Quantity] AS [DeliveryProgress], c.[DeliveryEndDate]
FROM [PurchaseContractSet] c 
INNER JOIN [PartnerSet] p ON c.[PartnerId] = p.[Id]
LEFT JOIN (SELECT [PurchaseContractId], [Name], SUM([Quantity]) AS [Quantity] FROM [PurchaseTargetSet] GROUP BY [PurchaseContractId], [Name]) t ON t.[PurchaseContractId]=c.[Id]
LEFT JOIN (SELECT [PurchaseContractId], SUM([Quantity]) AS [DeliveryQuantity] FROM [PurchaseDeliverySet] GROUP BY [PurchaseContractId]) d1 ON d1.[PurchaseContractId]=c.[Id]"
            UpdateCommand="UPDATE [PurchaseContractSet] SET [Code] = @Code, [SignDate] = @SignDate, [PartnerId] = @PartnerId, [DeliveryEndDate] = @DeliveryEndDate WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="SignDate" Type="DateTime" />
                <asp:Parameter Name="PartnerId" Type="Int32" />
                <asp:Parameter Name="DeliveryEndDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="SignDate" Type="DateTime" />
                <asp:Parameter Name="PartnerId" Type="Int32" />
                <asp:Parameter Name="DeliveryEndDate" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
