import 'package:flutter/material.dart';
import 'package:windou/windou/core/constants/color_palatte.dart';
import 'package:windou/windou/core/helper/image_helper.dart';
import 'package:windou/windou/core/helper/text_styles.dart';
import 'package:windou/windou/presentations/screens/account/signUp_screen.dart';
import 'package:windou/windou/presentations/widgets/button_widget.dart';

import '../../../core/constants/dimension_constants.dart';
import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static final String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  final formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
          onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Form(
              key: formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chào bạn quay trở lại",
                      style:
                          TextStyles.h1.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    "Đăng nhập vào tài khoản",
                    style: TextStyles.h4.copyWith(color: ColorPalette.grayText),
                  ),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: AssetHelper.icoEmail,
                      validator: (input) {
                        final bool emailValid = RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(input!);
                        if (input.isEmpty) {
                          return "Vui lòng nhập email!";
                        } else if (!emailValid) {
                          return "Email không tồn tại";
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input == "") {
                        return "Vui lòng nhập mật khẩu!";
                      } else if (input != null && input.length <= 6) {
                        return "Mật khẩu quá ngắn!";
                      } else
                        return null;
                    },
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorPalette.bgTextFieldColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      labelText: 'Mật khẩu',
                      labelStyle: TextStyles.h6.setColor(ColorPalette.grayText),
                      contentPadding: const EdgeInsets.only(bottom: 14),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Container(
                        child: Image.asset(AssetHelper.icoLock),
                        padding: const EdgeInsets.only(right: 20, left: 20),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Quên mật khẩu?",
                          textAlign: TextAlign.right,
                          style: TextStyles.h5
                              .copyWith(color: ColorPalette.primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: kDefaultBorderRadius,
                    onTap: ()async {
                      await AuthServices.siginWithGoogle( context);
                    },
                    splashColor: Colors.blueAccent,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: kDefaultBorderRadius,
                          border: Border.all(color: Colors.black)),
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Row(
                        children: [
                          Container(
                            child: ImageHelper.loadFromAsset(
                                AssetHelper.icoGoogle,
                                height: 24,
                                width: 24),
                            padding: const EdgeInsets.only(right: 30, left: 30),
                          ),
                          Text(
                            "Đăng nhập bằng Google",
                            style: TextStyles.h5.copyWith(
                                color: ColorPalette.blackText,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    label: 'Đăng nhập',
                    color: ColorPalette.primaryColor,
                    textColor: Colors.white,
                    onTap: () async {
                      if (formSignInKey.currentState!.validate()) {}
                       await AuthServices.signinUser(_emailController.text,
                              _passwordController.text, context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyles.h6.setColor(ColorPalette.grayText),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.routeName);
                          },
                          child: Text("Đăng ký",
                              style: TextStyles.h6
                                  .setColor(ColorPalette.grayText)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
