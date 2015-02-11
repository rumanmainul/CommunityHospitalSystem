using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.BLL;

namespace CommunityMedicineSystemApp.UI
{
    public partial class DiseasewiseReportUI : System.Web.UI.Page
    {
        DiseaseManager aDiseaseManager = new DiseaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                diseaseDropDownList.DataSource = aDiseaseManager.GetAllDisease();
                diseaseDropDownList.DataValueField = "DiseaseId";
                diseaseDropDownList.DataTextField = "DiseaseName";
                diseaseDropDownList.DataBind();
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            MakeAccessible(ReportGridview);
        }
        public static void MakeAccessible(GridView grid)
        {
            if (grid.Rows.Count <= 0) return;
            grid.UseAccessibleHeader = true;
            grid.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (grid.ShowFooter)
                grid.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        TreatementManager aTreatementManager = new TreatementManager();
        protected void searchButton_Click(object sender, EventArgs e)
        {
            int dieseaseID = Convert.ToInt32(diseaseDropDownList.SelectedValue);
            ReportGridview.DataSource = aTreatementManager.GetSummary(dieseaseID);
            ReportGridview.DataBind();
        }
    }
}