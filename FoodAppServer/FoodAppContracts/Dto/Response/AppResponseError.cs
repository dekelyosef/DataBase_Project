namespace FoodAppContracts.Dto.Response
{
    public class AppResponseError : InfraContracts.DTO.Response
    {
        public AppResponseError(string msg)
        {
            Message = msg;
        }

        public string Message { get; }
    }
}