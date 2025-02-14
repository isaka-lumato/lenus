import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenus1/utils/app_color.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/messaging/components/headertext.dart';
import 'package:lenus1/views/messaging/components/message_list.dart';
import 'package:lenus1/views/messaging/components/search_chat.dart';
import 'package:lenus1/views/messaging/components/suggestion_chat.dart';

class MessagingView extends StatelessWidget {
  const MessagingView({super.key});

  @override
  Widget build(BuildContext context) {
          return const Messaging(); // Use const constructor for better performance
        }
  }

class Messaging extends StatefulWidget {
  const Messaging({super.key});

  @override
  MessagingState createState() => MessagingState();
}

class MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Headertext(),
            _searchSuggestChat(),
            MessageList(),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                Expanded(child: _bodyChat()),
                const SizedBox(height: 120),
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  Widget _topChat() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Fiona',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _iconButton(Icons.call),
              const SizedBox(width: 20),
              _iconButton(Icons.videocam),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black12,
      ),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }

  Widget _bodyChat() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6, // Replace with dynamic count
        itemBuilder: (context, index) {
          return _itemChat(
            avatar: 'assets/image/5.jpg',
            chat: index % 2, // Alternate chat for example
            message: 'Sample message $index',
            time: '18.00',
          );
        },
      ),
    );
  }

  Widget _itemChat({
    required int chat,
    required String avatar,
    required String message,
    required String time,
  }) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Avatar(
          image: avatar,
          size: 50,
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text(message),
          ),
        ),
        if (chat == 1)
          Text(
            time,
            style: TextStyle(color: Colors.grey.shade400),
          ),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigo,
                ),
                padding: const EdgeInsets.all(14),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final String image;
  final EdgeInsets margin;

  const Avatar({
    super.key,
    required this.image,
    this.size = 50,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

Widget _searchSuggestChat() {
  return Row(
    children: [
      const SearchChat(),
      SizedBox(width: AppConstants.pw10),
      const SuggestionChat(),
    ],
  ).marginOnly(left: AppConstants.pw16);
}
