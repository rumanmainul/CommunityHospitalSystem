using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class DiseaseDBGateway : CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        internal string AddNewDisease(Disease aDisease)
        {
            string sqlQuery = "INSERT INTO tbl_diseases VALUES('" + aDisease.DiseaseName + "', '" +
                              aDisease.DiseaseDescription + "', '" + aDisease.TreatementProcedure + "', '" +
                              aDisease.PreparedDrugs + "')";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            if (effectedRows > 0)
            {
                return "New diseases added succcesfully";
            }
            else
            {
                return "Falied";
            }
        }

        internal bool HasTheDisease(string diseaseName)
        {
            string sqlQuery = "SELECT * FROM tbl_diseases WHERE LOWER(name)='" + diseaseName.ToLower() + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            bool findDisease = aReader.HasRows;
            aConnectionManager.CloseConnection();
            if (findDisease)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal List<Disease> GetDiseaseList()
        {
            List<Disease> diseasesList = new List<Disease>();
            string sqlQuery = "SELECT * FROM tbl_diseases";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Disease aDisease = new Disease();
                aDisease.DiseaseId = (int)aReader["id"];
                aDisease.DiseaseName = aReader["name"].ToString();
                aDisease.DiseaseDescription = aReader["description"].ToString();
                aDisease.TreatementProcedure = aReader["treatement_procedure"].ToString();
                aDisease.PreparedDrugs = aReader["prefered_medicine"].ToString();
                diseasesList.Add(aDisease);
            }
            aConnectionManager.CloseConnection();
            return diseasesList;
        }

        internal int GetTheDiesease(string diesease)
        {
            string sqlQuery = "SELECT * FROM tbl_diseases WHERE name = '" + diesease + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            aReader.Read();
            Disease aDisease = new Disease();
            aDisease.DiseaseId = (int)aReader["id"];
            aConnectionManager.CloseConnection();
            return aDisease.DiseaseId;
        }
    }
}