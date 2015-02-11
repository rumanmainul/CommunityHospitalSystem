using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using CommunityMedicineApp.BLL;
using CommunityMedicineSystemApp.BLL;
using CommunityMedicineSystemApp.DAL.DAO;

namespace CommunityMedicineSystemApp.UI.CenterUI
{
    public partial class TreatmentUI : System.Web.UI.Page
    {
        DoctorManager aDoctorManager = new DoctorManager();
        DiseaseManager aDiseaseManager = new DiseaseManager();
        MedicineManager aMedicineManager = new MedicineManager();
        TreatementManager aTreatementManager = new TreatementManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            int centerId =Convert.ToInt32(Session["CenterId"]);
            doctorDropDownList.DataSource = aDoctorManager.GetTheDoctor(centerId);
            doctorDropDownList.DataTextField = "Name";
            doctorDropDownList.DataValueField = "Id";
            doctorDropDownList.DataBind();

            diseaseDropDownList.DataSource = aDiseaseManager.GetAllDisease();
            diseaseDropDownList.DataValueField = "DiseaseName";
            diseaseDropDownList.DataTextField = "DiseaseName";
            diseaseDropDownList.DataBind();

            MedicineDropDownList.DataSource = aMedicineManager.GetMedicineByCenter(centerId);
            MedicineDropDownList.DataValueField = "MedicineName";
            MedicineDropDownList.DataTextField = "MedicineProperty";
            MedicineDropDownList.DataBind();
        }

        protected void saveTreatement_Click(object sender, EventArgs e)
        {

            int centerId = Convert.ToInt32(Session["CenterId"]);
            Center aCenter = new Center();
            aCenter = aCenterManager.GetInformation(centerId);
            Patient aPatient = new Patient();
            aPatient.VoterId = Convert.ToInt64(voterIdTextBox.Text);
            aPatient.DistrictId = aCenter.DistrictId;
            aPatient.ThanaId = aCenter.ThanaId;
            int patientId = aPatientManager.AddPatient(aPatient);
            if (patientId > 0)
            {
                Treatement aTreatement = new Treatement();
                aTreatement.PatientId = patientId;
                aTreatement.Observation = observetionTextBox.Text;
                aTreatement.Date = dateTextBox.Text;
                aTreatement.DoctorId = Convert.ToInt32(doctorDropDownList.SelectedValue);
                aTreatement.CenterId = centerId;
                int treatementId = aTreatementManager.SaveTreatement(aTreatement);
                if (treatementId > 0)
                {
                    var dieaseNameList = dieseaseName.Value;
                    dieseaseName.Value = "";
                    string[] name = dieaseNameList.Split(',');

                    var mQuantityList = medicineQuantity.Value;
                    medicineQuantity.Value = "";
                    string[] mQuantity = mQuantityList.Split(',');

                    var doseList = doseTxt.Value;
                    doseTxt.Value = "";
                    string[] dose = doseList.Split(',');

                    var mealList = mealTxt.Value;
                    mealTxt.Value = "";
                    string[] meal = mealList.Split(',');

                    var quantityList = quantityTxt.Value;
                    quantityTxt.Value = "";
                    string[] quantity = quantityList.Split(',');

                    var noteList = noteTxt.Value;
                    noteTxt.Value = "";
                    string[] note = noteList.Split(',');

                    for (int i = 0; i < name.Length; i++)
                    {
                        if (name[i] != "")
                        {
                            aTreatement = new Treatement();
                            aTreatement.DieseaseId = aDiseaseManager.GetTheDiesease(name[i]);
                            Medicine aMedicine = aMedicineManager.Find(mQuantity[i]);
                            aTreatement.MedicineId = aMedicine.MedicineId;
                            aTreatement.Dose = dose[i];
                            aTreatement.Quantity = Convert.ToInt32(quantity[i]);
                            aTreatement.Note = note[i];
                            aTreatement.DoseRules = doseTypeRadioButton.Text;
                            aTreatement.ServiceId = treatementId;
                            string savealert = aTreatementManager.SaveFullTreatement(aTreatement);
                            int updateQuantity = aMedicineManager.UpdateMedicineQuantity(aMedicine.MedicineId, centerId, aTreatement.Quantity);
                        }
                    }
                }
            }
              
            
           
        }
        CenterManager aCenterManager = new CenterManager();
        PatientManager aPatientManager = new PatientManager();
        protected void showDetail_Click(object sender, EventArgs e)
        {
            int centerId = Convert.ToInt32(Session["CenterId"]);
            string voterName = "";
            string voterAddress = "";
            string dateOfBirth = "";
            string voterId = voterIdTextBox.Text;
            String xmlURL = "http://nerdcastlebd.com/web_service/voterdb/index.php/voters/voter/"+voterId+"";
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlURL);
            XmlNodeList nodeList = xmlDoc.DocumentElement.SelectNodes("/xml/voter");
            foreach (XmlNode node in nodeList)
            {
                voterName = node.SelectSingleNode("name").InnerText;
                voterAddress = node.SelectSingleNode("address").InnerText;
                dateOfBirth = node.SelectSingleNode("date_of_birth").InnerText;

            }
            nameTextBox.Text = voterName;
            addressTextBox.Text = voterAddress;
            ageTextBox.Text = dateOfBirth;
            int numberOfService = aTreatementManager.NumberOfService(voterId);
            timesOfServiceLabel.Text = numberOfService.ToString();
        }
    }
}