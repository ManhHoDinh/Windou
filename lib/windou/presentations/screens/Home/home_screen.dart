import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/widgets/garbageButton.dart';
import 'package:windou/windou/presentations/widgets/icon_text_button.dart';

import '../../../../app_theme.dart';
import '../../../../model/homelist.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../../core/models/firebase/firebase_request.dart';
import '../../../core/models/garbage/garbage.dart';
import '../account/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.animationController});
  static final String routeName = 'home_screen';
  final AnimationController? animationController;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
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
                  appBar(),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: IconTextButtonWidget(
                                    label: "Rút tiền",
                                    icon: AssetHelper.TopUp,
                                    onTap: () {})),
                            Expanded(
                                child: IconTextButtonWidget(
                                    label: "Phân loại",
                                    icon: AssetHelper.WithDraw,
                                    onTap: () {})),
                            Expanded(
                                child: IconTextButtonWidget(
                                    label: "Chia sẻ",
                                    icon: AssetHelper.Share,
                                    onTap: () {}))
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Bảng giá phế liệu",
                              style: TextStyles.h3
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            )),
                             SizedBox(height: 20,),
                       
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: StreamBuilder<List<GarbageModel>>(
                                                  stream: FireBaseDataBase.readGarbages(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasError) {
                                                      return Center(
                                                        child:
                                  Text('Something went wrong! ${snapshot.error}'),
                                                      );
                                                    } else if (snapshot.hasData) {
                                                      return GridView.count(
                                padding:
                                    const EdgeInsets.only(bottom: kMediumPadding),
                                crossAxisCount: 3,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 24,
                                childAspectRatio: 0.7,
                                children: snapshot.data!
                                    .map((e) => GarbageItem(
                                          garbage: e,
                                        ))
                                    .toList());
                                                    } else
                                                      return Container();
                                                  }),
                              ),
                            ),
                      ],
                    ),
                  )),
                SizedBox(height: 60,)],
              ),
            );
          }
        },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Container(
                  width: AppBar().preferredSize.height - 8,
                  height: AppBar().preferredSize.height - 8,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Home Screen',
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
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                      child: Icon(
                        multiple ? Icons.dashboard : Icons.view_agenda,
                        color: AppTheme.white,
                      ),
                      onTap: () {
                        setState(() {
                          multiple = !multiple;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Gọi chức năng tìm kiếm
                  },
                  icon: const Icon(Icons.search),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
                ImageHelper.loadFromAsset(
                  AssetHelper.banner,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
