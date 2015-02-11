using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.BLL
{
  
    public class PatientManager
    {
        PatientDBGateway aGateway=new PatientDBGateway();
        public int AddPatient(Patient aPatient)
        {
             return aGateway.AddNewPatient(aPatient);
        }
    }
}