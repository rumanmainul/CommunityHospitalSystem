using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.BLL
{
    public class DiseaseManager
    {
        DiseaseDBGateway aDiseaseDbGateway = new DiseaseDBGateway();
        internal string AddNewDisease(Disease aDisease)
        {
            if (HasTheDisease(aDisease.DiseaseName))
            {
                return "The Disease already added";
            }
            else
            {
                return aDiseaseDbGateway.AddNewDisease(aDisease);
            }
        }

        private bool HasTheDisease(string diseaseName)
        {
            return aDiseaseDbGateway.HasTheDisease(diseaseName);
        }

        internal List<Disease> GetAllDisease()
        {
            return aDiseaseDbGateway.GetDiseaseList();
        }

        internal int GetTheDiesease(string diesease)
        {
            return aDiseaseDbGateway.GetTheDiesease(diesease);
        }
    }
}