using Database.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.ExceptionServices;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace Database
{
    class LoadJson
    {
        private List<string> files = new List<string>();
        private List<Food> foods = new List<Food>();
        
        public LoadJson() { }

        public void ReadText()
        {
            String line;
            try
            {
                // Pass the file path and file name to the StreamReader constructor
                StreamReader reader = new StreamReader(ConfigurationManager.AppSettings["jsonsNames"].ToString());
                // Read the first line of text
                line = reader.ReadLine();
                // Continue to read until you reach end of file
                while (line != null)
                {
                    files.Add(line.Split('\t')[1]);
                    // Read the next line
                    line = reader.ReadLine();
                }
                //close the file
                reader.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
        }

        public List<Food> ReadJson()
        {
            ReadText();

            foreach (string file in files)
            {
                // deserialize JSON directly from a file
                string path = ConfigurationManager.AppSettings["jsonsDir"].ToString();
                using (StreamReader json = File.OpenText(path + file + ".json"))
                {
                    JsonSerializer serializer = new JsonSerializer();
                    Food food = (Food)serializer.Deserialize(json, typeof(Food));
                    if (int.TryParse(file, out var value))
                    {
                        food.Id = value;
                    }
                    foods.Add(food);
                }
            }
            return foods;
        }

    }
}
