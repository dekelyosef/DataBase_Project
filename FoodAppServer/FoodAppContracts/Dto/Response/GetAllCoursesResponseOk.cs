using System;
using System.Collections.Generic;
using System.Text;

namespace FoodAppContracts.Dto.Response
{
    public class GetAllCoursesResponseOk: GetAllCoursesResponse
    {
        public string[] Courses { get; set; }
    }
}
