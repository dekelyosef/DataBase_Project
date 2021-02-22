using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database.Data
{
    class Attributes
    {
        [JsonProperty("cuisine")]
        public List<string> Cuisine { get; set; }

        [JsonProperty("course")]
        public List<string> Course { get; set; }
    }
}
