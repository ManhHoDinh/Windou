import 'package:flutter/material.dart';
import 'package:windou/windou/presentations/screens/account/login_screen.dart';

import '../../../core/constants/color_palatte.dart';
import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../../core/helper/image_helper.dart';
import '../../../core/helper/text_styles.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String routeName = 'sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool isChecked = true;

  final formSignInKey = GlobalKey<FormState>();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorPalette.primaryColor;
    }
    return ColorPalette.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Form(
              key: formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "Bắt đầu",
                      style: TextStyles.h2.copyWith(
                          color: ColorPalette.blackText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "Tạo tài khoản đến bước tiếp theo!",
                      style:
                          TextStyles.h5.copyWith(color: ColorPalette.grayText),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _nameController,
                      labelText: 'Họ và tên',
                      icon: AssetHelper.icoUser,
                      validator: (input) {
                        if (input?.isEmpty ?? true) {
                          return "Vui lòng nhập tên!";
                        }
                      }),
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
                          return "Email không tồn tại!";
                        }
                      }),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _phoneNumberController,
                      labelText: 'Số điện thoại',
                      icon: AssetHelper.icoPhoneNumber,
                      validator: (input) {
                        final bool phoneValid =
                            RegExp(r'(^(?:[+0]9)?[0-9]{10,11}$)')
                                .hasMatch(input!);
                        if (input.isEmpty) {
                          return "Vui lòng nhập số điện thoại!";
                        } else if (!phoneValid) {
                          return "Số điện thoại không hợp lệ!";
                        }
                      }),
                  SizedBox(height: 20),
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
                    height: 20,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input == "") {
                        return "Vui lòng xác nhận mật khẩu!";
                      } else if (input != null && input.length <= 6) {
                        return "Mật khẩu quá ngắn!";
                      } else if (_confirmPasswordController.text !=
                          _passwordController.text) {
                        return "Xác nhận mật khẩu không khớp!";
                      } else
                        return null;
                    },
                    obscureText: !_confirmPasswordVisible,
                    controller: _confirmPasswordController,
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
                          _confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                      labelText: 'Xác nhận mật khẩu',
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
                    height: 20,
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => getColor(states)),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          );
                        },
                      ),
                      Text(
                        'Bằng cách tạo tài khoản, bạn đồng ý \n với điều khoản của chúng tôi',
                        style: TextStyles.h6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    label: 'Đăng ký',
                    color: ColorPalette.primaryColor,
                    textColor: Colors.white,
                    onTap: () async {
                      if (formSignInKey.currentState!.validate()) {
                        await AuthServices.signUpUser(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            phoneNo: _phoneNumberController.text,
                            buildContext: context);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đã có tài khoản?",
                        style: TextStyles.h6.setColor(ColorPalette.grayText),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, LoginScreen.routeName);
                          },
                          child: Text("Đăng nhập",
                              style: TextStyles.h6
                                  .setColor(ColorPalette.greenText)))
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
