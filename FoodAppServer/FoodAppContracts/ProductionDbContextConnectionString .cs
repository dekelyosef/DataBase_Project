using System;
using FoodAppContracts.Interface;

namespace FoodAppContracts
{
    public class ProductionDbContextConnectionString : IConnectionString
    {
        public ProductionDbContextConnectionString()
        {
            ConnectionString =
                "SERVER=localhost; DATABASE=project; UID=root; PASSWORD=1234;";
        }
        public ProductionDbContextConnectionString(string connectionString)
        {
            ConnectionString = connectionString;
        }
        public string ConnectionString { get; }
    }
}
