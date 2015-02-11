using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.BLL
{
    public class AreaManager
    {
        AreaDBGateway areaDbGateway = new AreaDBGateway();
        internal List<District> GetAllDistrict()
        {
            return areaDbGateway.GetAllDistrict();
        }

        internal List<Thana> GetTheThana(int districtId)
        {
            return areaDbGateway.GetTheThana(districtId);
        }
    }
}