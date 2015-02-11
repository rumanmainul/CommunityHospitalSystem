using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class PatientDBGateway:CommonDBGateway 
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        public int AddNewPatient(Patient aPatient)
        {
            string sqlQuery = "INSERT INTO tbl_patients VALUES('"
            +aPatient.VoterId + "','" + aPatient.DistrictId + "','" + aPatient.ThanaId + "')";        
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            if (effectedRows > 0)
            {
                aSqlCommand.CommandText = "SELECT MAX(id) AS Id FROM tbl_patients";
                aReader = aSqlCommand.ExecuteReader();
                aReader.Read();
                int patientId = Convert.ToInt32(aReader["Id"]);
                aConnectionManager.CloseConnection();
                return patientId;
            }
            else
            {
                return 0;
            }
        }
    }
}