import 'package:flutter/material.dart';
import 'package:windou/windou/core/helper/assets_helper.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/screens/account/login_screen.dart';
import 'package:windou/windou/presentations/screens/account/signUp_screen.dart';

import '../../../core/constants/color_palatte.dart';
import '../../widgets/button_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static final String routeName = 'onboarding_screen';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              
              Text('Chào mừng tới Windou',
                  style: TextStyles.h5.copyWith(color: ColorPalette.grayText)),
              const SizedBox(
                height: 30,
              ),
              
              Text('Quản lý rác thải \nmột cách tiện lợi',
                  style: TextStyles.h1.copyWith(fontWeight: FontWeight.bold, fontSize: 36)),
              Expanded(
                  child: ImageHelper.loadFromAsset(AssetHelper.onboardingImage)),
              ButtonWidget(
                label: 'Đăng nhập',
                color: ColorPalette.primaryColor,
                textColor: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                label: 'Đăng kí tài khoản',
                color: ColorPalette.lightGreen,
                textColor: ColorPalette.greenText,
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              ),
              
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
