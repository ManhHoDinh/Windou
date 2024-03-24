// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/models/garbage/garbage.dart';

import '../../core/constants/dimension_constants.dart';

class GarbageItem extends StatefulWidget {
  GarbageModel garbage;
  GarbageItem({super.key, required this.garbage});

  @override
  State<GarbageItem> createState() => _GarbageItemState();
}

class _GarbageItemState extends State<GarbageItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorPalette.grayText),
        ),
        child: Column(
          children: [
            Container(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                 child: ImageHelper.loadFromNetwork(widget.garbage.imageLink)),
            Text(widget.garbage.name),
            Text(widget.garbage.price.toString()+"/1Kg"),
          ],
        ),
      ),
    );
  }
}
