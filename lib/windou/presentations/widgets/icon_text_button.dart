import 'package:flutter/material.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/constants/dimension_constants.dart';
import 'package:windou/windou/core/helper/image_helper.dart';

import '../../core/helper/text_styles.dart';

class IconTextButtonWidget extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;
  Color? textColor;
  IconTextButtonWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kDefaultBorderRadius,
      onTap: onTap,
      child: Column(
        children: [
          ImageHelper.loadFromAsset(icon, width: 72, height: 72),
          SizedBox(height: 10,),
          Text(label)
        ],
      ),
    );
  }
}
