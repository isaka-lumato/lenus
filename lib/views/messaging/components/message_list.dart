import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lenus1/models/messaging/messaging_model.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/messaging/components/chat_card.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<MessageData> messages = [];

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    final String response =
        await rootBundle.loadString('assets/data/json_dummy_data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      messages = data.map((json) => MessageData.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.pw16),
        width: double.infinity,clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.sp), topRight: Radius.circular(46.sp)),
          color: Colors.white,
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(top: AppConstants.ph16),
          physics: BouncingScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageCard(
              avatar: message.avatar,
              name: message.name,
              message: message.message,
              time: message.time,
            );
          },
        ),
      ),
    );
  }
}
