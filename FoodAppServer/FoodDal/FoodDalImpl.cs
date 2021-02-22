using System;
using System.Data;
using DIContracts;
using FoodAppContracts.Dto.Request;
using FoodAppContracts.Interface;
using InfraContracts.Interfaces;
using MySql.Data.MySqlClient;
using Oracle.ManagedDataAccess.Client;

namespace FoodDal
{
    [Register(Policy.Transient, typeof(IFoodDal))]
    public class FoodDalImpl : IFoodDal
    {
        private readonly MySqlConnection _conn;
        private readonly IInfraDal _infraDal;

        public FoodDalImpl(IInfraDal infraDal, IConnectionString connectionString)
        {
            _infraDal = infraDal;
            var strConn = connectionString.ConnectionString;
            _conn = new MySqlConnection(strConn);
        }

        public DataSet GetAllCourses(GetAllCoursesRequest request)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getAllCourses"
            };
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetAllCuisines(GetAllCuisinesRequest request)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getAllCuisines"
            };
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetCoursesByFoodId(int id)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getCoursesByFoodId"
            };
            var param = _infraDal.GetParameter("p_id", MySqlDbType.Int32, id);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetCuisineByIngredient(GetCuisineByIngredientRequest request)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getCuisineByIngredient"
            };
            var param = _infraDal.GetParameter("p_ingredient", MySqlDbType.VarChar, request.Ingredient);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetCuisinesByFoodId(int id)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getCuisinesByFoodId"
            };
            var param = _infraDal.GetParameter("p_id", MySqlDbType.Int32, id);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetFoodByFoodId(int id)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getFoodByFoodId"
            };
            var param = _infraDal.GetParameter("p_id", MySqlDbType.Int32, id);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetFoods(string cuisine, string ingredients, string withOutIngredients, string course,
            double? maxTime, int? rating, int? maxIngredients)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getFoods"
            };
            
            var param1 = _infraDal.GetParameter("p_cuisine", MySqlDbType.VarChar, cuisine);
            var param2 = _infraDal.GetParameter("p_ingredients", MySqlDbType.VarChar, ingredients);
            var param3 = _infraDal.GetParameter("p_without_ingredients", MySqlDbType.VarChar, withOutIngredients);
            var param4 = _infraDal.GetParameter("p_course", MySqlDbType.VarChar, course == "" ? null : course);
            var param5 = _infraDal.GetParameter("p_max_ingredients", MySqlDbType.Int32, maxIngredients == -1 ? null : maxIngredients);
            var param6 = _infraDal.GetParameter("p_time", MySqlDbType.Float, maxTime == -1 ? null : maxTime);
            var param7 = _infraDal.GetParameter("p_rating", MySqlDbType.Int32, rating == -1 ? null : rating);
            cmd.Parameters.Add(param1);
            cmd.Parameters.Add(param2);
            cmd.Parameters.Add(param3);
            cmd.Parameters.Add(param4);
            cmd.Parameters.Add(param5);
            cmd.Parameters.Add(param6);
            cmd.Parameters.Add(param7);
            return _infraDal.ExecSpQuery(cmd);
        }
        public DataSet GetImageByFoodId(int id)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getImageByFoodId"
            };
            var param = _infraDal.GetParameter("p_id", MySqlDbType.Int32, id);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetIngredient(GetIngredientRequest request)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getIngredient"
            };
            var param = _infraDal.GetParameter("p_ingredient", MySqlDbType.VarChar, request.Ingredient);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }

        public DataSet GetIngredientsByFoodId(int id)
        {
            var cmd = new MySqlCommand
            {
                Connection = _conn,
                CommandText = "getIngredientsByFoodId"
            };
            var param = _infraDal.GetParameter("p_id", MySqlDbType.Int32, id);
            cmd.Parameters.Add(param);
            return _infraDal.ExecSpQuery(cmd);
        }
    }
}
