using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommunityMedicineApp.BLL;
using CommunityMedicineApp.DAO;

namespace CommunityMedicineApp.WebUI
{
    public partial class DoctorEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CenterId"] == null)
            {
                Response.Redirect("CenterLoginUI.aspx");
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            DoctorManager aDoctorManager=new DoctorManager();
            Doctor aDoctor=new Doctor();
            aDoctor.DoctorCenterId = Convert.ToInt32(Session["CenterId"]);
            aDoctor.Name = nameTextBox.Text;
            aDoctor.Degree = degreeTextBox.Text;
            aDoctor.Specification = specificationTextBox.Text;
            aDoctorManager.Save(aDoctor);
        }
    }
}