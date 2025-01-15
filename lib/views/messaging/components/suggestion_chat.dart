import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/views/messaging/messaging_view.dart';

class SuggestionChat extends StatefulWidget {
  const SuggestionChat({super.key});

  @override
  State<SuggestionChat> createState() => _SuggestionChatState();
}

class _SuggestionChatState extends State<SuggestionChat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100.h,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Avatar(
              margin: EdgeInsets.only(right: AppConstants.pw10),
              image: 'assets/image/${index + 1}.jpg',
            );
          },
        ),
      ),
    );
  }
}
