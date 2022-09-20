import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/utils.dart';

class CustomTextFieldIcon extends StatelessWidget {
  const CustomTextFieldIcon({
    Key? key,
    required this.svgIcon, this.height,
  }) : super(key: key);

  final String svgIcon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.width15,
          right: Dimensions.width10,
          top: Dimensions.height15,
          bottom: Dimensions.height15),
      child: SvgPicture.asset(
        
        svgIcon,
        height: height ?? Dimensions.height25,
        color: Colors.black,
      ),
    );
  }
}
