import 'package:flutter/material.dart';

enum MessagingModelStatus {
  Ended,
  Loading,
  Error,
}

class MessagingModel extends ChangeNotifier {
  MessagingModelStatus _status;
  final String _errorCode;
  final String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  MessagingModelStatus get status => _status;

  MessagingModel()
      : _status = MessagingModelStatus.Loading,
        _errorCode = '',
        _errorMessage = '';

  MessagingModel.instance()
      : _status = MessagingModelStatus.Loading,
        _errorCode = '',
        _errorMessage = '' {
    //TODO Add code here
  }

  void getter() {
    _status = MessagingModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = MessagingModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = MessagingModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = MessagingModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = MessagingModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = MessagingModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = MessagingModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = MessagingModelStatus.Ended;
    notifyListeners();
  }
}

class MessageData {
  final String avatar;
  final String name;
  final String message;
  final String time;

  MessageData(
      {required this.avatar,
      required this.name,
      required this.message,
      required this.time});

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      avatar: json['avatar'],
      name: json['name'],
      message: json['message'],
      time: json['time'],
    );
  }
}
