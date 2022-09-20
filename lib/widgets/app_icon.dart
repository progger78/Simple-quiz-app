import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../utils/utils.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.svgIcon}) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        height: getProportionateScreenHeight(35),
        width: getProportionateScreenWidth(35),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(255, 236, 236, 236)),
        child: SvgPicture.asset(svgIcon),
      ),
      //TODO create splash effect for icons
    ]);
  }
}
