using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FoodAppContracts.Dto.Request;
using FoodAppContracts.Interface;
using InfraContracts.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FoodAppServer.Controllers
{
    [ApiController]
    public class MainController : ControllerBase
    {
        private readonly IFoodService _service;
        public MainController(IFoodService service)
        {
            _service = service;
        }

        [Route("api/Main/GetAllCuisines")]
        [HttpPost]
        public Response GetAllCuisines([FromBody] GetAllCuisinesRequest request)
        {
            var ret = _service.GetAllCuisines(request);
            return ret;
        }
        [Route("api/Main/GetAllCourses")]
        [HttpPost]
        public Response GetAllCourses([FromBody] GetAllCoursesRequest request)
        {
            var ret = _service.GetAllCourses(request);
            return ret;
        }


        [Route("api/Main/GetIngredient")]
        [HttpPost]
        public Response GetIngredient([FromBody] GetIngredientRequest request)
        {
            var ret = _service.GetIngredient(request);
            return ret;
        }

        [Route("api/Main/GetCuisineByIngredient")]
        [HttpPost]
        public Response GetCuisineByIngredient([FromBody] GetCuisineByIngredientRequest request)
        {
            var ret = _service.GetCuisineByIngredient(request);
            return ret;
        }
        [Route("api/Main/GetFoods")]
        [HttpPost]
        public Response GetFoods([FromBody] GetFoodsRequest request)
        {
            var ret = _service.GetFoods(request);
            return ret;
        }
    }
}
