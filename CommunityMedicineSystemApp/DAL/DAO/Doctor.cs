using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineApp.DAO
{
    public class Doctor
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Degree { get; set; }
        public string Specification { get; set; }
        public int DoctorCenterId { set; get; }
    }
}