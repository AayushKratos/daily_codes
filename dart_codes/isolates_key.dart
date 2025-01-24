import 'dart:isolate';

void isolateEntry(SendPort sendPort) {
  sendPort.send('Hello from isolate!');
}

void main() async {
  ReceivePort receivePort = ReceivePort();

  await Isolate.spawn(isolateEntry, receivePort.sendPort);

  await for (var message in receivePort) {
    print(message);
    break;
  }
}
