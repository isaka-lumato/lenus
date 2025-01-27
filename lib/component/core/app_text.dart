import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';

class TitleText1 extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  const TitleText1(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w800,
      this.fontFamily});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontFamily: fontFamily));
  }
}

class FeaturedProductBanner extends StatelessWidget {
  const FeaturedProductBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.5.h),
      decoration: BoxDecoration(
          // color: Vx.green400,
          border: Border.all(
            color: Vx.green500,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(99.r)),
      child: 'Featured'
          .text
          .heightTight
          .color(textDark)
          .make(),
    ).px12();
  }
}

class ProductPriceText extends StatelessWidget {
  final String priceText;
  const ProductPriceText({super.key, required this.priceText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "\$".text.textStyle(AppTheme.h4Style).medium.heightTight.make(),
        priceText.numCurrency.text
            .textStyle(AppTheme.h4Style)
            .heightTight
            .make(),
      ],
    );
  }
}

class ProductNameText extends StatelessWidget {
  final String productNameText;
  const ProductNameText({super.key, required this.productNameText});

  @override
  Widget build(BuildContext context) {
    return productNameText.text
        .textStyle(AppTheme.h3Style)
        .overflow(TextOverflow.ellipsis).maxLines(1)
        .heightTight
        .make()
        .box
        .width(AppConstants.fullWidth() * 0.65)
        .make();
  }
}

class AppMainHeader extends StatelessWidget {
  final String storeName;
  final String pageName;
  const AppMainHeader({super.key, required this.storeName, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppConstants.fullWidth(),
        margin: AppTheme.hPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText1(
              text: storeName,
              fontSize: 27.sp,
              fontWeight: FontWeight.w400,
            ),
            TitleText1(
              text: pageName,
              fontSize: 27.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ));
  }
}


class AppWidgetHeader extends StatelessWidget {
    final String widgetHeader;
  const AppWidgetHeader({super.key, required this.widgetHeader});

  @override
  Widget build(BuildContext context) {
    return widgetHeader.text
        .fontFamily(bold)
        .heightTight
        .size(24.sp)
        .color(textDark)
        .make()
        .pOnly(left: 12.w, bottom: 12.h, top: 20.h);
  }
}

