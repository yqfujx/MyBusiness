using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBusiness.Models;

namespace MyBusiness.Partner
{
    public partial class Item : System.Web.UI.Page
    {
        private int _itemId;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            List<string> segments = (List<string>)Request.GetFriendlyUrlSegments();
            _itemId = 0;

            if (segments != null && segments.Count > 0)
            {
                int.TryParse(segments[0], out _itemId);
            }

            if (!IsPostBack)
            {
                if (_itemId > 0)
                {
                    using (MyBusinessModelContainer context = new MyBusinessModelContainer())
                    {
                        var item = context.PartnerSet.FirstOrDefault(x => x.Id == _itemId);

                        NameCtrl.Text = item.Name;
                        ContactCtrl.Text = item.Contact;
                        PhoneCtrl.Text = item.Phone;
                    }
                }
                else
                {
                    DeleteCtrl.Enabled = false;
                }
            }
        }

        protected void CommitCtrl_Click(object sender, EventArgs e)
        {
            Models.Partner partner;
            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                if (_itemId == 0)
                {
                    partner = new Models.Partner();
                    UpdateItem(partner);
                    context.PartnerSet.Add(partner);
                }
                else
                {
                    partner = context.PartnerSet.FirstOrDefault(x => x.Id == _itemId);
                    UpdateItem(partner);
                }
                context.SaveChanges();

                Response.Redirect("~/Partner/Index");
            }
        }

        private void UpdateItem(Models.Partner item)
        {
            item.Name = NameCtrl.Text;
            item.Contact = ContactCtrl.Text;
            item.Phone = PhoneCtrl.Text;
        }

        protected void DeleteCtrl_Click(object sender, EventArgs e)
        {
            if (_itemId !=  0)
            {
                using (MyBusinessModelContainer context = new MyBusinessModelContainer())
                {
                    Models.Partner p = context.PartnerSet.FirstOrDefault(x => x.Id == _itemId);

                    if (p != null)
                    {
                        context.PartnerSet.Remove(p);
                        context.SaveChanges();
                        Response.Redirect("../Index");
                    }
                }
            }
        }
        protected void UploadCtrl_Click(object sender, EventArgs e)
        {

        }
    }
}