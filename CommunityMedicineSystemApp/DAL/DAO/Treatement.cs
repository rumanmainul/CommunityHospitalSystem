using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO
{
    public class Treatement
    {
        public int Id { set; get; }
        public int PatientId { set; get; }
        public string Observation { set; get; }
        public string Date { set; get; }
        public int DoctorId { set; get; }
        public int DieseaseId { set; get; }
        public int MedicineId { set; get; }
        public string Dose { set; get; }
        public int Quantity { set; get; }
        public string Note { set; get; }
        public string DoseRules { set; get; }
        public int CenterId { set; get; }
        public int ServiceId { set; get; }
    }
}