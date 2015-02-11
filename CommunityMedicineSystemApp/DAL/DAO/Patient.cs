using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO
{
    public class Patient
    {
        public int Id { set; get; }
        public long VoterId { set; get; }
        public int DistrictId { set; get; }
        public int ThanaId { set; get; }
    }
}