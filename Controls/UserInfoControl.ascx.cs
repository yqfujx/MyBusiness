using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBusiness.Controls
{
    public partial class UserInfoControl : System.Web.UI.UserControl
    {
        public string UserName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNameCtrl.Text = UserName;
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {

        }
    }
}