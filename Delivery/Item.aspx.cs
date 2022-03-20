using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBusiness.Models;

namespace MyBusiness.Delivery
{
    public partial class Item : System.Web.UI.Page
    {
        private int _itemId;
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
            else
            {
                ArriveDateCtrl.Enabled = false;
            }
        }

        protected void CommitCtrl_Click(object sender, EventArgs e)
        {

        }
    }
}