using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO
{
    public class Medicine
    {
        public int MedicineId { set; get; }
        public string MedicineName { set; get; }
        public string MedicinePower { set; get; }
        public string MedicineProperty { set; get; }
    }
}