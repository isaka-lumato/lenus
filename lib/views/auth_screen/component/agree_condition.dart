import 'package:flutter/material.dart';
import 'package:lenus1/utils/styles.dart';

agreeConditionWidget() {
  return
      // I agree to the term and conditions & policy

      Expanded(
    child: Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "I agree to the ",
              style: TextStyle(
                fontFamily: regular,
                color: Colors.black,
              )),
          TextSpan(
              text: "terms & condition",
              style: TextStyle(
                fontFamily: regular,
                color: Colors.black87,
              )),
          TextSpan(
              text: " & ",
              style: TextStyle(
                fontFamily: regular,
                color: Colors.black,
              )),
          TextSpan(
              text: "Privacy policy",
              style: TextStyle(
                fontFamily: regular,
                color: Colors.black87,
              )),
        ])),
      ],
    ),
  );
}
