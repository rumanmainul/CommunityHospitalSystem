using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineApp.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineApp.DAL
{
   
    public class DoctorDBGateway:CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        public void Save(Doctor aDoctor)
        {
            string sqlQuery = "INSERT INTO tbl_doctors VALUES('" + aDoctor.Name + "','" + aDoctor.Degree + "','" + aDoctor.Specification + "', '" + aDoctor.DoctorCenterId+ "')";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
        }

        internal List<Doctor> GetTheDoctor(int centerId)
        {
            List<Doctor> aDoctorList = new List<Doctor>();
            string sqlQuery = "SELECT * FROM tbl_doctors where center_id = '" + centerId + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Doctor aDoctor = new Doctor();
                aDoctor.Name = aReader["name"].ToString();
                aDoctor.Id = Convert.ToInt32(aReader["id"]);
                aDoctorList.Add(aDoctor);
            }
            return aDoctorList;
        }
    }
}