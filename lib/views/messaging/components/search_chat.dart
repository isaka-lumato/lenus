import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class SearchChat extends StatefulWidget {
  const SearchChat({super.key});

  @override
  State<SearchChat> createState() => _SearchChatState();
}

class _SearchChatState extends State<SearchChat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatPage());
      },
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.sp),
          color: Colors.black12,
        ),
        child: Icon(
          Icons.search,
          size: 30.sp,
          color: Colors.white54,
        ),
      ),
    );
  }
}
