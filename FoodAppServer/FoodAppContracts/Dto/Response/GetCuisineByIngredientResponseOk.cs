namespace FoodAppContracts.Dto.Response
{
    public class GetCuisineByIngredientResponseOk: GetCuisineByIngredientResponse
    {
        public string[] Cuisines { get; set; }
    }
}