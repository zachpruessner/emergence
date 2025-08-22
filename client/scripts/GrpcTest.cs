using Godot;
using Grpc.Net.Client;
using Packets;

public partial class GrpcTest : Node
{
	public override async void _Ready()
	{
		var channel = GrpcChannel.ForAddress("http://127.0.0.1:50051");
		var client = new GameService.GameServiceClient(channel);

		var loginReply = await client.LoginAsync(new LoginRequest { Username = "Zach", Password = "pw" });
		GD.Print("Login response: " + loginReply.Message);

		var echoReply = await client.EchoAsync(new EchoRequest { Text = "Hello" });
		GD.Print("Echo response: " + echoReply.Text);
	}


}
