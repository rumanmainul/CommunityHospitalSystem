using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineSystemApp.DAL.DAO;

namespace CommunityMedicineSystemApp.UI
{
    public partial class BasicMedicineSetupUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        MedicineManager aMedicineManager = new MedicineManager();
        protected void medicineSaveBuntton_Click(object sender, EventArgs e)
        {
            Medicine aMedicine = new Medicine();
            aMedicine.MedicineName = medicineNameTextBox.Text;
            aMedicine.MedicinePower = powerMgMlTextBox.Text + mgMLDropdownList.SelectedItem;
            string saveAlert = aMedicineManager.SaveMedicineToDb(aMedicine);
            saveAlertlabel.Text = saveAlert;
        }
    }
}