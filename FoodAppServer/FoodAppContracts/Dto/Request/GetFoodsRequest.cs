using System;
using System.Collections.Generic;
using System.Text;

namespace FoodAppContracts.Dto.Request
{
    public class GetFoodsRequest
    {
        public string Cuisine { get; set; }
        public string[] Ingredients { get; set; }
        public string[] WithoutIngredients { get; set; }    
        public string Course { get; set; }
        public float? MaxTime { get; set; }
        public int? Rating { get; set; }
        public int? MaxIngredients { get; set; }
    }
}
