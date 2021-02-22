using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections.Specialized;

namespace Database
{
    class Program
    {
        static void Main(string[] args)
        {
            LoadJson load = new LoadJson();
            List<Food> foods = load.ReadJson();
            DBConnect db = new DBConnect();
            db.CreateTables();
            db.Insert(foods);
        }
    }
}