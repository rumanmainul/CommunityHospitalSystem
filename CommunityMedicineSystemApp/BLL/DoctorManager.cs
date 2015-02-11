using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineApp.DAL;
using CommunityMedicineApp.DAO;

namespace CommunityMedicineApp.BLL
{
    public class DoctorManager
    {
        DoctorDBGateway aDoctorDbGateway = new DoctorDBGateway();
        public string Save(Doctor aDoctor)
        {
          aDoctorDbGateway.Save(aDoctor);
          return "Doctor data has been saved successfully";
        }

        internal List<Doctor> GetTheDoctor(int centerId)
        {
            return aDoctorDbGateway.GetTheDoctor(centerId);
        }
    }
}