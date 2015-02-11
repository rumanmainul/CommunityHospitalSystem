using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineApp.DAO
{
    public class MedicineView
    {
        public int Id { get; set; }
        public string MedicineName { get; set; }
        public int PresentStock { get; set; }
    }
}