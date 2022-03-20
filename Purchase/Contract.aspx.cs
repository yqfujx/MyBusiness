using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBusiness.Models;
using Microsoft.AspNet.FriendlyUrls;
using System.Data.SqlClient;
using System.Data.Entity.Migrations;

namespace MyBusiness.Purchase
{
    public partial class Contract : System.Web.UI.Page
    {
        private int _contractId;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            _contractId = 0;
            List<string> segments = (List<string>)Request.GetFriendlyUrlSegments();
            if (segments != null && segments.Count > 0)
            {
                int.TryParse(segments[0], out _contractId);
            }

            if (!IsPostBack)
            {
                DoInit();
            }
        }

        private DataTable GetTargetTable()
        {
            DataTable dt = ViewState["TargetTable"] as DataTable;
            if (dt == null)
            {
                dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("ContractId");
                dt.Columns.Add("Name");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Price");
                dt.Columns.Add("DeliveryWay");
                dt.Columns.Add("Place");
                dt.Columns.Add("Quality");

                ViewState["TargetTable"] = dt;
            }

            return dt;
        }
        private void FillGridView(int contractId)
        {
            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                DataTable dt = GetTargetTable();

                (from t in context.PurchaseTargetSet.AsEnumerable()
                     where t.PurchaseContractId == contractId
                     select new
                     {
                         Id = t.Id,
                         ContractId = contractId,
                         Name = t.Name,
                         Quantity = t.Quantity,
                         Price = t.Price,
                         DeliveryWay = t.DeliveryWay,
                         Place = t.Place,
                         Quality = t.Quality
                     }
                 ).Aggregate(dt, (table, r) =>
                 {
                     table.Rows.Add(r.Id, r.ContractId, r.Name, r.Quantity, r.Price, r.DeliveryWay, r.Place, r.Quality);
                     return table;
                 });

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private void DoInit()
        {
            int step = 0;

            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                var partners = (from i in context.PartnerSet
                                where true
                                select new
                                {
                                    PartnerId = i.Id,
                                    PartnerName = i.Name
                                }).ToList();
                PartnerCtrl.DataSource = partners;
                PartnerCtrl.DataTextField = "PartnerName";
                PartnerCtrl.DataValueField = "PartnerId";
                PartnerCtrl.DataBind();

                PurchaseContract contract = context.PurchaseContractSet.FirstOrDefault(x => x.Id == _contractId);
                if (contract != default(PurchaseContract))
                {
                    CodeCtrl.Text = contract.Code;
                    SignDateCtrl.Text = contract.SignDate.ToShortDateString();
                    PartnerCtrl.SelectedValue = contract.PartnerId.ToString();
                    DeliveryEndDateCtrl.Text = contract.DeliveryEndDate?.ToShortDateString();

                    FillGridView(_contractId);
                    step = 1;
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
            }

            ChangeStep(step);
        }

        protected void PartnerCtrl_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void UpdateContractModel(PurchaseContract contract)
        {
            contract.Code = CodeCtrl.Text;

            if (DateTime.TryParse(SignDateCtrl.Text, out DateTime date))
            {
                contract.SignDate = date;
            }

            int.TryParse(PartnerCtrl.SelectedValue, out int partnerId);
            contract.PartnerId = partnerId;

            if (DateTime.TryParse(DeliveryEndDateCtrl.Text, out date))
            {
                contract.DeliveryEndDate = date;
            }
        }

        private void UpdateTargetModel(PurchaseTarget target)
        {
            target.Name = TargetNameCtrl.Text;

            float.TryParse(QuantityCtrl.Text, out float quantity);
            target.Quantity = quantity;

            float.TryParse(PriceCtrl.Text, out float price);
            target.Price = price;

            target.DeliveryWay = DeliveryWayCtrl.SelectedValue;
            target.Place = PlaceCtrl.Text;
            target.Quality = QualityCtrl.Text;
        }

        protected void Commit()
        {
            PurchaseContract contract;

            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                if (_contractId == 0)
                {
                    contract = new PurchaseContract();
                    context.PurchaseContractSet.Add(contract);
                }
                else
                {
                    contract = context.PurchaseContractSet.FirstOrDefault(x => x.Id == _contractId);
                }

                UpdateContractModel(contract);
                Models.Partner partner = context.PartnerSet.FirstOrDefault(x => x.Id == contract.PartnerId);
                contract.Partner = partner;

                contract.PurchaseTarget.Clear();
                List<PurchaseTarget> list = new List<PurchaseTarget>();
                DataTable dt = GetTargetTable();
                foreach (DataRow row in dt.Rows)
                {
                    list.Add(new PurchaseTarget
                    {
                        Id = Convert.ToInt32(row["Id"]),
                        PurchaseContractId = _contractId,
                        Name = (string)row["Name"],
                        Quantity = Convert.ToSingle(row["Quantity"]),
                        Price = Convert.ToSingle(row["Price"]),
                        DeliveryWay = (string)row["DeliveryWay"],
                        Place = (string)row["Place"],
                        Quality = (string)row["Quality"]
                    });

                }
                contract.PurchaseTarget = list;

                context.SaveChanges();
            }
        }
        private void ChangeStep(int step)
        {
            switch (step)
            {
                case 0:
                    Panel1.Enabled = true;
                    Panel2.Visible = false;
                    Previous.Enabled = false;
                    break;
                case 1:
                    Panel1.Enabled = false;
                    Panel2.Visible = true;
                    Previous.Enabled = true;
                    break;
                case 2:
                    Commit();
                    Response.Redirect("~/Purchase/Index");
                    break;
                default:
                    break;
            }

            ViewState["step"] = step;
        }
        protected void Previous_Click(object sender, EventArgs e)
        {
            var step = ViewState["step"] as int?;
            step--;

            ChangeStep(step.Value);
        }
        protected void Next_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var step = ViewState["step"] as int?;
                step++;

                ChangeStep(step.Value);
            }
        }

        protected void AddTargetCtrl_Click(object sender, EventArgs e)
        {
            PurchaseTarget target = new PurchaseTarget();
            UpdateTargetModel(target);
            TargetNameCtrl.Text = string.Empty;
            QuantityCtrl.Text = string.Empty;
            PriceCtrl.Text = string.Empty;
            PlaceCtrl.Text = string.Empty;
            QualityCtrl.Text = string.Empty;

            DataTable dt = GetTargetTable();
            dt.Rows.Add(new object[] { target.Id, _contractId, target.Name, target.Quantity, target.Price, target.DeliveryWay, target.Place, target.Quality });
            GridView1.DataSource = dt;
            GridView1.DataBind();

            ViewState["TargetTable"] = dt;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = GetTargetTable();
            dt.Rows.RemoveAt(e.RowIndex);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            ViewState["TargetTable"] = dt;
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                Models.PurchaseContract contract = context.PurchaseContractSet.FirstOrDefault(x => x.Id == _contractId);
                if (contract != null)
                {
                    context.PurchaseContractSet.Remove(contract);
                    context.SaveChanges();

                    Response.Redirect("../Index");
                }
            }
        }
    }
}