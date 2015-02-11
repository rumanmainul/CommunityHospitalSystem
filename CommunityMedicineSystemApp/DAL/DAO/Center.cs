using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityMedicineSystemApp.DAL.DAO
{
    public class Center
    {
        public int CenterId { set; get; }
        public string CenterName { set; get; }
        public int DistrictId { set; get; }
        public int ThanaId { set; get; }
        public string CenterUserId { set; get; }
        public string CenterPassword { set; get; }
    }
}