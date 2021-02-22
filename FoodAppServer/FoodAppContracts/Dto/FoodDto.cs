using System;
using System.Collections.Generic;
using System.Text;

namespace FoodAppContracts.Dto
{
    public class FoodDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string[] Courses { get; set; }
        public string[] Cuisines { get; set; }
        public string[] Ingredients { get; set; }
        public string ImageUrl { get; set; }
        public double TotalTime { get; set; }
        public string RecipeUrl { get; set; }
        public int Rating { get; set; }
    }
}
