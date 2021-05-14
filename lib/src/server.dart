import 'package:chat/src/generated/ping_pont.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/src/server/call.dart';

class ChatService extends ChatServiceBase {
  @override
  Future<Message> sendMessage(ServiceCall call, Message request) async {
    print('got request: ${request.id}');
    return Message()
      ..id = 0
      ..text = 'got your message: ${request.text}';
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server([ChatService()]);
    await server.serve(port: 8888);
    print('The server serves on the port ${server.port} ...');
  }
}
