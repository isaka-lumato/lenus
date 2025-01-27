import 'package:flutter/material.dart';

Widget hideKeyboard({Widget? child, required BuildContext context}) {
  return FocusScope(
              child: GestureDetector(
                onTap: () {
                  // call this method here to hide soft keyboard
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: child));}