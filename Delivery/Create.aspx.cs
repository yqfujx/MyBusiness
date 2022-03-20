using Microsoft.AspNet.FriendlyUrls;
using MyBusiness.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace MyBusiness.Delivery
{
    public partial class Create : System.Web.UI.Page
    {
        private int _itemId;
        private string _imageFileDir;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> segments = (List<string>)Request.GetFriendlyUrlSegments();
            _itemId = 0;

            if (segments != null && segments.Count > 0)
            {
                int.TryParse(segments[0], out _itemId);
            }

            if (!IsPostBack && _itemId != 0)
            {
                using (MyBusinessModelContainer context = new MyBusinessModelContainer())
                {
                    var item = context.DeliverySet.FirstOrDefault(x => x.Id == _itemId);

                    BillCodeCtrl.Text = item.BillCode;
                    CarriageCode.Text = item.CarriageCode;
                    GoodsNameCtrl.Text = item.GoodsName;
                    QuantityCtrl.Text = item.Quantity.ToString();
                    SourceCtrl.Text = item.Source;
                    DestinationCtrl.Text = item.Destination;
                    ProviderCtrl.Text = item.Provider;
                    ReceiverCtrl.Text = item.Receiver;
                    LeaveDateCtrl.Text = item.LeaveDate.ToShortDateString();
                }
            }
        }

        protected void CommitCtrl_Click(object sender, EventArgs e)
        {
            Models.Delivery delivery = new Models.Delivery();
            UpdateItem(delivery);

            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                context.DeliverySet.Add(delivery);
                context.SaveChanges();

                Response.Redirect("~/Delivery/Index");
            }
        }

        private void UpdateItem(Models.Delivery delivery)
        {
            delivery.BillCode = BillCodeCtrl.Text;
            delivery.CarriageCode = CarriageCode.Text;
            delivery.GoodsName = GoodsNameCtrl.Text;

            float.TryParse(QuantityCtrl.Text, out float quantity);
            delivery.Quantity = quantity;

            delivery.Source = SourceCtrl.Text;
            delivery.Destination = DestinationCtrl.Text;
            delivery.Provider = ProviderCtrl.Text;

            DateTime.TryParse(LeaveDateCtrl.Text, out DateTime leaveDate);
            delivery.LeaveDate = leaveDate;

            delivery.Receiver = ReceiverCtrl.Text;

            if (DateTime.TryParse(ArriveDateCtrl.Text, out DateTime arriveDate))
            {
                delivery.ArriveDate = arriveDate;
            }

            if (FileUploadCtrl.PostedFile != null && FileUploadCtrl.HasFile)
            {
                _imageFileDir = ConfigurationManager.AppSettings["TransportBillDir"];
                Guid newPrefix = Guid.NewGuid();
                string localPath = Path.Combine(_imageFileDir, newPrefix + "_" +  FileUploadCtrl.FileName);
                string fullPath = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, localPath);
                FileUploadCtrl.SaveAs(fullPath);
                delivery.Picture = localPath;
            }
        }
    }
}