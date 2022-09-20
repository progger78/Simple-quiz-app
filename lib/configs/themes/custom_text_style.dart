import 'package:flutter/material.dart';


import '../../utils/utils.dart';
import 'ui_configs.dart';

TextStyle cardTitles(BuildContext context) => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: getProportionateScreenHeight(18),
    color: UIparameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor);

const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(
    fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);
