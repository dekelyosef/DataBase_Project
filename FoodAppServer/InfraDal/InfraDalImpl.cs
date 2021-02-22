using InfraContracts.Interfaces;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using MySql.Data.MySqlClient;

namespace InfraDal
{
    public class InfraDalImpl: IInfraDal
    {
        public DataSet ExecSpQuery(MySqlCommand cmd)
        {
            var retval = new DataSet();
            var outParam = new MySqlParameter();
            cmd.CommandType = CommandType.StoredProcedure;
            outParam.ParameterName = "p_RETVAL";
            //outParam.MySqlDbType = MySqlDbType.RefCursor;
            outParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(outParam);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(retval);
            return retval;
        }

        public MySqlParameter GetParameter(string paramName, MySqlDbType paramType
            , object paramValue)
        {
           return new MySqlParameter
            {
                ParameterName = paramName,
                MySqlDbType = paramType,
                Value = paramValue
            };
        }

    }
}
