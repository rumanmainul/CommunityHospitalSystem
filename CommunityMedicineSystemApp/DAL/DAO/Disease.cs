using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO
{
    public class Disease
    {
        public int DiseaseId { set; get; }
        public string DiseaseName { set; get; }
        public string DiseaseDescription { set; get; }
        public string TreatementProcedure { set; get; }
        public string PreparedDrugs { set; get; }
    }
}