using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBusiness.Models;

namespace MyBusiness.Purchase
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MyBusinessModelContainer context = new MyBusinessModelContainer())
            {
                var ContractSet = context.PurchaseContractSet.OrderByDescending(x => x.SignDate);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string id = GridView1.DataKeys[row.RowIndex]["Id"].ToString();
            Response.Redirect("./Excute/" + id);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string id = GridView1.DataKeys[e.NewEditIndex]["Id"].ToString();
            Response.Redirect("./Contract/" + id);
        }
    }
}