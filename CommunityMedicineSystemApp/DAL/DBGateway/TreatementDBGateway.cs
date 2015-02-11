using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DAO.View;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class TreatementDBGateway:CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        internal int SaveTreatement(Treatement aTreatement)
        {
            string sqlQuery = "INSERT INTO tbl_service_taken VALUES('" + aTreatement.PatientId + "', '" +
                              aTreatement.Observation + "', '" + aTreatement.Date + "', '" + aTreatement.DoctorId + "', "+aTreatement.CenterId+")";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            if (effectedRows > 0)
            {
                aSqlCommand.CommandText = "SELECT MAX(id) AS Id FROM tbl_service_taken";
                aReader = aSqlCommand.ExecuteReader();
                aReader.Read();
                int serviceId = Convert.ToInt32(aReader["Id"]);
                aConnectionManager.CloseConnection();
                return serviceId;
            }
            else
            {
                aConnectionManager.CloseConnection();
                return 0;
            }
        }

        internal string SaveFullTreatement(Treatement aTreatement)
        {
            string sqlQuery = "INSERT INTO tbl_treatments VALUES(" + aTreatement.DieseaseId + ", " +
                              aTreatement.MedicineId + ", '" + aTreatement.Dose + "', '" + aTreatement.Quantity + "', '" +
                              aTreatement.DoseRules + "', '" + aTreatement.Note + "', "+aTreatement.ServiceId + ")";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            if (effectedRows > 0)
            {
                return "Save";
            }
            else
            {
                return "Fail";
            }
        }

        internal int NumberOfService(string voterId)
        {
            string sqlQuery ="SELECT COUNT(*) AS Number FROM tbl_patients " +
                             "JOIN tbl_service_taken ON tbl_patients.id=tbl_service_taken.patient_id " +
                             "WHERE tbl_patients.voter_id = '" +voterId + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                aReader.Read();
                int noOfService = Convert.ToInt32(aReader["Number"]);
                aConnectionManager.CloseConnection();
                return noOfService;
            }
            else
            {
                aConnectionManager.CloseConnection();
                return 0;
            }
            
        }

        internal List<DistrictReportView> GetSummary(int dieseaseID)
        {
            List<DistrictReportView> aDistrictReportList = new List<DistrictReportView>();
            string sqlQuery ="SELECT name, COUNT(id) as total, ((COUNT(id)*100)/population) as percentage FROM view_summary " +
                             "WHERE disease_id = "+dieseaseID+" AND service_date BETWEEN '2014-12-04' AND '2014-12-04' GROUP BY name, population";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                DistrictReportView aReportView = new DistrictReportView();
                aReportView.DistrictName = aReader["name"].ToString();
                aReportView.NumberOfPatient = Convert.ToInt32(aReader["total"]);
                aReportView.PercentageOfTotal = Convert.ToDecimal(aReader["percentage"]);
                aDistrictReportList.Add(aReportView);
            }
            aConnectionManager.CloseConnection();
            return aDistrictReportList;
        }
    }
}