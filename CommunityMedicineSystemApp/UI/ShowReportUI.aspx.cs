using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.UI
{
    public partial class ShowReportUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        PdfDBGateway aPdfDbGateway = new PdfDBGateway();
        protected void searchButton_Click(object sender, EventArgs e)
        {
            string sqlQuery = "SELECT * FROM tbl_patients WHERE id=1";
            aPdfDbGateway.GetData(sqlQuery);
            //http://www.aspsnippets.com/Articles/How-to-generate-and-download-PDF-Report-from-database-in-ASPNet-using-iTextSharp-C-and-VBNet.aspx
        }
    }
}