using System.Collections.Generic;
using System.Data;
using FoodAppContracts.Dto;
using FoodAppContracts.Dto.Request;
using FoodAppContracts.Dto.Response;
using InfraContracts.DTO;

namespace FoodAppContracts.Interface
{
    public interface IFoodService
    {
        public Response GetAllCuisines(GetAllCuisinesRequest request);
        public Response GetAllCourses(GetAllCoursesRequest request);
        public Response GetIngredient(GetIngredientRequest request);
        public Response GetCuisineByIngredient(GetCuisineByIngredientRequest request);
        public Response GetFoods(GetFoodsRequest request);
        public FoodDto GetFoodByFoodId(int id);
        public List<string> GetCoursesByFoodId(int id);
        public List<string> GetCuisinesByFoodId(int id);
        public string GetImageByFoodId(int id);
        public List<string> GetIngredientsByFoodId(int id);
    }
}