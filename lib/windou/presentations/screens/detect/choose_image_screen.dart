import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/screens/detect/detect_screen.dart';

import '../../../core/constants/dimension_constants.dart';
import '../../../core/helper/assets_helper.dart';

class ChooseImageScreen extends StatefulWidget {
  const ChooseImageScreen({super.key});
  static final String routeName = 'ChooseImage_screen';

  @override
  State<ChooseImageScreen> createState() => _ChooseImageCreenState();
}

class _ChooseImageCreenState extends State<ChooseImageScreen> {
  void onPickImageSelected(String source) async {
    var imageSource;
    if (source == 'Camera') {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }
    try {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      final file = await _picker.pickImage(source: imageSource);
      if (file == null) {
        throw Exception('File is not available');
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetectScreen(
            path: file.path,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Phân loại rác thải',
            style: TextStyles.h3.bold.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 150,
          backgroundColor: ColorPalette.primaryColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50,),
              InkWell(
                borderRadius: kDefaultBorderRadius,
                onTap: () async {
                  onPickImageSelected('Gallery');
                },
                splashColor: Colors.blueAccent,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: kDefaultBorderRadius,
                      border: Border.all(color: Colors.black)),
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    children: [
                      Container(
                        child: ImageHelper.loadFromAsset(AssetHelper.gallery,
                            height: 30, width: 30),
                        padding: const EdgeInsets.only(right: 30, left: 30),
                      ),
                      Text(
                        "Chọn ảnh từ thư viện",
                        style: TextStyles.h5.copyWith(
                            color: ColorPalette.blackText,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                borderRadius: kDefaultBorderRadius,
                onTap: () async {
                  onPickImageSelected("Camera");
                },
                splashColor: Colors.blueAccent,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: kDefaultBorderRadius,
                      border: Border.all(color: Colors.black)),
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    children: [
                      Container(
                        child: ImageHelper.loadFromAsset(AssetHelper.camera,
                            height: 30, width: 30),
                        padding: const EdgeInsets.only(right: 30, left: 30),
                      ),
                      Text(
                        "Scan ảnh từ camera",
                        style: TextStyles.h5.copyWith(
                            color: ColorPalette.blackText,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
