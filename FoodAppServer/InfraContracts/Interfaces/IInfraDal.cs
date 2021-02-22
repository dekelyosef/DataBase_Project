using MySql.Data.MySqlClient;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace InfraContracts.Interfaces
{
    public interface IInfraDal
    {
        public MySqlParameter GetParameter(string paramName, MySqlDbType paramType
            , object paramValue);

        public DataSet ExecSpQuery(MySqlCommand cmd);
    }
}
