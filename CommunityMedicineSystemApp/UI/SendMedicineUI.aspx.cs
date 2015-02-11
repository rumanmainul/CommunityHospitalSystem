using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.BLL;
using CommunityMedicineSystemApp.DAL.DAO;

namespace CommunityMedicineSystemApp.UI
{
    public partial class SendMedicineUI : System.Web.UI.Page
    {
        AreaManager areaManager = new AreaManager();
        MedicineManager aMedicineManager = new MedicineManager();
        CenterManager aCenterManager = new CenterManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                districtDropdownList.DataSource = areaManager.GetAllDistrict();
                districtDropdownList.DataTextField = "DistrictName";
                districtDropdownList.DataValueField = "DistrictId";
                districtDropdownList.DataBind();
                LoadThanaList();
                LoadCenterList();
                LoadMedicineList();
            }
        }

        protected void districtDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadThanaList();
            LoadCenterList();
        }

        protected void thanaDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCenterList();
        }

        private void LoadMedicineList()
        {
            medicineDropDownList.DataSource = aMedicineManager.GetAllMedicine();
            medicineDropDownList.DataValueField = "MedicineName";
            medicineDropDownList.DataTextField = "MedicineProperty";
            medicineDropDownList.DataBind();
        }

        private void LoadThanaList()
        {
            int districtId = Convert.ToInt32(districtDropdownList.SelectedValue);
            thanaDropDownList.DataSource = areaManager.GetTheThana(districtId);
            thanaDropDownList.DataValueField = "ThanaId";
            thanaDropDownList.DataTextField = "ThanaName";
            thanaDropDownList.DataBind();
        }

        private void LoadCenterList()
        {
            centerNameDropDownList.DataSource = aCenterManager.GetTheCenter(thanaDropDownList.SelectedValue);
            centerNameDropDownList.DataValueField = "CenterId";
            centerNameDropDownList.DataTextField = "CenterName";
            centerNameDropDownList.DataBind();
        }

        protected void sendMedicineButton_Click(object sender, EventArgs e)
        {
            int alert = 10;
            MedicineStockInCenter aMedicineStockInCenter;
            var nameList = medicineName.Value;
            medicineName.Value = "";
            string[] name = nameList.Split(',');

            var quantityList = medicineQuantity.Value;
            medicineQuantity.Value = "";
            string[] quantity = quantityList.Split(',');
            for (int i = 0; i < name.Length; i++)
            {
                if (name[i] != "")
                {
                    Medicine aMedicine = aMedicineManager.Find(name[i]);
                    aMedicineStockInCenter = new MedicineStockInCenter();
                    aMedicineStockInCenter.MedicineId = aMedicine.MedicineId;
                    aMedicineStockInCenter.CenterId = Convert.ToInt32(centerNameDropDownList.SelectedValue);
                    aMedicineStockInCenter.Quantity = Convert.ToInt32(quantity[i]);
                    alert = aMedicineManager.SendMedicineToCenter(aMedicineStockInCenter);
                }
            }

            saveAlertlabel.Text = alert.ToString();
        }
    }
}