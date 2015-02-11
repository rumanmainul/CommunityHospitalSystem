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
    public partial class DiseaseEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DiseaseManager aDiseaseManager = new DiseaseManager();
        protected void deseaseSaveBuntton_Click(object sender, EventArgs e)
        {
            Disease aDisease = new Disease();
            aDisease.DiseaseName = deseaseNameTextBox.Text;
            aDisease.DiseaseDescription = descriptionTextBox.Text;
            aDisease.TreatementProcedure = treatmentProcedureTextBox.Text;
            aDisease.PreparedDrugs = preparedDrugTextBox.Text;
            string alertDiseaseSave = aDiseaseManager.AddNewDisease(aDisease);
            saveAlertlabel.Text = alertDiseaseSave;
        }
    }
}