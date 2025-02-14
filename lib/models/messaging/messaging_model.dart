class Message {
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });

  // Add a fromJson and toJson method for Firestore or your backend
  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'receiverId': receiverId,
        'text': text,
        'timestamp': timestamp.millisecondsSinceEpoch,
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        text: json['text'],
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
      );
}

class MessageData {
  final String avatar;
  final String name;
  final String message;
  final String time;

  MessageData({
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      avatar: json['avatar'],
      name: json['name'],
      message: json['message'],
      time: json['time'],
    );
  }
}
