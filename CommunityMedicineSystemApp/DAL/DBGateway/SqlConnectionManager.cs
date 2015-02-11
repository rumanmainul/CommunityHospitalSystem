using System.Configuration;
using System.Data.SqlClient;

namespace EmployeeInfirmationApp.DAL.DBGateway
{
    public class SqlConnectionManager
    {
        private SqlConnection aSqlConnection;

        public SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ComunityMedicineDB"].ConnectionString;
            aSqlConnection = new SqlConnection(connectionString);
            aSqlConnection.Open();
            return aSqlConnection;
        }

        public void CloseConnection()
        {
            if (aSqlConnection != null)
            {
                aSqlConnection.Close();
            }
        }
    }
}
