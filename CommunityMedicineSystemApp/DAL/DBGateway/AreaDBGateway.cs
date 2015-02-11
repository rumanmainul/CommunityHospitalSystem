using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class AreaDBGateway:CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        internal List<District> GetAllDistrict()
        {
            List<District> aDistrictList = new List<District>();
            string sqlQuery = "SELECT * FROM tbl_districts ORDER BY id ASC";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                District aDistrict = new District();
                aDistrict.DistrictId = Convert.ToInt32(aReader["id"]);
                aDistrict.DistrictName = aReader["name"].ToString();
                aDistrictList.Add(aDistrict);
            }
            aConnectionManager.CloseConnection();
            return aDistrictList;
        }

        internal List<Thana> GetTheThana(int districtId)
        {
            List<Thana> aThanaList = new List<Thana>();
            string sqlQuery = "SELECT * FROM tbl_thanas WHERE district_id = "+districtId+"";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Thana aThana = new Thana();
                aThana.ThanaId= Convert.ToInt32(aReader["id"]);
                aThana.ThanaName = aReader["name"].ToString();
                aThanaList.Add(aThana);
            }
            aConnectionManager.CloseConnection();
            return aThanaList;
        }
    }
}