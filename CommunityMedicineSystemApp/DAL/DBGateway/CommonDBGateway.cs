using System.Data.SqlClient;

namespace CommunityMedicineSystemApp.DAL.DBGateway
{
    public class CommonDBGateway
    {
        public SqlCommand aSqlCommand { set; get; }
        public SqlDataReader aReader { set; get; }
    }
}