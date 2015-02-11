using System.Collections.Generic;
using CommunityMedicineApp.DAO;
using CommunityMedicineSystemApp.DAL.DAO;
using CommunityMedicineSystemApp.DAL.DBGateway;

namespace CommunityMedicineSystemApp.UI
{
    internal class MedicineManager
    {
        MedicineDBGateway aMedicineDbGateway = new MedicineDBGateway();
        internal string SaveMedicineToDb(Medicine aMedicine)
        {
            if (HasMedicine(aMedicine))
            {
                return "The Medicine already Added";
            }
            else
            {
                return aMedicineDbGateway.SaveMedicineToDb(aMedicine);
            }
        }

        private bool HasMedicine(Medicine aMedicine)
        {
            return aMedicineDbGateway.HasMedicine(aMedicine);
        }

        internal List<Medicine> GetAllMedicine()
        {
            return aMedicineDbGateway.GetAllMedicine();
        }

        internal Medicine Find(string medicineId)
        {
            return aMedicineDbGateway.Find(medicineId);
        }

        internal int SendMedicineToCenter(MedicineStockInCenter aMedicineStockInCenter)
        {
           return aMedicineDbGateway.SendMedicineToCenter(aMedicineStockInCenter);
        }

        internal List<MedicineView> GetMedicine(int center_id)
        {
            return aMedicineDbGateway.GetMedicine(center_id);
        }

        internal List<Medicine> GetMedicineByCenter(int centerId)
        {
            return aMedicineDbGateway.GetMedicineByCenter(centerId);
        }

        internal int UpdateMedicineQuantity(int medicineId, int centerId, int quantity)
        {
            return aMedicineDbGateway.UpdateMedicineQuantity(medicineId, centerId, quantity);
        }
    }
}