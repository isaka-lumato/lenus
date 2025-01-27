import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lenus1/component/loading_indicator.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double radius;
  final bool isProduct;
  final bool isStoreImage;

  const AppImage(
      {super.key,
      required this.imageUrl,
      this.radius = 10,
      this.width = 50,
      this.height = 50,
      this.isProduct = false,
      this.isStoreImage = false});

  @override
  Widget build(BuildContext context) {
    const double storeImage = 60;
    const double productImage = 70;
    return Container(
      width: isProduct == true
          ? productImage.w
          : isStoreImage == true
              ? storeImage.w
              : width.w,
      height: isProduct == true ? productImage.w : isStoreImage == true
              ? storeImage.h
              :  height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => loadingIndicator(),
        errorWidget: (context, url, error) {
          if (kDebugMode) {
            print('Failed to load image from $url: $error');
          }
          return const Icon(Icons.error);
        },
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius.r),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}




