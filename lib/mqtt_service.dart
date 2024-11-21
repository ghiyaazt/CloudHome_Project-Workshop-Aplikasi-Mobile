import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final String broker = '178.128.89.8'; // Ganti dengan IP publik broker MQTT Anda
  final int port = 1883; // Pastikan port 1883 terbuka pada broker
  final String clientId = 'flutter_client'; // Ganti sesuai kebutuhan
  final String topic = 'cloudhome/clothesline'; // Ganti sesuai topik Anda

  late MqttServerClient client;
  late MqttConnectionState connectionState;

  MqttService() {
    client = MqttServerClient(broker, clientId);
    client.port = port;
    client.logging(on: false);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    connectionState = MqttConnectionState.disconnected;
  }

  Future<void> connect() async {
    try {
      final connMessage = MqttConnectMessage()
          .withClientIdentifier(clientId)
          .withWillTopic('willtopic') // Opsional, tambahkan jika diperlukan
          .withWillMessage('Client disconnected unexpectedly')
          .startClean() // Menghapus sesi sebelumnya
          .withWillQos(MqttQos.atLeastOnce);

      client.connectionMessage = connMessage;

      await client.connect();
    } on Exception catch (e) {
      print('MQTT Connection failed: $e');
      disconnect();
    }
  }

  void onConnected() {
    connectionState = MqttConnectionState.connected;
    print('MQTT Connected');
    subscribeToTopic(topic);
  }

  void onDisconnected() {
    connectionState = MqttConnectionState.disconnected;
    print('MQTT Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void disconnect() {
    client.disconnect();
    onDisconnected();
  }

  void subscribeToTopic(String topic) {
    if (connectionState == MqttConnectionState.connected) {
      client.subscribe(topic, MqttQos.atMostOnce);
    }
  }

  void publishMessage(String message) {
    if (connectionState == MqttConnectionState.connected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    }
  }
}
