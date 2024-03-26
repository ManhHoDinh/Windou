import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/screens/detect/choose_image_screen.dart';
import 'package:windou/windou/presentations/widgets/button_widget.dart';
import 'package:windou/windou/presentations/widgets/garbageButton.dart';
import 'package:windou/windou/presentations/widgets/icon_text_button.dart';

import '../../../../app_theme.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../../core/models/firebase/firebase_request.dart';
import '../../../core/models/garbage/garbage.dart';
import '../account/login_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen(
      {super.key, this.animationController, required this.price});
  static final String routeName = 'Confirm_screen';
  final AnimationController? animationController;
  final int price;
  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: ColorPalette.appBarHeaderColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 8),
                              child: Container(
                                width: AppBar().preferredSize.height - 8,
                                height: AppBar().preferredSize.height - 8,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: AppTheme.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    'Bước 2: Carbon credit',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: isLightMode
                                          ? AppTheme.white
                                          : AppTheme.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 8),
                              child: Container(
                                width: AppBar().preferredSize.height - 8,
                                height: AppBar().preferredSize.height - 8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "#TR-109092021",
                          style: TextStyles.h6.grayText,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.price.toString(),
                          style: TextStyles.h1.bold,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: ColorPalette.grayText)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Tài khoản",
                                style: TextStyles.h5,
                              ),
                              Spacer(),
                              Text("Anh Minh", style: TextStyles.h5.bold)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: ColorPalette.grayText)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Mã ID",
                                style: TextStyles.h5,
                              ),
                              Spacer(),
                              Text("3839284832949797",
                                  style: TextStyles.h5.grayText)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: ColorPalette.grayText)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Ngày khởi tạo ",
                                style: TextStyles.h5,
                              ),
                              Spacer(),
                              Text("Sep 9, 2021", style: TextStyles.h5.bold)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: Text(
                          "Bạn có muốn dùng tín chỉ lên sàn không hoặc nhận certificate",
                          textAlign: TextAlign.center,
                          style: TextStyles.h6
                              .copyWith(color: ColorPalette.greenText),
                        )),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                  label: "Nhận cert",
                                  color: Color(0xFFE1FFE3),
                                  textColor: Color(0xff1BAE76),
                                  onTap: () {}),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ButtonWidget(
                                  label: "Lên sàn",
                                  textColor: Colors.white,
                                  color: ColorPalette.primaryColor,
                                  onTap: () {}),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
