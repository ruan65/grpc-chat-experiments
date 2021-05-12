import 'package:chat/src/generated/ping_pont.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/src/server/call.dart';

class ChatService extends ChatServiceBase {
  @override
  Future<Message> sendMessage(ServiceCall call, Message request) async {
    return Message()
      ..id = 0
      ..text = 'hello chat';
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server([ChatService()]);
    await server.serve(port: 8888);
    print('The server serves on the port ${server.port} ...');
  }
}
