using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.BLL
{
    
    public class CenterManager
    {
        CenterDBGateway aCenterDbGateway = new CenterDBGateway();

        internal List<Center> GetTheCenter(string thanaId)
        {
            return aCenterDbGateway.GetTheCenter(thanaId);
        }

        internal string CreateNewCenter(Center aCenter)
        {
            if (HasCenter(aCenter))
            {
                return "Center Already Added";
            }
            else
            {
              bool isSaved= aCenterDbGateway.CreateNewCenter(aCenter);
                if (isSaved != false)
                {
                    return "Center Name Is:" + aCenter.CenterName + ", Center Username is: " + aCenter.CenterUserId +
                           " and Center password is:" + aCenter.CenterPassword;
                }
                else
                {
                    return "Falied";
                }
            }
        }

        private bool HasCenter(Center aCenter)
        {
           return aCenterDbGateway.HasCenter(aCenter);
        }

        internal Center FindCodePswrd(Center aCenterLogin)
        {
            return aCenterDbGateway.FindCodePswrd(aCenterLogin);
        }
        internal Center GetInformation(int centerId)
        {
            return aCenterDbGateway.GetInformation(centerId);
        }
    }
}