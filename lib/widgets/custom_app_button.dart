import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/configs/themes/app_colors.dart';

import '../configs/themes/custom_text_style.dart';
import '../utils/utils.dart';

class CustomAppButton extends StatelessWidget {
  CustomAppButton(
      {Key? key,
      this.isEnabled = true,
      required this.press,
      required this.text,
      this.icon,
      this.iconWidth,
      this.iconColor,
      this.color,
      required this.textColor})
      : super(key: key);
  final bool isEnabled;
  final VoidCallback press;
  final String text;
  final Color? color;
  final Color? textColor;
  double? iconWidth;
  String? icon;
  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
          gradient: AppColors.kPrimaryGradient),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenHeight(15)))),
        onPressed: isEnabled ? press : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                width: iconWidth,
                color: iconColor,
              ),
            SizedBox(width: getProportionateScreenWidth(8)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: detailText.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(20),
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
