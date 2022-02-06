import 'package:grpc/grpc.dart';
import 'package:planted/proto/planted.pbgrpc.dart';

class ClientService {
  Meat meat = Meat();
  static BroadcastClient client =
      BroadcastClient(ClientChannel("10.0.2.2", port: 50051));

  ClientService(String body) {
    meat
      ..clearMeat()
      ..meat = body;

    client = BroadcastClient(
      ClientChannel(
        "10.0.2.2",
        port: 50051,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  Future<String> sendMessage(String body) async {
    var message = await client.getSlogan(
      Meat()..meat = body,
    );

    return message.slogan;
  }
}
