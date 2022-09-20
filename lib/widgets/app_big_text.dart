import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class AppBigText extends StatelessWidget {
  AppBigText(
      {Key? key,
      required this.text,
      this.color,
      this.size,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.overflow})
      : super(key: key);

  final String text;
  Color? color;
  double? size;
  final int? maxLines;
  final TextOverflow? overflow;

  final TextAlign? textAlign;

  dynamic fontWeight;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.lato(
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: size ?? Dimensions.font22,
          color: color ?? Colors.black),
    );
  }
}
