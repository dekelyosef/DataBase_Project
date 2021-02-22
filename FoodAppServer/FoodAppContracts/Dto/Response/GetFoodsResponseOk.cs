using System;
using System.Collections.Generic;
using System.Text;

namespace FoodAppContracts.Dto.Response
{
    public class GetFoodsResponseOk: GetFoodsResponse
    {
        public FoodDto[] Foods { get; set; }
    }
}
