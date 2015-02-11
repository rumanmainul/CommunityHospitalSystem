using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CommunityMedicineSystemApp.DAL.DAO;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class CenterDBGateway : CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();

        internal List<Center> GetTheCenter(string thanaId)
        {
            List<Center> aCenterList = new List<Center>();
            string sqlQury = "SELECT * FROM tbl_centers WHERE thana_id = '" + thanaId + "'";
            aSqlCommand = new SqlCommand(sqlQury, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Center aCenter = new Center();
                aCenter.CenterId = Convert.ToInt32(aReader["id"]);
                aCenter.CenterName = aReader["name"].ToString();
                aCenterList.Add(aCenter);
            }
            return aCenterList;
        }

        internal bool CreateNewCenter(Center aCenter)
        {
            string sqlQuery = "INSERT INTO tbl_centers VALUES('" + aCenter.CenterName + "', " + aCenter.DistrictId +
                              ", " + aCenter.ThanaId + ", '" + aCenter.CenterUserId + "', '" + aCenter.CenterPassword + "')";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            if (effectedRows > 0)
            {

                return true;
            }
            else
            {
                return false;
            }
        }

        internal bool HasCenter(Center aCenter)
        {
            string sqlQuery = "SELECT * FROM tbl_centers WHERE LOWER(name)='" + aCenter.CenterName.ToLower() +
                              "' AND LOWER(code)='" + aCenter.CenterUserId.ToLower() + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        internal Center FindCodePswrd(Center aCenterLogin)
        {

            string query = "SELECT id, code, password FROM tbl_centers WHERE code='" + aCenterLogin.CenterUserId + "'AND password='" + aCenterLogin.CenterPassword + "'";

            aSqlCommand = new SqlCommand(query, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            if (aReader.HasRows)
            {
                Center aCenter = new Center();
                while (aReader.Read())
                {
                    aCenter.CenterId = Convert.ToInt32(aReader["id"]);
                    aCenter.CenterUserId = aReader["code"].ToString();
                    aCenter.CenterPassword = aReader["password"].ToString();
                }
                aConnectionManager.CloseConnection();
                return aCenter;
            }
            aConnectionManager.CloseConnection();
            return null;

        }
        internal Center GetInformation(int centerId)
        {
            string sqlQuery = "SELECT district_id, thana_id FROM tbl_centers WHERE id='" + centerId + "'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            aReader.Read();
            Center aCenter = new Center();
            aCenter.DistrictId = Convert.ToInt32(aReader["district_id"]);
            aCenter.ThanaId = Convert.ToInt32(aReader["thana_id"]);
            aConnectionManager.CloseConnection();
            return aCenter;
        }

    }
}