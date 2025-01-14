import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<IconModel> icons;
  final ValueChanged<int>? onTap;
  const AnimatedBottomBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .map(
                (icon) => GestureDetector(
                  onTap: () => onTap?.call(icon.id),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 900),
                    child: Icon(
                      icon.icon,
                      size: currentIcon == icon.id ? 26 : 23,
                      color:
                          currentIcon == icon.id ? primaryColor : Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
