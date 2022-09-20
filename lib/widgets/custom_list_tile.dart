import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'app_big_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: AppBigText(
        text: title,
        size: getProportionateScreenHeight(22),
      ),
    );
  }
}
