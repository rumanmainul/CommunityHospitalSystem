using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO.View
{
    public class DistrictReportView
    {
        public string DistrictName { set; get; }
        public int NumberOfPatient { set; get; }
        public Decimal PercentageOfTotal { set; get; }
    }
}