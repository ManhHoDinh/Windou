import 'package:flutter/material.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';

import '../../../core/helper/assets_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashCreenState();
}

class _SplashCreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ImageHelper.loadFromAsset(AssetHelper.splashImage,
                    height: size.width * 7 / 8, width: size.width * 7 / 8),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Text('Quản lý rác thải', style: TextStyle(fontSize: 20, color: ColorPalette.primaryColor))),
              
            ],
          ),
        ));
  }
}
