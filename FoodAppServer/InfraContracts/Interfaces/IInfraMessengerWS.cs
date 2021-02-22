using System.Net.WebSockets;
using System.Runtime.InteropServices.ComTypes;
using System.Threading.Tasks;

namespace InfraContracts.Interfaces
{
    public interface IInfraMessengerWS
    {
        public Task AddConnection(string id, WebSocket socket);

        public Task RemoveConnection(string id);
        public Task Send(string msg, params WebSocket[] socketsToSendTo);

        public Task SendAll(string msg);

        public WebSocket GetConnectionSocket(string id);

        public string GetConnectionId(WebSocket socket);

    }
}