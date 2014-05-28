using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GunDogs
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        private void Page_Init(object sender, EventArgs e)
        {
            // this line sets the Session Username value to the current logged in user Username
            // do not remove or modify else your SQL Statements involving Username WILL NOT WORK
            Session["Username"] = HttpContext.Current.User.Identity.Name;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}
