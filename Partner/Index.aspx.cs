using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBusiness.Models;

namespace MyBusiness.Partner
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string id = GridView1.DataKeys[row.RowIndex]["Id"].ToString();
            Response.Redirect(@"Item/" + id);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex]["Id"]);

            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                Models.Partner p = context.PartnerSet.FirstOrDefault(x => x.Id == id);
                context.PartnerSet.Remove(p);
                context.SaveChanges();
            }
        }
    }
}