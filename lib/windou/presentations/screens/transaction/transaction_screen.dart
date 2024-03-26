import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/screens/detect/choose_image_screen.dart';
import 'package:windou/windou/presentations/screens/transaction/confirm_transaction.dart';
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

class TransactionScreen extends StatefulWidget {
  const TransactionScreen(
      {super.key, this.animationController, required this.garbageItem});
  static final String routeName = 'Transaction_screen';
  final AnimationController? animationController;
  final GarbageModel garbageItem;
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
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

  int count = 1;
  Widget garBageItem() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ImageHelper.loadFromNetwork(widget.garbageItem.imageLink),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.garbageItem.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.garbageItem.price + "đ/kg",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                if (count > 1)
                  setState(() {
                    count--;
                  });
              },
              icon: Icon(Icons.remove),
            ),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
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
                  appBar(),
                  Expanded(
                      child: Container(
                    color: ColorPalette.backgroundColor,
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            garBageItem(),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 16),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Thời gian thu gom",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.navigate_next))
                                  ],
                                ),
                                Row(
                                  children: [
                                    buttonEdit(
                                        Icons.note_alt, "Ngày trong tuần"),
                                    Spacer(),
                                    buttonEdit(Icons.note_alt, "Cuối tuần")
                                  ],
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tổng', style: TextStyles.h5.bold),
                                Text(
                                  (count * int.parse(widget.garbageItem.price))
                                          .toString() +
                                      'đ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonWidget(
                                label: "Xác nhận",
                                color: ColorPalette.primaryColor,
                                textColor: Colors.white,
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ConfirmScreen(
                                      price: count *
                                          int.parse(widget.garbageItem.price),
                                    );
                                  }));
                                })
                          ]),
                        )),
                  )),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buttonEdit(IconData icon, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorPalette.primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyles.h6,
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
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
                      'Bước 1: Xác nhận giao dịch',
                      style: TextStyle(
                        fontSize: 22,
                        color: isLightMode ? AppTheme.white : AppTheme.white,
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
          Container(
            height: 250,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(
                        color: ColorPalette.backgroundColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Địa chỉ",
                          style: TextStyles.h4.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Anh Minh",
                          style: TextStyles.h4.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "VinUniversity",
                          style: TextStyles.h5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: buttonEdit(
                                    Icons.note_alt, "Chỉnh sửa địa điểm")),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: buttonEdit(Icons.description, "Note")),
                          ],
                        ),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
