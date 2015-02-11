using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DAO.View;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.BLL
{
    public class TreatementManager
    {
        TreatementDBGateway aTreatementDbGateway = new TreatementDBGateway();
        internal int SaveTreatement(Treatement aTreatement)
        {
            return aTreatementDbGateway.SaveTreatement(aTreatement);
        }

        internal string SaveFullTreatement(Treatement aTreatement)
        {
            return aTreatementDbGateway.SaveFullTreatement(aTreatement);
        }

        internal int NumberOfService(string voterId)
        {
            return aTreatementDbGateway.NumberOfService(voterId);
        }

        internal List<DistrictReportView> GetSummary(int dieseaseID)
        {
            return aTreatementDbGateway.GetSummary(dieseaseID);
        }
    }
}