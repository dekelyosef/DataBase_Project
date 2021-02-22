using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.Web;
using Database.Data;

namespace Database
{
    class Food
    {
        [Newtonsoft.Json.JsonIgnore]
        public int Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("totalTime")]
        public string TotalTime { get; set; }

        [JsonProperty("rating")]
        public int Rating { get; set; }

        [JsonProperty("ingredientLines")]
        public List<string> Ingredients { get; set; }

        [JsonProperty("attributes")]
        public Attributes Attributes { get; set; }

        [JsonProperty("attribution")]
        public Attribution Attribution { get; set; }

        [JsonProperty("images")]
        public List<Images> Image { get; set; }

    }
}