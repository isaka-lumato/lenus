import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenus1/utils/app_color.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/chat/chat_screen.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class MessageCard extends StatelessWidget {
  final String avatar, name, message, time;
  const MessageCard(
      {super.key,
      required this.avatar,
      required this.name,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatScreen());
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: AppConstants.ph8),
        elevation: 0,
        child: Row(
          children: [
            Avatar(
              margin: EdgeInsets.only(right: AppConstants.pw16),
              size: 60,
              image: avatar,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: AppConstants.fs16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: AppConstants.fs12,
                            color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.ph8,
                  ),
                  Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppConstants.fs14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
