using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database.Data
{
    class Images
    {
        [JsonProperty("hostedMediumUrl")]
        public string Picture { get; set; }
    }
}
