using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using CommunityMedicineApp.DAO;
using CommunityMedicineSystemApp.DAL.DAO;
using EmployeeInfirmationApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class MedicineDBGateway:CommonDBGateway
    {
        SqlConnectionManager aConnectionManager = new SqlConnectionManager();
        internal string SaveMedicineToDb(Medicine aMedicine)
        {
            string sqlQuery = "INSERT INTO tbl_medicines VALUES('" + aMedicine.MedicineName + "', '" +
                              aMedicine.MedicinePower + "')";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedRows = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            if (effectedRows > 0)
            {
                return "Medicine Add SuccesFully";
            }
            else
            {
                return "fail";
            }
        }

        internal bool HasMedicine(Medicine aMedicine)
        {
            string sqlQuery = "SELECT * FROM tbl_medicines WHERE LOWER(name) = '" + aMedicine.MedicineName.ToLower() + "' AND mg_mL = '" + aMedicine.MedicinePower + "'";
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

        internal List<Medicine> GetAllMedicine()
        {
            List<Medicine> aMedicineList = new List<Medicine>();
            string sqlQuery = "SELECT * FROM tbl_medicines";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Medicine aMedicine = new Medicine();
                aMedicine.MedicinePower = aReader["mg_mL"].ToString();
                aMedicine.MedicineName = aReader["name"].ToString();
                aMedicine.MedicineProperty = aMedicine.MedicineName + "-" + aMedicine.MedicinePower;
                aMedicineList.Add(aMedicine);
            }
            aConnectionManager.CloseConnection();
            return aMedicineList;
        }

        internal Medicine Find(string medicinename)
        {
            string sqlQuery = "SELECT * FROM tbl_medicines WHERE name= '"+medicinename+"'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            aReader.Read();
            Medicine aMedicine = new Medicine();
            aMedicine.MedicineId = Convert.ToInt32(aReader["id"]);
            aConnectionManager.CloseConnection();
            return aMedicine;
        }

        internal int SendMedicineToCenter(MedicineStockInCenter aMedicineStockInCenter)
        {
            string sqlQuery = "INSERT INTO tbl_medicines_of_centers VALUES("+aMedicineStockInCenter.CenterId+", "+aMedicineStockInCenter.MedicineId+", "+aMedicineStockInCenter.Quantity+")";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effectedrow = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            return effectedrow;
        }

        internal List<MedicineView> GetMedicine(int center_id)
        {
            string query = "select tbl_medicines.name MedicineName,tbl_medicines_of_centers.quantity PresentStock from tbl_medicines join tbl_medicines_of_centers on tbl_medicines.id=tbl_medicines_of_centers.medicine_id  where tbl_medicines_of_centers.center_id='" + center_id + "'";
            List<MedicineView> medicinesList = new List<MedicineView>();
            aSqlCommand = new SqlCommand(query, aConnectionManager.GetConnection());
            SqlDataReader aSqlDataReader = aSqlCommand.ExecuteReader();

            while (aSqlDataReader.Read())
            {
                MedicineView aMedicineView = new MedicineView();
                aMedicineView.MedicineName = aSqlDataReader["MedicineName"].ToString();
                aMedicineView.PresentStock = (int)aSqlDataReader["PresentStock"];
                medicinesList.Add(aMedicineView);
            }
            aConnectionManager.CloseConnection();
            return medicinesList;
        }

        internal List<Medicine> GetMedicineByCenter(int centerId)
        {
            List<Medicine> aMedicineList = new List<Medicine>();
            string sqlQuery = "select M.id, M.name, M.mg_ML from " +
                              "tbl_medicines_of_centers MC Join tbl_medicines M on MC.medicine_id = M.id " +
                              "WHERE MC.center_id = '"+centerId+"'";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            aReader = aSqlCommand.ExecuteReader();
            while (aReader.Read())
            {
                Medicine aMedicine = new Medicine();
                aMedicine.MedicinePower = aReader["mg_mL"].ToString();
                aMedicine.MedicineName = aReader["name"].ToString();
                aMedicine.MedicineProperty = aMedicine.MedicineName + "-" + aMedicine.MedicinePower;
                aMedicineList.Add(aMedicine);
            }
            aConnectionManager.CloseConnection();
            return aMedicineList;
        }

        internal int UpdateMedicineQuantity(int medicineId, int centerId, int quantity)
        {
            string sqlQuery = "UPDATE tbl_medicines_of_centers SET quantity-=" + quantity + " WHERE medicine_id=" +
                              medicineId + " AND center_id=" + centerId + "";
            aSqlCommand = new SqlCommand(sqlQuery, aConnectionManager.GetConnection());
            int effected = aSqlCommand.ExecuteNonQuery();
            aConnectionManager.CloseConnection();
            return effected;
        }
    }
}