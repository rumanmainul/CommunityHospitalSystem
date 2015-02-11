using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityMedicineSystemApp.UI.CenterUI
{
    public partial class CenterIndexPageUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CenterId"] == null)
            {
                Response.Redirect("CenterLoginUI.aspx");
            }
        }
    }
}