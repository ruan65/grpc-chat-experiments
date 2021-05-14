import 'package:chat/src/generated/ping_pont.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class Client {
  late ChatClient stub;

  Future<void> main(List<String> args) async {
    final channel = ClientChannel(
      '127.0.0.1',
      port: 8888,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = ChatClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));

    final responseMessage =
        await stub.sendMessage(Message(id: 777, text: "hello from client"));
    print('message response: $responseMessage');
    await channel.shutdown();
  }
}
