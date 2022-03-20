<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contract.aspx.cs" Inherits="MyBusiness.Purchase.Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="Section">
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Valid1" />
        </div>
        <h3>基本信息</h3>
        <span class="DataEntry">
            <b>*</b>
            <asp:Label Text="合同编号" runat="server" AssociatedControlID="CodeCtrl" />
            <asp:TextBox runat="server" ID="CodeCtrl" />
            <asp:RequiredFieldValidator ID="Code_ReqValid" ControlToValidate="CodeCtrl" runat="server"
                ErrorMessage="合同编号不可为空" Display="None" ValidationGroup="Valid1" />
        </span>
        <span class="DataEntry">
            <b>*</b>
            <asp:Label Text="签约日期" runat="server" AssociatedControlID="SignDateCtrl" />
            <asp:TextBox runat="server" ID="SignDateCtrl" CssClass="editordatepicker" />
            <asp:RequiredFieldValidator ID="SignDate_ReqValid" ControlToValidate="SignDateCtrl" runat="server"
                ErrorMessage="签约日期不可为空" Display="None" ValidationGroup="Valid1" />
            <asp:CompareValidator ID="SignDate_CmprValid" ControlToValidate="SignDateCtrl" runat="server"
                Type="Date" Operator="DataTypeCheck" ErrorMessage="签约日期不合理" Display="None" ValidationGroup="Valid1" />
        </span>
        <span class="DataEntry">
            <b>*</b>
            <asp:Label Text="供应商" runat="server" AssociatedControlID="PartnerCtrl" />
            <asp:DropDownList runat="server" ID="PartnerCtrl" OnSelectedIndexChanged="PartnerCtrl_SelectedIndexChanged" EnableViewState="true" />
            <asp:RequiredFieldValidator ID="Partner_ReqValid" ControlToValidate="PartnerCtrl" runat="server"
                ErrorMessage="供应商不可为空" Display="None" ValidationGroup="Valid1" />
        </span>
        <span class="DataEntry">
            <asp:Label Text="发货截止日期" runat="server" AssociatedControlID="DeliveryEndDateCtrl" />
            <asp:TextBox runat="server" ID="DeliveryEndDateCtrl" CssClass="editordatepicker" />
            <asp:CompareValidator ID="DeliveryEndDate_CmprValid" ControlToValidate="DeliveryEndDateCtrl" runat="server"
                Type="Date" Operator="DataTypeCheck" ErrorMessage="发货截止日期不合理" Display="None" ValidationGroup="Valid1" />
        </span>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" CssClass="Section">
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="Valid2" />
        <h3>合同标的</h3>
        <div>
            <p>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="标的名称" runat="server" AssociatedControlID="TargetNameCtrl" />
                    <asp:TextBox runat="server" ID="TargetNameCtrl" />
                    <asp:RequiredFieldValidator ID="TargetName_ReqValid" runat="server" ControlToValidate="TargetNameCtrl"
                        ErrorMessage="标的名称不可为空" Display="None" ValidationGroup="Valid2" />
                </span>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="数量（吨）" runat="server" AssociatedControlID="QuantityCtrl" />
                    <asp:TextBox runat="server" ID="QuantityCtrl" />
                    <asp:RequiredFieldValidator ID="Quantity_ReqValid" ControlToValidate="QuantityCtrl" runat="server"
                        ErrorMessage="数量不可为空" Display="None" ValidationGroup="Valid2" />
                    <asp:CompareValidator ID="Quantity_CmprValid" ControlToValidate="QuantityCtrl" runat="server"
                        Type="Double" Operator="DataTypeCheck" ErrorMessage="数量不合理" Display="None" ValidationGroup="Valid2" />
                    <asp:RangeValidator ID="Quantity_RangeValid" ControlToValidate="QuantityCtrl" runat="server"
                        MinimumValue="1" MaximumValue="9999999" ErrorMessage="数量不合理" Display="None" ValidationGroup="Valid2" />
                </span>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="单价（元/吨）" runat="server" AssociatedControlID="PriceCtrl" />
                    <asp:TextBox runat="server" ID="PriceCtrl" />
                    <asp:RequiredFieldValidator ID="Price_ReqValid" ControlToValidate="PriceCtrl" runat="server"
                        ErrorMessage="单价不可为空" Display="None" ValidationGroup="Valid2" />
                    <asp:RangeValidator ID="Price_RangeValid" ControlToValidate="PriceCtrl" runat="server"
                        MinimumValue="0.01" MaximumValue="999999" ErrorMessage="单价不合理" Display="None" ValidationGroup="Valid2" />
                </span>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="交货方式" runat="server" AssociatedControlID="DeliveryWayCtrl" />
                    <asp:DropDownList runat="server" ID="DeliveryWayCtrl">
                        <asp:ListItem Text="到站价" Value="到站价" />
                        <asp:ListItem Text="到厂价" Value="到厂价" />
                        <asp:ListItem Text="车板价" Value="车板价" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="DeliveryWay_ReqValid" ControlToValidate="DeliveryWayCtrl" runat="server"
                        ErrorMessage="交货方式不可为空" Display="None" ValidationGroup="Valid2" />
                </span>
            </p>
            <p>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="交货地点" runat="server" AssociatedControlID="PlaceCtrl" />
                    <asp:TextBox runat="server" ID="PlaceCtrl" />
                    <asp:RequiredFieldValidator ID="Place_ReqValid" ControlToValidate="PlaceCtrl" runat="server"
                        ErrorMessage="交货地点不可为空" Display="None" ValidationGroup="Valid2" />
                </span>
                <span class="DataEntry">
                    <b>*</b>
                    <asp:Label Text="质量要求" runat="server" AssociatedControlID="QualityCtrl" />
                    <asp:TextBox runat="server" ID="QualityCtrl" Rows="5" Columns="60" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="Quality_ReqValid" ControlToValidate="QualityCtrl" runat="server"
                        ErrorMessage="质量要求不可为空" Display="None" ValidationGroup="Valid2" />
                </span>
            </p>
        </div>
        <div>
            <asp:Button Text="添加标的" runat="server" ID="AddTargetCtrl" OnClick="AddTargetCtrl_Click" ValidationGroup="Valid2" />
        </div>
        <div>
            <asp:GridView runat="server" ID="GridView1" CssClass="GridView" AutoGenerateColumns="false"
                OnRowDeleting="GridView1_RowDeleting" EmptyDataText="没有可显示的数据记录。" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:TemplateField HeaderText="品名">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="数量">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Quantity") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="单价">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交货方式">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("DeliveryWay") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交货地点">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Place") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="质量要求">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Quality", "{0:20c}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" Text="删除" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <div>
        <asp:Button Text="删除合同" runat="server" ID="Delete" OnClick="Delete_Click" />
        <asp:Button Text="上一步" runat="server" ID="Previous" OnClick="Previous_Click" />
        <asp:Button Text="下一步" runat="server" ID="Next" OnClick="Next_Click" ValidationGroup="Valid1" />
    </div>
</asp:Content>
