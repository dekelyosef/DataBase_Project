using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Database
{
    class DBConnect
    {
        private MySqlConnection connection;
        private string server;
        private string database;
        private string uid;
        private string password;


        //Constructor
        public DBConnect()
        {
            Initialize();
        }


        //Initialize values
        private void Initialize()
        {
            server = ConfigurationManager.AppSettings["server"].ToString();
            database = ConfigurationManager.AppSettings["database"].ToString();
            uid = ConfigurationManager.AppSettings["uid"].ToString();
            password = ConfigurationManager.AppSettings["password"].ToString();
            string connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

            connection = new MySqlConnection(connectionString);
        }


        //open connection to database
        private bool OpenConnection()
        {
            try
            {
                connection.Open();
                Console.WriteLine("connect");
                return true;
            }
            catch (MySqlException ex)
            {
                switch (ex.Number)
                {
                    // cannot connect to server
                    case 0:
                        Console.WriteLine("Cannot connect to server.  Contact administrator");
                        //MessageBox.Show("Cannot connect to server.  Contact administrator");
                        break;

                    // invalid user name and/or password
                    case 1045:
                        Console.WriteLine("Invalid username/password, please try again");
                        //MessageBox.Show("Invalid username/password, please try again");
                        break;
                }
                return false;
            }
        }


        //Close connection
        public void CloseConnection()
        {
            try
            {
                connection.Close();
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }


        public void CreateTables()
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                //create command
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;

                // create scheme
                cmd.CommandText = "CREATE DATABASE IF NOT EXISTS team11";
                cmd.ExecuteNonQuery();

                // create food table
                cmd.CommandText =
                    @"CREATE TABLE IF NOT EXISTS food (
                        food_id int NOT NULL,
                        name varchar(100) NOT NULL,
                        total_time float DEFAULT NULL,
                        rating int DEFAULT NULL,
                        recipe varchar(200) DEFAULT NULL,
                        PRIMARY KEY (food_id),
                        UNIQUE KEY food_id_UNIQUE (food_id))";
                cmd.ExecuteNonQuery();

                // create courses table
                cmd.CommandText =
                    @"CREATE TABLE IF NOT EXISTS courses (
                        food_id int NOT NULL,
                        course varchar(45) NOT NULL,
                        PRIMARY KEY (food_id,course),
                        CONSTRAINT courses_food FOREIGN KEY (food_id) REFERENCES food (food_id))";
                cmd.ExecuteNonQuery();

                // create cuisines table
                cmd.CommandText =
                    @"CREATE TABLE IF NOT EXISTS cuisines (
                        food_id int NOT NULL,
                        cuisine varchar(45) NOT NULL,
                        PRIMARY KEY (food_id,cuisine),
                        CONSTRAINT cuisines_food FOREIGN KEY (food_id) REFERENCES food (food_id))";
                cmd.ExecuteNonQuery();

                // create ingredients table
                cmd.CommandText =
                    @"CREATE TABLE IF NOT EXISTS ingredients (
                        food_id int NOT NULL,
                        ingredient varchar(200) NOT NULL,
                        PRIMARY KEY (food_id,ingredient),
                        CONSTRAINT ingredients_food FOREIGN KEY (food_id) REFERENCES food (food_id))";
                cmd.ExecuteNonQuery();

                // create images table
                cmd.CommandText =
                    @"CREATE TABLE IF NOT EXISTS images (
                        food_id int NOT NULL,
                        image varchar(200) DEFAULT NULL,
                        PRIMARY KEY (food_id),
                        CONSTRAINT images_food FOREIGN KEY (food_id) REFERENCES food (food_id))";
                cmd.ExecuteNonQuery();

                //close connection
                this.CloseConnection();
            }
        }


        //Insert statement
        public void Insert(List<Food> foods)
        {
            // insert to food table
            InsertIntoFood(foods);

            // insert to courses table
            InsertIntoCourses(foods);

            // insert to cuisines table
            InsertIntoCuisines(foods);

            // insert to ingredients table
            InsertIntoIng(foods);

            // insert to images table
            InsertIntoImage(foods);
        }


        public void InsertIntoFood(List<Food> foods)
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                string query = "INSERT IGNORE INTO food (food_id, name, total_time ,rating , recipe) VALUES(@food_id, @name, @total_time ,@rating ,@recipe)";
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, connection);
                foreach (Food food in foods)
                {
                    cmd.Parameters.AddWithValue("@food_id", food.Id);
                    cmd.Parameters.AddWithValue("@name", food.Name);
                    cmd.Parameters.AddWithValue("@total_time", ParseTotalTime(food.TotalTime));
                    cmd.Parameters.AddWithValue("@rating", food.Rating);
                    cmd.Parameters.AddWithValue("@recipe", food.Attribution.Recipe);

                    //Execute command
                    cmd.ExecuteNonQuery();

                    // clear
                    cmd.Parameters.Clear();
                }
                //close connection
                this.CloseConnection();
            }
        }


        public void InsertIntoCourses(List<Food> foods)
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                string query = "INSERT IGNORE INTO courses (food_id, course) VALUES(@food_id, @course)";
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, connection);
                foreach (Food food in foods)
                {
                    foreach (string course in food.Attributes.Course)
                    {
                        cmd.Parameters.AddWithValue("@food_id", food.Id);
                        cmd.Parameters.AddWithValue("@course", course);

                        //Execute command
                        cmd.ExecuteNonQuery();

                        // clear
                        cmd.Parameters.Clear();
                    }
                
                }
                //close connection
                this.CloseConnection();
            }
        }


        public void InsertIntoCuisines(List<Food> foods)
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                string query = "INSERT IGNORE INTO cuisines (food_id, cuisine) VALUES(@food_id, @cuisine)";
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, connection);
                foreach (Food food in foods)
                {
                    foreach (string cuisine in food.Attributes.Cuisine)
                    {
                        cmd.Parameters.AddWithValue("@food_id", food.Id);
                        cmd.Parameters.AddWithValue("@cuisine", cuisine);

                        //Execute command
                        cmd.ExecuteNonQuery();

                        // clear
                        cmd.Parameters.Clear();
                    }

                }
                //close connection
                this.CloseConnection();
            }
        }


        public void InsertIntoIng(List<Food> foods)
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                string query = "INSERT IGNORE INTO ingredients (food_id, ingredient) VALUES(@food_id, @ingredient)";
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, connection);
                foreach (Food food in foods)
                {
                    foreach (string ingredient in food.Ingredients)
                    {
                        cmd.Parameters.AddWithValue("@food_id", food.Id);
                        cmd.Parameters.AddWithValue("@ingredient", ingredient);

                        //Execute command
                        cmd.ExecuteNonQuery();

                        // clear
                        cmd.Parameters.Clear();
                    }

                }
                //close connection
                this.CloseConnection();
            }
        }


        public void InsertIntoImage(List<Food> foods)
        {
            //open connection
            if (this.OpenConnection() == true)
            {
                string query = "INSERT IGNORE INTO images (food_id, image) VALUES(@food_id, @image)";
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, connection);
                foreach (Food food in foods)
                {
                    cmd.Parameters.AddWithValue("@food_id", food.Id);
                    cmd.Parameters.AddWithValue("@image", food.Image[0].Picture);

                    //Execute command
                    cmd.ExecuteNonQuery();

                    // clear
                    cmd.Parameters.Clear();
                }
                //close connection
                this.CloseConnection();
            }
        }


        public float ParseTotalTime(string time)
        {
            if (time == null || time.ToLower().Equals("null") || time.Equals(""))
            {
                return -2;
            }
            time.Trim(',');
            string[] list = time.Split(' ');
            if (list.Length == 1)
            {
                return (int)float.Parse(list[0]);
            }
            if (list.Length == 2)
            {
                if (list[1].ToLower().Contains("h"))
                {
                    return float.Parse(list[0]) * 60;
                }
                else
                {
                    return float.Parse(list[0]);
                }
            }
            if (list.Length == 3)
            {
                Console.WriteLine(time);
            }
            if (list.Length == 4)
            {
                if (list[1].ToLower().Contains("h"))
                {
                    return float.Parse(list[0]) * 60 + int.Parse(list[2]);
                }
                return float.Parse(list[0]) + int.Parse(list[2]) * 60;
            }
            return -2;
        }
    }
}