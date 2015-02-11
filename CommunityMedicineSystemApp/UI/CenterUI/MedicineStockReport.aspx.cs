using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineApp.BLL;
using CommunityMedicineSystemApp.UI;

namespace CommunityMedicineApp.WebUI
{
    public partial class MedicineStockReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CenterId"] == null)
            {
                Response.Redirect("CenterLoginUI.aspx");
            }
            MedicineManager aMedicineManager=new MedicineManager();
            showMedicineGridView.DataSource = aMedicineManager.GetMedicine(Convert.ToInt32(Session["CenterId"]));
            showMedicineGridView.DataBind();
        }
    }
}