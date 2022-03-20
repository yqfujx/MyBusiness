<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MyBusiness.Delivery.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:HyperLink runat="server" NavigateUrl="~/Delivery/Create.aspx" Text="新增发货" />
    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="没有可显示的数据记录。" AllowSorting="True"
             OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CarriageCode" HeaderText="运单号" SortExpression="CarriageCode" />
                <asp:BoundField DataField="BillCode" HeaderText="车号/车箱号/车牌号" SortExpression="BillCode" />
                <asp:BoundField DataField="GoodsName" HeaderText="品名" SortExpression="GoodsName" />
                <asp:BoundField DataField="Quantity" HeaderText="数量（吨）" SortExpression="Quantity" />
                <asp:BoundField DataField="Source" HeaderText="发站/启发地" SortExpression="Source" />
                <asp:BoundField DataField="Destination" HeaderText="到站/目的地" SortExpression="Destination" />
                <asp:BoundField DataField="Provider" HeaderText="发货人" SortExpression="Provider" />
                <asp:BoundField DataField="LeaveDate" HeaderText="发出日期" SortExpression="LeaveDate" />
                <asp:BoundField DataField="ArriveDate" HeaderText="到达日期" SortExpression="ArriveDate" />
                <asp:BoundField DataField="Receiver" HeaderText="收货人" SortExpression="Receiver" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyBusinessConnectionString1 %>" DeleteCommand="DELETE FROM [DeliverySet] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DeliverySet] ([CarriageCode], [BillCode], [GoodsName], [Quantity], [Source], [Destination], [Provider], [LeaveDate], [ArriveDate], [Receiver], [Picture]) VALUES (@CarriageCode, @BillCode, @GoodsName, @Quantity, @Source, @Destination, @Provider, @LeaveDate, @ArriveDate, @Receiver, @Picture)" ProviderName="<%$ ConnectionStrings:MyBusinessConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [CarriageCode], [BillCode], [GoodsName], [Quantity], [Source], [Destination], [Provider], [LeaveDate], [ArriveDate], [Receiver], [Picture] FROM [DeliverySet]" UpdateCommand="UPDATE [DeliverySet] SET [CarriageCode] = @CarriageCode, [BillCode] = @BillCode, [GoodsName] = @GoodsName, [Quantity] = @Quantity, [Source] = @Source, [Destination] = @Destination, [Provider] = @Provider, [LeaveDate] = @LeaveDate, [ArriveDate] = @ArriveDate, [Receiver] = @Receiver, [Picture] = @Picture WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CarriageCode" Type="String" />
                <asp:Parameter Name="BillCode" Type="String" />
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Single" />
                <asp:Parameter Name="Source" Type="String" />
                <asp:Parameter Name="Destination" Type="String" />
                <asp:Parameter Name="Provider" Type="String" />
                <asp:Parameter Name="LeaveDate" Type="DateTime" />
                <asp:Parameter Name="ArriveDate" Type="DateTime" />
                <asp:Parameter Name="Receiver" Type="String" />
                <asp:Parameter Name="Picture" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CarriageCode" Type="String" />
                <asp:Parameter Name="BillCode" Type="String" />
                <asp:Parameter Name="GoodsName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Single" />
                <asp:Parameter Name="Source" Type="String" />
                <asp:Parameter Name="Destination" Type="String" />
                <asp:Parameter Name="Provider" Type="String" />
                <asp:Parameter Name="LeaveDate" Type="DateTime" />
                <asp:Parameter Name="ArriveDate" Type="DateTime" />
                <asp:Parameter Name="Receiver" Type="String" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
